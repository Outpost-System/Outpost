local ndb = {}

-- Outpost Player Database Functionality

-- Credit for most of this code goes to Vadi@Mudlet. Thanks :)

ndb.conf = {}
ndb.conf.orgpolitics = {}
ndb.version = "0.2.0"
ndb.valid = {}

ndb.valid.orgs = {
    "Magnagora", "New Celest", "Hallifax", "Gaudiguch", "Glomdoring", "Serenwilde"
}

ndb.valid.guilds = {
    "Listeners", "Sowers", "Wodewoses", "Swarm", "Auguries", "Thornwatch", "Archons", "Ecclesiarchy", "Sanctifiers", "Infernals", "Society", "Herald", "Goonsquad", "Revelry", "Seekers", "Adherents", "Aerie", "Consortium",
}

ndb.schema = {
    people = {
        name = "",
        fullname = "", -- title
        level = "",
        faction = "", -- currently just shows org
        org = "",
        guild = "", -- probably needs to be changed with factions
        orgenemy = 0,
        divine = 0,
        
        _unique = {"name"},
        _violations = "REPLACE"
    },
}

function ndb.init()
    ndb.db = db:create("ndb", ndb.schema)
    -- necessary on Windows, because its IO tends to... slow down with time.
    -- http://www.sqlite.org/pragma.html#pragma_synchronous
    db.__conn["ndb"]:execute("pragma synchronous = OFF")
    
    -- shuffle Celestians into New Celest as they should be
    local c = #(db:fetch(ndb.db.people, db:eq(ndb.db.people.org, "Celest")))
    if c ~= 0 then
        -- wait for ndb.fixed_set to be loaded
        tempTimer(0, [[ndb.fixed_set(ndb.db.people.org, "New Celest", db:eq(ndb.db.people.org, "Celest")); e:echo("Migrated ]]..c..[[ Celestians into New Celest as they should be.")]])
    end
end

function ndb.isvalidorg(which)
    which = which:title()
    return table.contains(ndb.valid.orgs, which) and true or false
end

function ndb.isvalidguild(which)
    which = which:lower()
    return table.contains(ndb.valid.guilds, which) and true or false
end

function ndb.download(name)
    assert(name)
    
    local name = name:title()
    local path = getMudletHomeDir() .. "/ndb"
    
    if not lfs.attributes(path) then
        lfs.mkdir(path)
        e:echo("Made folder")
    else
        ndb.decho("Downloading " .. name)
        downloadFile(path .. "/" .. name .. ".json", "http://api.lusternia.com/characters/" .. name .. ".json")
    end
end

function ndb.downloaddone(_, filepath)
    ndb.decho("Download done at: " .. filepath)
    if not filepath:find("ndb", 1, true) then return end
    
    local f = io.open(filepath, "r")
    local s = f:read("*a")
    
    local t = yajl.to_value(s)
    f:close()
    
    local div = 0
    if level == "Infinite" then
        div = 1
    end
    
    local enemy = 0
    if table.contains(ndb.enemylist, t.name) then
        enemy = 1
    end
    local person = {{name = t.name, fullname = t.fullname, level = t.level, faction = t.faction:title(), org = t.city:title(), guild = t.guild:title(), divine = div, orgenemy = enemy}}
    -- Fix for Celestians
    if person[1].org == "Celest" then
        person[1].org = "New Celest"
        person[1].faction = "New Celest"
    end
    
    if person[1].org == "(none)" then
        person[1].org = ""
        person[1].faction = ""
    end
    
    db:merge_unique(ndb.db.people, person)
    
    ndb.decho("Added " .. t.name .. " to ndb")
    raiseEvent("NameDB download done", t.name)
end

function ndb.downloaderror(_, filepath)
    ndb.decho("Download error")
    if filepath:match("server replied: Not Found") then
        local name = filepath:match("/(%a+).json")
        ndb.decho("Person does not exist: " .. name)
        db:delete(ndb.db.people, db:eq(ndb.db.people.name, name))
    else
        ndb.decho("Some other error downloading: " .. filepath)
    end
end

function ndb.decho(text)
    if not ndb.conf or not ndb.conf.debug or ndb.conf.debug == 0 then return end
    cecho("\n<white>[<red>ndb debug<white>]: <white>" .. text)
    echo("\n")
end

function ndb.decho2(text)
    if not ndb.conf.debug or ndb.conf.debug == 0 then return end
    cecho("\n<white>[<red>ndb debug<white>]: <white>" .. text)
end

function ndb.loadconfigs()
    ndb.conf = {}
    local path = getMudletHomeDir() .. "/ndb/conf"
    local is_file = io.open(path)
    if is_file then
        table.load(path, ndb.conf)
    end
    
    e:echo("Configs loaded")
    
    -- set defaults if necessary
    ndb.conf.defaultcolor = ndb.conf.defaultcolor or "gray" -- default colors for highlighting
    ndb.conf.configcolor = ndb.conf.configcolor or "white" --  used in echoes
    ndb.conf.debug = ndb.conf.debug or 0 -- debug mode
    
    ndb.conf.home = ndb.conf.home or ""
    if gmcp.Char then
        ndb.conf.home = string.match(gmcp.Char.Status.city, "(%w+ ?%w+) %(")
    end
    
    ndb.decho("before divine")
    -- divine
    ndb.conf.highlightdivine = ndb.conf.highlightdivine or false
    ndb.conf.bolddivine = ndb.conf.bolddivine or false
    ndb.conf.underlinedivine = ndb.conf.underlinedivine or false
    ndb.conf.italicizedivine = ndb.conf.italicizedivine or false
    
    ndb.decho("after divine")
    -- rogues
    ndb.conf.highlightrogues = ndb.conf.highlightrogues or false
    ndb.conf.boldrogues = ndb.conf.boldrogues or false
    ndb.conf.underlinerogues = ndb.conf.underlinerogues or false
    ndb.conf.italicizerogues = ndb.conf.italicizerogues or false
    
    -- org enemies
    ndb.conf.highlightorgenemies = ndb.conf.highlightorgenemies or false
    ndb.conf.boldorgenemies = ndb.conf.boldorgenemies or false
    ndb.conf.underlineorgenemies = ndb.conf.underlineorgenemies or false
    ndb.conf.italicizeorgenemies = ndb.conf.italicizeorgenemies or false
    
    -- org
    ndb.conf.orgpolitics = {}
    for _, org in pairs(ndb.valid.orgs) do
        ndb.conf.orgpolitics[org] = "neutral"
        
        org = org:lower():gsub(" ", "")
        ndb.conf[org.."color"] = ndb.conf[org.."color"] or ndb.conf.defaultcolor
        ndb.conf["highlight"..org] = ndb.conf["highlight"..org] or false
        ndb.conf["bold"..org] = ndb.conf["bold"..org] or false
        ndb.conf["underline"..org] = ndb.conf["underline"..org] or false
        ndb.conf["italicize"..org] = ndb.conf["italicize"..org] or false
    end
end

function ndb.saveconfigs()
    local path = getMudletHomeDir() .. "/ndb/conf"
    table.save(path, ndb.conf)
    e:echo("Configs saved")
end

function ndb.showconfigs()
    e:echo("Outpost character database")
    e:shortecho("Currently highlighting " .. table.size(ndb.highlightIds) .. " names in the database")
    e:shortecho("Click on underlined to change, ")
    fg("white")
    setUnderline(true)
    echoLink("view color list", "showColors()", "Click here to view the list of possible colors you can choose", true)
    setUnderline(false)
    echo(":\n\n")
    
    local function showdivine()
        e:shortecho("Divine:")
        fg("white")
        echo("  ")
        
        setUnderline(true)
        echoLink(ndb.conf["highlightdivine"] and "Highlighting" or "Not highlighting",
            [[ndb.setconfig("highlightdivine", (ndb.conf["highlightdivine"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["highlightdivine"] and "stop" or "start") .. " highlighting Divine.",
        true)
        setUnderline(false)
        
        if not ndb.conf["highlightdivine"] then
            echo(" Divine.")
            echo((" "):rep(46))
        else
            echo(" Divine in ")
            setUnderline(true)
            fg(ndb.conf["divinecolor"] or ndb.conf["defaultcolor"])
            echoLink(ndb.conf["divinecolor"] or ndb.conf["defaultcolor"],
                [[printCmdLine("ndbc divinecolor ")]],
                "Click to set the color of Divine",
            true)
            setUnderline(false)
            fg("white")
            echo(", ")
            echo((" "):rep(45 - #(ndb.conf["divinecolor"] or ndb.conf["defaultcolor"])))
        end
        
        echo("(")
        
        setUnderline(true)
        echoLink(ndb.conf["bolddivine"] and "bold" or "no bld",
            [[ndb.setconfig("bolddivine", (ndb.conf["bolddivine"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["bolddivine"] and "stop" or "start") .. " bolding Divine.",
        true)
        setUnderline(false)
        
        echo(", ")
        
        setUnderline(true)
        echoLink(ndb.conf["underlinedivine"] and "undl" or "no undl",
            [[ndb.setconfig("underlinedivine", (ndb.conf["underlinedivine"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["underlinedivine"] and "stop" or "start") .. " underlining Divine.",
        true)
        setUnderline(false)
        
        echo(", ")
        
        setUnderline(true)
        echoLink(ndb.conf["italicizedivine"] and "ital" or "no ital",
            [[ndb.setconfig("italicizedivine", (ndb.conf["italicizedivine"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["italicizedivine"] and "stop" or "start") .. " italicizing Divine.",
        true)
        setUnderline(false)
        
        echo(")")
        
        echo("\n")
    end
    
    local function showorgenemies()
        e:echo("Org enemies:")
        fg("white")
        echo("  ")
        
        setUnderline(true)
        echoLink(ndb.conf["highlightorgenemies"] and "Highlighting" or "Not highlighting",
            [[ndb.setconfig("highlightorgenemies", (ndb.conf["highlightorgenemies"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["highlightorgenemies"] and "stop" or "start") .. " highlighting enemies of your org.",
        true)
        setUnderline(false)
        
        if not ndb.conf["highlightorgenemies"] then
            echo(" enemies of your org.")
            echo((" "):rep(33))
        else
            echo(" enemies of your org in ")
            setUnderline(true)
            fg(ndb.conf["orgenemycolor"] or ndb.conf["defaultcolor"])
            echoLink(ndb.conf["orgenemycolor"] or ndb.conf["defaultcolor"],
                [[printCmdLine("ndbc orgenemycolor ")]],
                "Click to set the color of enemies of your org",
            true)
            setUnderline(false)
            fg("white")
            echo(", ")
            echo((" "):rep(32 - #(ndb.conf["orgenemycolor"] or ndb.conf["defaultcolor"])))
        end
        
        echo("(")
        
        setUnderline(true)
        echoLink(ndb.conf["boldorgenemies"] and "bold" or "no bld",
            [[ndb.setconfig("boldorgenemies", (ndb.conf["boldorgenemies"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["boldorgenemies"] and "stop" or "start") .. " bolding enemies of your org.",
        true)
        setUnderline(false)
        
        echo(", ")
        
        setUnderline(true)
        echoLink(ndb.conf["underlineorgenemies"] and "undl" or "no undl",
            [[ndb.setconfig("underlineorgenemies", (ndb.conf["underlineorgenemies"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["underlineorgenemies"] and "stop" or "start") .. " underlining enemies of your org.",
        true)
        setUnderline(false)
        
        echo(", ")
        
        setUnderline(true)
        echoLink(ndb.conf["italicizeorgenemies"] and "ital" or "no ital",
            [[ndb.setconfig("italicizeorgenemies", (ndb.conf["italicizeorgenemies"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["italicizeorgenemies"] and "stop" or "start") .. " italicizing enemies of your org.",
        true)
        setUnderline(false)
        
        echo(")")
        
        echo("\n")
    end
    
    local function showmembers()
        e:echo("Org members:")
        -- orgs
        for _, org in ipairs(ndb.valid.orgs) do
            local status = ndb.conf.orgpolitics[org]
            local shortorg = org:lower():gsub(" ", "")
            fg("white")
            echo("  ")
            echo(string.format("%-10s is ", org))
            local nextstatus, extraspaces
            if status == "ally" then
                fg("green")
                nextstatus = "enemy"
                status = "an ally"
            elseif status == "enemy" then
                fg("red")
                nextstatus = "neutral"
                status = "an enemy"
            else
                fg("gray")
                nextstatus = "ally"
            end
            
            if ndb.conf.home ~= org then
                setUnderline(true)
                echoLink(tostring(status), "ndb.conf.orgpolitics['"..org.."'] = '"..nextstatus.."'; ndb.showconfigs()", "Click to set "..org.."'s status to " .. nextstatus, true)
                setUnderline(false)
            else
                fg("white")
                echo("your home")
                status = "your home"
            end
            
            fg("white")
            echo(",")
            echo((" "):rep(10 - status:len()))
            
            setUnderline(true)
            echoLink(ndb.conf["highlight"..shortorg] and "highlighting" or "not highlighting",
                [[ndb.setconfig("highlight]]..shortorg..[[", (ndb.conf["highlight]]..shortorg..[["] and "false" or "true")) ndb.showconfigs()]],
                "Click to " .. (ndb.conf["highlight"..shortorg] and "stop" or "start") .. " highlighting citizens of " .. org,
            true)
            setUnderline(false)
            
            if not ndb.conf["highlight"..shortorg] then
                echo(" its citizens in any color,  ")
            else
                echo((" "):rep(4))
                echo(" its citizens in ")
                setUnderline(true)
                fg(ndb.conf[shortorg.."color"] or ndb.conf["defaultcolor"])
                echoLink(ndb.conf[shortorg.."color"] or ndb.conf["defaultcolor"],
                    [[printCmdLine("ndbc ]]..shortorg..[[color ")]],
                    "Click to set the color of " .. org .. " citizens",
                true)
                setUnderline(false)
                fg("white")
                echo(",")
                echo((" "):rep(11 - #(ndb.conf[shortorg.."color"] or ndb.conf["defaultcolor"])))
            end
            
            echo("(")
            
            setUnderline(true)
            echoLink(ndb.conf["bold"..shortorg] and "bold" or "no bld",
                [[ndb.setconfig("bold]]..shortorg..[[", (ndb.conf["bold]]..shortorg..[["] and "false" or "true")) ndb.showconfigs()]],
                "Click to " .. (ndb.conf["bold"..shortorg] and "stop" or "start") .. " bolding citizens of " .. org,
            true)
            setUnderline(false)
            echo(", ")
            
            setUnderline(true)
            echoLink(ndb.conf["underline"..shortorg] and "undl" or "no undl",
                [[ndb.setconfig("underline]]..shortorg..[[", (ndb.conf["underline]]..shortorg..[["] and "false" or "true")) ndb.showconfigs()]],
                "Click to " .. (ndb.conf["underline"..shortorg] and "stop" or "start") .. " underlining citizens of " .. org,
            true)
            setUnderline(false)
            echo(", ")
            
            setUnderline(true)
            echoLink(ndb.conf["italicize"..shortorg] and "ital" or "no ital",
                [[ndb.setconfig("italicize]]..shortorg..[[", (ndb.conf["italicize]]..shortorg..[["] and "false" or "true")) ndb.showconfigs()]],
                "Click to " .. (ndb.conf["italicize"..shortorg] and "stop" or "start") .. " italicizing citizens of " .. org,
            true)
            setUnderline(false)
            echo(")")
            
            echo("\n")
        end
        
        -- rogues
        fg("white")
        echo("  Rogues are neutral,      ")
        
        setUnderline(true)
        echoLink(ndb.conf["highlightrogues"] and "highlighting" or "not highlighting",
            [[ndb.setconfig("highlightrogues", (ndb.conf["highlightrogues"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["highlightrogues"] and "stop" or "start") .. " highlighting rogues.",
        true)
        setUnderline(false)
        
        if not ndb.conf["highlightrogues"] then
            echo(" them in any color,")
            echo((" "):rep(10))
        else
            echo((" "):rep(4))
            echo(" them in ")
            setUnderline(true)
            fg(ndb.conf["roguescolor"] or ndb.conf["defaultcolor"])
            echoLink(ndb.conf["roguescolor"] or ndb.conf["defaultcolor"],
                [[printCmdLine("ndbc roguescolor ")]],
                "Click to set the color of rogues",
            true)
            setUnderline(false)
            fg("white")
            echo(", ")
            echo((" "):rep(18 - #(ndb.conf["roguescolor"] or ndb.conf["defaultcolor"])))
        end
        
        echo("(")
        
        setUnderline(true)
        echoLink(ndb.conf["boldrogues"] and "bold" or "no bld",
            [[ndb.setconfig("boldrogues", (ndb.conf["boldrogues"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["boldrogues"] and "stop" or "start") .. " bolding rogues.",
        true)
        setUnderline(false)
        
        echo(", ")
        
        setUnderline(true)
        echoLink(ndb.conf["underlinerogues"] and "undl" or "no undl",
            [[ndb.setconfig("underlinerogues", (ndb.conf["underlinerogues"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["underlinerogues"] and "stop" or "start") .. " underlining rogues.",
        true)
        setUnderline(false)
        
        echo(", ")
        
        setUnderline(true)
        echoLink(ndb.conf["italicizerogues"] and "ital" or "no ital",
            [[ndb.setconfig("italicizerogues", (ndb.conf["italicizerogues"] and "false" or "true")) ndb.showconfigs()]],
            "Click to " .. (ndb.conf["italicizerogues"] and "stop" or "start") .. " italicizing rogues.",
        true)
        setUnderline(false)
        
        echo(")")
        
        echo("\n")
    end
    
    function showhome()
        if ndb.conf.home and table.contains(ndb.valid.orgs, ndb.conf.home) then return end
        e:echo2("You currently have not set your home. Use '")
        fg("white")
        setUnderline(true)
        echoLink("ndbc home <org>",
            [[printCmdLine("ndbc home ")]],
            "Click to set your home",
        true)
        setUnderline(false)
        echo("' to set your home.")
        echo("\n")
    end
    
    showdivine()
    echo("\n")
    showorgenemies()
    echo("\n")
    showmembers()
    echo("\n")
    showhome()
    
end

function ndb.setcolor(org)
    local shortorg = org:lower():gsub(" ", "")
end

function ndb.setconfig(config, option)
    
    if not ndb.conf_dict[config] and not ndb.conf_dict[config] == false then
        e:echo("Do not know about this option.")
        return
    end
    
    local yes = {"yes", "y", "1", "on", "true"}
    local no = {"no", "n", "0", "off", "false"}
    local function stringtoboolean(which)
        if table.contains(yes, which) or which == true then return true end
        if table.contains(no, which) or which == false then return false end
        
        return nil
    end
    
    if ndb.conf_dict[config].type == "boolean" then
        if (type(option) == "boolean" and option == true) or stringtoboolean(option) or (option == nil and not ndb.conf[config]) then
            ndb.conf[config] = true
            ndb.conf_dict[config].onenabled()
            
        elseif (type(option) == "boolean" and option == false) or not stringtoboolean(option) or (option == nil and ndb.conf[config]) then
            ndb.conf[config] = false
            ndb.conf_dict[config].ondisabled()
        end
        
    elseif ndb.conf_dict[config].type == "color" then
        if table.contains(color_table, option) then
            ndb.conf[config] = option
            ndb.conf_dict[config].onset()
        else
            e:echo("<red>" .. option .. " <white>is not a valid color to set <orange>" .. config .. " <white>to.")
        end
        if not option then e:echo("What do you want to set " .. config .. " to? Please use <orange>'ndbc " .. config .. " <option>' <white>to answer.") return end
    elseif ndb.conf_dict[config].type == "org" then
        local matchedorg = 0
        for _, org in pairs(ndb.valid.orgs) do
            local shortorg = org:lower():gsub(" ", "")
            if org:starts(option:title()) or shortorg:starts(option:lower()) or (org == "New Celest" and string.starts("celest", option:lower())) then
                ndb.conf[config] = org
                ndb.conf_dict[config].onset()
                matchedorg = 1
                break
            end
        end
        if matchedorg == 0 then
            e:echo("<red>" .. option .. " <white>is not a valid organisation to set <orange>" .. config .. " <white>to.")
        end
    end
end

function ndb.setupconfigs()
    ndb.conf_dict = {}
    
    ndb.addconfig("home", {
        type = "org",
        onset = function () e:echo("Set your home to " .. ndb.conf["home"]) end,
    })

    ndb.addconfig("highlightdivine", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> highlight Divine.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> highlight Divine.") end,
    })
    ndb.addconfig("bolddivine", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> bold Divine.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> bold Divine.") end,
    })
    ndb.addconfig("underlinedivine", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> underline Divine.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> underline Divine.") end,
    })
    ndb.addconfig("italicizedivine", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> italicize Divine.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> italicize Divine.") end,
    })
    ndb.addconfig("divinecolor", {
        type = "color",
        onset = function() ndb.loadhighlights() e:echo("Highlighting Divine in <" .. ndb.conf["divinecolor"] .. ">" .. ndb.conf["divinecolor"] .. "<white> now.") end,
    })
    
    ndb.addconfig("highlightorgenemies", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> highlight enemies of your org.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> highlight Divine.") end,
    })
    ndb.addconfig("boldorgenemies", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> bold enemies of your org.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> bold enemies of your org.") end,
    })
    ndb.addconfig("underlineorgenemies", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> underline enemies of your org.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> underline enemies of your org.") end,
    })
    ndb.addconfig("italicizeorgenemies", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> italicize enemies of your org.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> italicize enemies of your org.") end,
    })
    ndb.addconfig("orgenemycolor", {
        type = "color",
        onset = function() ndb.loadhighlights() e:echo("Highlighting enemies of your org in <" .. ndb.conf["orgenemycolor"] .. ">" .. ndb.conf["orgenemycolor"] .. "<white> now.") end,
    })
    
    ndb.addconfig("highlightrogues", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> highlight rogues.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> highlight rogues.") end,
    })
    ndb.addconfig("boldrogues", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> bold rogues.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> bold rogues.") end,
    })
    ndb.addconfig("underlinerogues", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> underline rogues.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> underline rogues.") end,
    })
    ndb.addconfig("italicizerogues", {
        type = "boolean",
        onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white> italicize rogues.") end,
        ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white> italicize rogues.") end,
    })
    ndb.addconfig("roguescolor", {
        type = "color",
        onset = function() ndb.loadhighlights() e:echo("Highlighting rogues in <" .. ndb.conf["roguescolor"] .. ">" .. ndb.conf["roguescolor"] .. "<white> now.") end,
    })
    
    for _, org in ipairs(ndb.valid.orgs) do
        local shortname = org:lower():gsub(" ", "")
        ndb.addconfig("highlight"..shortname, {
            type = "boolean",
            onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white>highlight members of " .. org .. ".") end,
            ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white>highlight members of " .. org .. ".") end,
        })
        ndb.addconfig("bold"..shortname, {
            type = "boolean",
            onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white>bold members of " .. org .. ".") end,
            ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white>bold members of " .. org .. ".") end,
        })
        ndb.addconfig("underline"..shortname, {
            type = "boolean",
            onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white>underline members of " .. org .. ".") end,
            ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white>underline members of " .. org .. ".") end,
        })
        ndb.addconfig("italicize"..shortname, {
            type = "boolean",
            onenabled = function () ndb.loadhighlights() e:echo("<green>Will <white>italicize members of " .. org .. ".") end,
            ondisabled = function () ndb.loadhighlights() e:echo("<red>Won't <white>italicize members of " .. org .. ".") end,
        })
        ndb.addconfig(shortname.."color", {
            type = "color",
            onset = function () ndb.loadhighlights() e:echo("Highlighting members of " .. org .. " in <" .. ndb.conf[shortname.."color"] .. ">" .. ndb.conf[shortname.."color"] .. " <white>now.") end,
        })
        
    end
    
    ndb.decho("Configs set up.")
end

function ndb.addconfig(config, dict)
    ndb.conf_dict = ndb.conf_dict or {}
    ndb.conf_dict[config] = dict
end

function ndb.isglom(name)
    return #(db:fetch(ndb.db.people, {db:eq(ndb.db.people.org, "Glomdoring"), db:eq(ndb.db.people.name, name)})) ~= 0
end

function ndb.ismag(name)
    return #(db:fetch(ndb.db.people, {db:eq(ndb.db.people.org, "Magnagora"), db:eq(ndb.db.people.name, name)})) ~= 0
end

function ndb.iscelest(name)
    return #(db:fetch(ndb.db.people, {db:eq(ndb.db.people.org, "New Celest"), db:eq(ndb.db.people.name, name)})) ~= 0
end

function ndb.ishalli(name)
    return #(db:fetch(ndb.db.people, {db:eq(ndb.db.people.org, "Hallifax"), db:eq(ndb.db.people.name, name)})) ~= 0
end

function ndb.isgaudi(name)
    return #(db:fetch(ndb.db.people, {db:eq(ndb.db.people.org, "Gaudiguch"), db:eq(ndb.db.people.name, name)})) ~= 0
end

function ndb.isseren(name)
    return #(db:fetch(ndb.db.people, {db:eq(ndb.db.people.org, "Serenwilde"), db:eq(ndb.db.people.name, name)})) ~= 0
end

function ndb.getorg(name)
    name = name:title()
    local r = db:fetch(ndb.db.people, db:eq(ndb.db.people.name, name))
    if not next(r) then return nil, "name not known" end
    
    return r[1].org
end

-- these next two seem to be identical but keeping both in case people use both
function ndb.exists(name)
    return #(db:fetch(ndb.db.people, db:eq(ndb.db.people.name, name))) ~= 0
end

function ndb.isperson(name)
    return #(db:fetch(ndb.db.people, db:eq(ndb.db.people.name, name))) ~= 0
end

-- given a name, returns all info about a person
function ndb.getname (name)
    return db:fetch(ndb.db.people, db:eq(ndb.db.people.name, string.title(name)))[1]
end

-- returns true if person's org is considered to be an enemy org
-- note that this is different to mmf's ndb. You can use ndb.isenemy(name) and ndb.isorgenemy(name) together
function ndb.isenemy(name)
    local p = ndb.getname(name)
    if not p then return false end
    
    local org = p.org
    
    if (org and org ~= "" and ndb.conf.orgpolitics[org] == "enemy") then
    return true else return false
    end
end

-- returns true if person is personally enemied to your org
-- note that this is different to mmf's ndb. You can use ndb.isenemy(name) and ndb.isorgenemy(name) together
function ndb.isorgenemy(name)
    local p = ndb.getname(name)
    if not p then return false end
    
    if (p.orgenemy and p.orgenemy == 1) then
    return true else return false
    end
end

-- given a title, returns all info about a person
function ndb.getnamebytitle (title)
    return db:fetch(ndb.db.people, db:in_(ndb.db.people.name, string.split(title, " ")))
end

-- given a line, returns the first name it finds, if any
function ndb.findname(line)
    for w in string.gmatch(line, "(%u%l+)") do
        if #w >= 3 then
            if ndb.isperson(w) then return w end
        end
    end
end

-- given a line, returns all names found on it
function ndb.findnames(line)
    local l = {}
    for w in string.gmatch(line, "(%u%l+)") do
        if #w >= 3 then
            if ndb.isperson(w) then l[#l + 1] = w end
        end
    end
    
    if l[1] then return l end
end

local singular_org = {
    [""] = "Rogue",
    ["New Celest"] = "Celestian",
    Gaudiguch = "Gaudi",
    Glomdoring = "Glom",
    Hallifax = "Halli",
    Magnagora = "Mag",
    Serenwilde = "Seren"
}

local plural_org = {
    [""] = "Rogues",
    ["New Celest"] = "Celestians",
    Gaudiguch = "Gaudis",
    Glomdoring = "Gloms",
    Hallifax = "Hallis",
    Magnagora = "Mags",
    Serenwilde = "Serens"
}

function ndb.getpluralorg(org, count)
    if count <= 1 then
        return singular_org[org]
    else
        return plural_org[org]
    end
end

-- get the color of a name as a tag for use in echoes
function ndb.getcolor(name)
    assert(type(name) == "string", "ndb.getcolor: name to get a color of is required")
    
    local person = ndb.getname(name)
    
    if not person then return "" end -- in case the person doesn't exist
    
    local org, color = person.org
    
    -- order of priority: divine > org enemies > rogue > org
    if org == "" or not org then org = false else org = org:lower() end -- known rogues are returned as ""
    if org == "new celest" then org = "newcelest" end
    
    if ndb.conf.highlightdivine and person.divine == 1 then
        color = ndb.conf.divinecolor or ndb.conf.defaultcolor
    elseif ndb.conf.highlightenemies and person.orgenemy == 1 then
        color = ndb.conf.orgenemycolor or ndb.conf.defaultcolor
    elseif ndb.conf.highlightrogues and person.org == "" then
        color = ndb.conf.roguescolor or ndb.conf.defaultcolor
    elseif ndb.conf["highlight"..org] and person.org then
        color = ndb.conf[org.."color"] or ndb.conf.defaultcolor
    end
    
    return (color and '<'..color..'>' or "")
end

-- get the color of a name
function ndb.getcolorp(name)
    assert(type(name) == "string", "ndb.getcolor: name to get a color of is required")
    
    local person = ndb.getname(name)
    
    if not person then return "" end -- in case the person doesn't exist
    
    local org, color = person.org
    
    -- order of priority: divine > org enemies > rogue > org
    if org == "" or not org then org = false else org = org:lower() end -- known rogues are returned as ""
    if org == "new celest" then org = "newcelest" end
    
    if ndb.conf.highlightdivine and person.divine == 1 then
        color = ndb.conf.divinecolor or ndb.conf.defaultcolor
    elseif ndb.conf.highlightenemies and person.orgenemy == 1 then
        color = ndb.conf.orgenemycolor or ndb.conf.defaultcolor
    elseif ndb.conf.highlightrogues and person.org == "" then
        color = ndb.conf.roguescolor or ndb.conf.defaultcolor
    elseif ndb.conf["highlight"..org] and person.org then
        color = ndb.conf[org.."color"] or ndb.conf.defaultcolor
    end
    
    return color
end

function ndb.addname(name)
    local temp_name_list = {}
    
    if type(name) == "table" then
        for i = 1, #name do
            temp_name_list[#temp_name_list + 1] = {name = name[i]:title()}
        end
    else
        temp_name_list = {{name = name:title()}}
    end
    
    db:merge_unique(ndb.db.people, temp_name_list)
    
    ndb.download(name)
end

function ndb.checkqw(how)
    if ndb.qwtimer then killTimer(ndb.qwtimer) end
    
    enableTrigger("NameDB qw")
    ndb.qwtimer = tempTimer(3, function() disableTrigger("NameDB qw"); ndb.qwtimer = nil end)
    ndb.qwtype = how
    
    send("qw")
end

-- This won't download anything - just marks those who are already in the database as enemies
function ndb.gotenemylist()
    local tempnamelist = {}
    
    for i = 1, #ndb.enemylist do
        local name = ndb.enemylist[i]
        if ndb.exists(name) then
            -- already exists in db so just set the enemy status
            local person = {name = name, orgenemy = 1}
            table.insert(tempnamelist, person)
        end
    end
    
    db:merge_unique(ndb.db.people, tempnamelist)
    
    echo("\n")
    e:echo(#tempnamelist .. " existing names have been marked as enemies.")
end

-- This will attempt to download everyone in the enemy list. Can freeze Mudlet for a while.
function ndb.gotenemylist2()
    local namesadded = 0
    local tempnamelist = {}
    
    for i = 1, #ndb.enemylist do
        local name = ndb.enemylist[i]
        if not ndb.exists(name) or ndb.conf.checkall then
            ndb.download(name)
            namesadded = namesadded + 1
        else
            -- already exists in db so just set the enemy status
            local person = {name = name, orgenemy = 1}
            table.insert(tempnamelist, person)
        end
    end
    
    db:merge_unique(ndb.db.people, tempnamelist)
    
    echo("\n")
    e:echo(namesadded .. " names being downloaded.")
    e:echo(#tempnamelist .. " existing names have been marked as enemies.")
end

function ndb.singlehighlight(name, org, orgenemy, divine)
    -- clear existing highlight for this name
    if ndb.highlightIds and ndb.highlightIds[name] then
        killTrigger(ndb.highlightIds[name])
    end
    
    local color, bold, underline, italicize = ndb.conf.defaultcolor, 0, 0, 0
    org = org:lower():gsub(" ", "")
    
    --priority: divine, orgenemy, rogue, org
    
    -- color
    if ndb.conf.highlightdivine and divine == 1 then
        color = ndb.conf.divinecolor or ndb.conf.defaultcolor
    elseif ndb.conf.highlightenemies and orgenemy == 1 then
        color = ndb.conf.orgenemycolor or ndb.conf.defaultcolor
    elseif ndb.conf.highlightrogues and org == "" then
        color = ndb.conf.roguescolor or ndb.conf.defaultcolor
    elseif ndb.conf["highlight"..org] and org then
        color = ndb.conf[org.."color"] or ndb.conf.defaultcolor
    end
    
    -- other formatting
    bold = (ndb.conf.bolddivine and divine == 1) or
    (ndb.conf.boldorgenemies and orgenemy == 1) or
    (ndb.conf.boldrogues and org == "") or
    (ndb.conf["bold"..org] and org)
    
    underline = (ndb.conf.underlinedivine and divine == 1) or
    (ndb.conf.underlineorgenemies and orgenemy == 1) or
    (ndb.conf.underlinerogues and org == "") or
    (ndb.conf["underline"..org] and org)
    
    italicize = (ndb.conf.italicizedivine and divine == 1) or
    (ndb.conf.italicizeorgenemies and orgenemy == 1) or
    (ndb.conf.italicizerogues and org == "") or
    (ndb.conf["italicize"..org] and org)
    
    if not (color or bold or underline or italicize) then return end
    
    --ndb.decho("Highlighting " .. name .. " with color: " .. color .. " bold: " .. (bold and "1" or "0") .. " underline: " .. (underline and "1" or "0") .. " italicize: " .. (italicize and "1" or "0"))
    
    ndb.highlightIds = ndb.highlightIds or {}
    ndb.highlightIds[name] = tempTrigger(name, ([[ndb.highlight("%s", %s, %s, %s, %s)]]):format(name,
        (color and '"'..color..'"' or "false"),
        (bold and "true" or "false"),
        (underline and "true" or "false"),
    (italicize and "true" or "false")))
end

function ndb.highlight(name, color, bold, underline, italicize)
    -- c counts the appearance of the substring of the word in the line, k counts the character position
    local c, k = 1, 1
    
    while k > 0 do
        k = line:find(name, k)
        if k == nil then return end
        c = c + 1
        
        if k == line:find("%f[%a]"..name.."%f[%A]", k) then
            if selectString(name, c - 1) > -1 then
                if color then fg(color) end
                if bold then setBold(true) end
                if underline then setUnderline(true) end
                if italicize then setItalics(true) end
                resetFormat()
            else return end
        end
        
        k = k + 1
    end
end

function ndb.clearhighlights()
    if not ndb.highlightIds or not next(ndb.highlightIds) then return end
    
    local killTrigger = killTrigger
    for k, v in pairs(ndb.highlightIds) do
        killTrigger(v)
    end
    
    ndb.highlightIds = {}
end

function ndb.loadhighlights()
    ndb.decho("Highlights loaded")
    ndb.highlightIds = ndb.highlightIds or {}
    collectgarbage("stop")
    
    ndb.clearhighlights()
    
    local dbNames = db:fetch(ndb.db.people)
    for i = 1, #dbNames do
        ndb.singlehighlight(
            dbNames[i].name,
            dbNames[i].org or "",
            dbNames[i].orgenemy or 0,
            dbNames[i].divine or 0
        )
    end
    
    collectgarbage()
    
end

function ndb.addhighlightname(_, name)
    ndb.decho("Received event to highlight " .. name)
    
    if not name then return end -- no name is passed on a suicided person
    
    local person = ndb.getname(name)
    
    if not person then return end -- in case a person was deleted
    
    ndb.singlehighlight(
        name,
        person.org or "",
        person.orgenemy or 0,
        person.divine or 0
    )
end

function ndb.gotnamelist(_, checkall)
    local namesadded = 0
    
    for i = 1, #ndb.tempnamelist do
        local name = ndb.tempnamelist[i]
        if not ndb.exists(name) or checkall == 1 then
            ndb.download(name)
            namesadded = namesadded + 1
        end
    end
    
    if namesadded > 0 and checkall == 0 then
        echo("\n")
        e:echo(namesadded .. " new names being downloaded.")
    elseif namesadded > 0 then
        echo("\n")
        e:echo(namesadded .. " total names being downloaded.")
    end
end

function ndb.isally(name)
  local p = ndb.getname(name)
  if not p then
    return false
  end
  local org = p.org
  if (org and org ~= "" and ndb.conf.orgpolitics[org] == "ally") then
    return true
  else
    return false
  end
end


registerAnonymousEventHandler("sysLoadEvent", "ndb.loadhighlights")
registerAnonymousEventHandler("sysLoadEvent", "ndb.setupconfigs")
registerAnonymousEventHandler("NameDB got enemy list", "ndb.gotenemylist")
registerAnonymousEventHandler("NameDB download done", "ndb.addhighlightname")
registerAnonymousEventHandler("NameDB got name list", "ndb.gotnamelist")
registerAnonymousEventHandler("sysDownloadDone", "ndb.downloaddone")
registerAnonymousEventHandler("sysDownloadError", "ndb.downloaderror")


return ndb
