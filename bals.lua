local bals = {}

-- Outpost Balance Functionality


function bals.query()
    local ret = (op.bals.balance and 'bal' or '') .. (op.bals.equilibrium and 'eq' or '')
    if ret == 'baleq' then return 'both' end
    if ret == '' then return 'none' end
    return ret                                                                                                                                                                    
end

function bals.has()
    return bals.query() == 'both' and true or false
end