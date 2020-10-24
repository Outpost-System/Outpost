local qm = {}


-- Original code from Mudlet forums user 'Oneymus'
-- https://forums.mudlet.org/viewtopic.php?f=6&t=2128


-- Outpost command queue.


qm.Check = function ()
    if not next(op.balqueue.queue) then return end
    if utils.countTable(op.balqueue.queue) >=1 then
        if bals:has() then
            op.balqueue:act()
        end
        --send("\n")
    end
end

qm.Utility = {}

function qm.Utility.getField(field)
    local value = _G
    for key in field:gfind("[%w_]+") do
        value = value[key]
    end
    return value
end

qm.Queue = {
    balance = "",
    queue = {},
    options = {},

    add = function (self, actions)
        assert( actions, "Queue: You must pass an action to be queued." )
        assert( table.contains( {"table", "string", "function"}, type( actions ) ), "Queue: The actions you pass must be a table, a string, or a function." )

        if type( actions ) == "table" then
            if actions.consumed or actions.required then
                assert( actions.code, "Queue: You must provide a code field in the actions table for this action." )
                assert( table.contains( {"table", "string", "function"}, type( actions.code ) ), "Queue: The code you pass with an action must be a table, a string, or a function." )

                if actions.consumed then
                    assert( not table.contains( {"boolean", "number"}, actions.consumed ), "Queue: The consumed balance for this action must be a string, a table of strings, a function, or a table of functions." )
                end
            else
                local new_actions = {}
                new_actions.code = actions

                actions = new_actions
            end
        elseif type( actions ) == "string" or type( actions ) == "function" then
            local new_actions = {}
            new_actions.code = actions

            actions = new_actions
        end 

        if not actions.consumed and not actions.required then
            actions.required = self.balance
        end

        table.insert( self.queue, actions )
    end, 

    reset = function (self)
        self.queue = {}
    end,

    act = function (self)
        local has_balance = true

        if type( self.balance ) == "table" then
            for _,balance in pairs( self.balance ) do
                if type( balance ) == "string" then
                    if not qm.Utility.getField( balance ) then
                        has_balance = false
                    end
                elseif type( balance ) == "function" then
                    has_balance = balance()
                end
            end
        elseif type( self.balance ) == "string" then
            if not qm.Utility.getField( self.balance ) then
                has_balance = false
            end
        elseif type( self.balance ) == "boolean" then
            if not self.balance then
                has_balance = false
            end
        elseif type( self.balance ) == "function" then
            has_balance = self.balance()
        end

        if has_balance then
            if #self.queue > 0 then
                local action = self.queue[1]
                local action_index
                if not table.contains( self.options, "strict_order" ) then
                    if #self.queue > 1 then
                        for i=1,#self.queue do
                            if not self.queue[i].consumed then
                                action = self.queue[i]
                                action_index = i
                                break
                            end
                        end
                    end
                end

                local will_action = true
                for _,check in pairs( {"required", "consumed"} ) do
                    local action_check = action[check]

                    if action_check then
                        if type( action_check ) == "table" then
                            for _,balance in pairs( action_check ) do
                                if type( balance ) == "string" then
                                    if not qm.Utility.getField( balance ) then
                                        will_action = false
                                    end
                                elseif type( balance ) == "function" then
                                    will_action = balance()
                                end
                            end
                        elseif type( action_check ) == "string" then
                            if not qm.Utility.getField( action_check ) then
                                will_action = false
                            end
                        elseif type( action_check ) == "function" then
                            will_action = action_check()
                        end
                    end
                end

                if will_action and fs:check('queue') then
                    fs:on('queue', 0.02)
                    local code = action.code
                    if type( code ) == "table" then
                        for _,each_code in pairs( code ) do
                            if type( each_code ) == "function" then
                                each_code()
                            elseif type( each_code ) == "string" then
                                if next(each_code) then e:debug("Sending ("..each_code..") via the do queue") end
                                send( each_code )
                            end
                        end
                    elseif type( code ) == "function" then
                        code()
                    elseif type( code ) == "string" then
                        e:debug("Sending ("..code..") via the do queue")
                        send( code )
                    end

                    table.remove( self.queue, action_index or 1 )

                    if action.consumed then
                        local consumed = action.consumed

                        if type( consumed ) == "table" then
                            tempTimer( 0.5, function ()
                                local react = 0
                                for _,balance in pairs( consumed ) do
                                    if type( balance ) == "string" then
                                        if qm.Utility.getField( balance ) then
                                            react = react + 1
                                        end
                                    elseif type( balance ) == "function" then
                                        if balance() then
                                            react = react + 1
                                        end
                                    end
                                end
                                if react == #consumed then
                                    table.insert( self.queue, 1, action )
                                    self:act()
                                end
                            end )
                        else
                            tempTimer( 0.5, function ()
                                if type( consumed ) == "string" then
                                    if qm.Utility.getField( consumed ) then
                                        table.insert( self.queue, 1, action )
                                        self:act()
                                    end
                                elseif type( consumed ) == "function" then
                                    if consumed() then
                                        table.insert( self.queue, 1, action )
                                        self:act()
                                    end
                                end
                            end )
                        end
                    elseif #self.queue > 0 then
                        if not table.contains( self.options, "single_step" ) then
                            self:act()
                        end
                    end
                else
                    --assert( false, "Queue: Action could not be completed. Check the balance for this action." )
                end
            else
                assert( false, "Queue: There are no actions in this queue." ) -- probably dont need this?
            end 
        else
            --assert( false, "Queue: You do not have the proper balance for this queue." )
        end 
    end, 

    new = function (self, balance, options)
        assert( balance, "Queue: You must define a balance when instantiating a new queue." )
        assert( type( balance ) ~= "number", "Queue: The defined balance for this queue must be a string, a table of strings, a function, a table of functions, or a boolean value." )
        if options then
            local allowed_options = {"strict_order", "single_step"}

            assert( table.contains( {"table", "string"}, type(options) ), "Queue: The options for this Queue must be passed as a table or a single string." )
            if type( options ) == "table" then
                for key in pairs( options ) do
                    assert( table.contains( allowed_options, key ), "Queue: Invalid option passed to new Queue." )
                end
            else
                assert( table.contains( allowed_options, options ), "Queue: Invalid option passed to new Queue." )
            end
        end

        local new_queue = {}
        for field in pairs( self ) do
            new_queue[field] = self[field]
        end
        new_queue.balance = balance
        if options then
            if type( options ) ~= "table" then
                new_queue.options = {options}
            else
                new_queue.options = options
            end
        end

        return new_queue
    end, 
}


op.balqueue = qm.Queue:new({"op.bals.balance", "op.bals.equilibrium", "op.bals.psiid", "op.bals.psisub", "op.bals.psisuper"})
op.beastqueue = qm.Queue:new({"op.bals.beast"})
op.pookaqueue = qm.Queue:new({"op.bals.pooka"})
op.healingqueue = qm.Queue:new({"op.bals.heal"})
op.nihitailqueue = qm.Queue:new({"op.bals.nihitail"})
op.timeslipqueue = qm.Queue:new({"op.bals.timeslip"})
op.hexesqueue = qm.Queue:new({"op.bals.hexes"})
op.orgpotionqueue = qm.Queue:new({"op.bals.orgpotion"})


return qm