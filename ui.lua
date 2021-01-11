local ui = {}

-- Outpost User Interface 


ui.event_labels = {}
ui.displayed_labels = {}
ui.label_queue = {}


-- Define our containers and set properties

ui.top = Adjustable.Container:new({name = "Header", y="0%", height = "6%", autoLoad = false})
ui.bottom = Adjustable.Container:new({name = "Character Status", height = "6%", y = "-6%", autoLoad = false})
ui.right = Adjustable.Container:new({name = "Map & Chat", y = "0%", height = "100%", x = "-30%", width = "30%", autoLoad = false})
ui.left = Adjustable.Container:new({name = "GMCP Data", x = "0%", y = "0%", height = "100%", width = "16%", autoLoad = false})


ui.top:attachToBorder("top")
ui.bottom:attachToBorder("bottom")
ui.left:attachToBorder("left")
ui.right:attachToBorder("right")

if Adjustable.Container.connectToBorder then
  ui.top:connectToBorder("left")
  ui.top:connectToBorder("right")
  ui.bottom:connectToBorder("left")
  ui.bottom:connectToBorder("right")
end

if Adjustable.Container.changeMenuStyle then
  ui.top:changeMenuStyle("dark")
  ui.bottom:changeMenuStyle("dark")
  ui.left:changeMenuStyle("dark")
  ui.right:changeMenuStyle("dark")
end

ui.top:lockContainer("full")
ui.bottom:lockContainer("full")
ui.left:lockContainer("full")
ui.right:lockContainer("full")


function ui.showContainers()
    ui.top:show()
    ui.bottom:show()
    ui.left:show()
    ui.right:show()
end

ui.showContainers()



-- First we create our border labels. These are 1% bigger than all elements so as to contain a border-image.

ui.map_border = Geyser.Label:new({
    name = "ui.map_border",
    x = 0, y = 0,
    width = "100%", height = "50%",
    fgColor = "black",
    color = "sea_green",
    clickthrough = true
}, ui.right)

ui.chat_border = Geyser.Label:new({
    name = "ui.chat_border",
    x = 0, y = "50%",
    width = "100%", height = "50%",
    fgColor = "black",
    color = "sea_green",
    clickthrough = true
}, ui.right)

ui.whohere_border = Geyser.Label:new({
    name = "ui.whowhere_border",
    x = 0, y = 0,
    width = "100%", height = "30%",
    fgColor = "black",
    color = "sea_green",
    clickthrough = true
}, ui.left)

ui.afflictions_border = Geyser.Label:new({
    name = "ui.afflictions_border",
    x = 0, y = "30%",
    width = "100%", height = "30%",
    fgColor = "black",
    color = "sea_green",
    clickthrough = true
}, ui.left)

ui.roomitems_border = Geyser.Label:new({
    name = "ui.roomitems_border",
    x = 0, y = "60%",
    width = "100%", height = "40%",
    fgColor = "black",
    color = "sea_green",
    clickthrough = true
}, ui.left)

ui.chardetails_border = Geyser.Label:new({
    name = "ui.chardetails_border",
    x = 0, y = 0,
    width = "100%", height = "100%",
    fgColor = "black",
    color = "royal_blue",
    clickthrough = true
}, ui.top)

ui.gauge_border = Geyser.Label:new({
    name = "ui.gauge_border",
    x = 0, y = 0,
    width = "100%", height = "100%",
    fgColor = "black",
    color = "black",
    clickthrough = true
}, ui.bottom)



-- Now, let's create our elements.

ui.map_window = Geyser.Mapper:new({
    name = "ui.map_window",
    x = "1%", y = "1%",
    width = "98%",
    height = "48%",
    clickthrough = true
  }, ui.right)

ui.whohere_label = Geyser.Label:new({
    name = "ui.whowhere_label",
    x = "1%", y = "3%",
    width = "98%", height = "26%",
    fgColor = "black",
    color = "black",
    clickthrough = true
  }, ui.left)

ui.afflictions_label = Geyser.Label:new({
    name = "ui.afflictions_label",
    x = "1%", y = "33%",
    width = "98%", height = "26%",
    fgColor = "black",
    color = "black",
    clickthrough = true
  }, ui.left)

ui.roomitems_label = Geyser.Label:new({
    name = "ui.roomitems_label",
    x = "1%", y = "63%",
    width = "98%", height = "36%",
    fgColor = "black",
    color = "black",
    clickthrough = true
  }, ui.left)

ui.chardetails_label = Geyser.Label:new({
    name = "ui.chardetails_label",
    x = "1%", y = "1%",
    width = "98%", height = "98%",
    fgColor = "black",
    color = "black",
    clickthrough = true
  }, ui.top)

ui.hpgauge = Geyser.Gauge:new({
    name = "ui.hpgauge",
    x = "1%", y = "1%",
    width = "48%", height = "48%",
    strict = true
  }, ui.bottom)

ui.mpgauge = Geyser.Gauge:new({
    name = "ui.mpgauge",
    x = "51%", y = "1%",
    width = "48%", height = "48%",
    strict = true
  }, ui.bottom)

ui.egogauge = Geyser.Gauge:new({
    name = "ui.egogauge",
    x = "1%", y = "51%",
    width = "48%", height = "48%",
    strict = true
  }, ui.bottom)

ui.powergauge = Geyser.Gauge:new({
    name = "ui.powergauge",
    x = "51%", y = "51%",
    width = "48%", height = "48%",
    strict = true
  }, ui.bottom)

--[[ui.charstatus_label = Geyser.Label:new({
    name = "ui.charstatus_label",
    x = "1%", y = "1%",
    width = "98%", height = "98%",
    fgColor = "black",
    color = "black"
  }, ui.bottom)]]



-- Set our border stylesheets.

ui.map_border:setStyleSheet([[
    background-color: rgb(153,255,153,255); border: 1px solid black; border-radius: 10px
]])

ui.chat_border:setStyleSheet([[
    background-color: rgb(153,255,153,255); border: 1px solid black; border-radius: 10px
]])

ui.whohere_border:setStyleSheet([[
    background-color: rgb(153,255,153,255); border: 1px solid black; border-radius: 10px
]])

ui.afflictions_border:setStyleSheet([[
    background-color: rgb(153,255,153,255); border: 1px solid black; border-radius: 10px
]])

ui.roomitems_border:setStyleSheet([[
    background-color: rgb(153,255,153,255); border: 1px solid black; border-radius: 10px
]])

ui.chardetails_border:setStyleSheet([[
    background-color: rgb(153,255,153,255); border: 1px solid black; border-radius: 10px
]])

ui.hpgauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #CD4E2F, stop: 1 #DE9B8A);
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 3;
    padding: 1;
  ]])

ui.hpgauge.back:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #232f35, stop: 1 #4b5e68);
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 3;
  ]])

ui.mpgauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #5c38a7, stop: 1 #9676d8);
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 3;
    padding: 1;
  ]])

ui.mpgauge.back:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #232f35, stop: 1 #4b5e68);
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 3;
  ]])

ui.egogauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #70C95F, stop: 1 #A4EC96);
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 3;
    padding: 1;
  ]])

ui.egogauge.back:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #232f35, stop: 1 #4b5e68);
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 3;
  ]])

ui.powergauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #3880a7, stop: 1 #7dbfe2);
    border-top: 1px black solid;
    border-left: 1px black solid;
    border-bottom: 1px black solid;
    border-radius: 3;
    padding: 1;
  ]])

ui.powergauge.back:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #232f35, stop: 1 #4b5e68);
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 3;
  ]])


-- Now, the magic happens! Let's create our EMCO chat console.

local stylesheet = [[background-color: rgb(153,255,153,255); border-top-left-radius: 5px;border-top-right-radius: 5px; margin-right: 1px; margin-left: 1px]]
local istylesheet = [[background-color: rgb(255,229,204,255); border-top-left-radius: 5px;border-top-right-radius: 5px; margin-right: 1px; margin-left: 1px]]

ui.chat_window = EMCO:new({
    x = "1%",
    y = "51%",
    width = "98%",
    height = "48%",
    allTab = true,
    allTabName = "All",
    gap = 2,
    consoleColor = "black",
    blankLine = true,

    consoles = {
        "All",
        "Says",
        "Tells",
        "Org",
        "Family", 
        "Clans",
        "Combat",
        "Misc",
    },

    activeTabCSS = stylesheet,
    inactiveTabCSS = istylesheet,
}, ui.right)

ui.chat_window:setTabFont("Quicksand Regular")



-- Create our ticker.

--[[ui.ticker = chyron:new({
    name = "ui.ticker",
    x = "1%", y = "1%",
    width = "98%", height = "98%",
    fgColor = "black",
  }, ui.top)

ui.ticker:setColor(153,255,153,150)
ui.ticker:setFont("Zekton")
ui.ticker:setFontSize(18)
ui.ticker:setDelimiter("---")
ui.ticker:enableAutoWidth()
ui.ticker:setDisplayWidth(76)
ui.ticker:setMessage("Outpost System - Put something cool here.")]]



-- You said you wanted custom highlighting? You got it!

function ui.header(title, extra)
    local replen = 60 - (13 + title:len())
    cecho("\n<sienna>+<burlywood>----- <sienna>[<slate_grey> "..title:title().." <sienna>] "..string.rep("<burlywood>-", replen).." <sienna>(<burlywood> "..getTime(true, "hh:mma - dd/MM/yyyy").." <sienna>) <burlywood>-----<sienna>+\n\n")
end


function ui.footer()
    cecho("\n<sienna>+<burlywood>"..string.rep("-", 60).."<sienna> [<slate_grey> outpost-"..op.version.." <sienna>]<burlywood> "..string.rep("-", 11).."<sienna>+\n")
end


function ui.combatEcho(text, colour, width)
    if not text then
        text = tostring(text)
        if not text then
            debugc("Invalid argument #1 to combat_echo(): String expected. Got "..type(text)..".")
            return
        end
    end

    gaglp()

    text = string.gsub(text, "%a", "%1 "):sub(1, -2)
    text = "+    +    +    " .. text:upper() .. "    +    +    +"
    
    local width = width or 100
    
    if #text + 4 > width then
        width = #text + 4
    end

    local lindent = math.floor(((width - #text) / 2) - 1)
    local rindent = math.ceil(((width - #text) / 2) - 1)

    local colours = {
        red     = "<black:red>",
        blue    = "<navajo_white:midnight_blue>",
        green   = "<navajo_white:dark_green>",
        yellow  = "<black:gold>",
        purple  = "<navajo_white:DarkViolet>",
        orange  = "<black:dark_orange>",
    }

    local selection = colours[colour] or colours["yellow"]

    cecho("\n" .. selection .. "+" .. string.rep("-", (width - 2)) .. "+")
    cecho("\n" .. selection .. "|" .. string.rep(" ", lindent) .. text .. string.rep(" ", rindent) .. "|")
    cecho("\n" .. selection .. "+" .. string.rep("-", (width - 2)) .. "+")
end


function ui.oecho(txt, colour, pleft)
    deleteLine()
    local colour = colour or "orange"
    local pleft = pleft or 90
    local pright = 100 - pleft
    local left = ui.createLineGradient(true, pleft - string.len(txt)) .. "[ "
    local middle = "<" .. colour .. ">" .. txt
    local right = " |caaaaaa]" .. ui.createLineGradient(false, pright)
    hecho("\n" .. left)
    cecho(middle)
    hecho(right)
end


function ui.createLineGradient(left, width)
    local hex = left and "1" or "a"
    local width = width or 10
    local gradient = ""
    local length = 0
     
    while length < width do
        gradient = gradient .. "|c" .. string.rep(hex, 6) .. "-"
        if left and hex == "9" then
            hex = "a"
        elseif left and hex ~= "a" then
            hex = tostring(tonumber(hex) + 1)
        elseif not left and width - length < 10 and hex == "a" then
            hex = "9"
        elseif not left and width - length < 10 and hex ~= "1" then
            hex = tostring(tonumber(hex) - 1)
        end

        length = length + 1
    end
     
    return gradient
end


function ui.eventLabel(text, duration)
    local width, height = getMainWindowSize()
    local strLen = text:len()
    local label = utils.randomstring(8, "%l%d")

    ui.event_labels[label] = {label = label, text = text, duration = (duration or 5)}
    createLabel(label, 0, 0, 0, 0, 1)
    setLabelStyleSheet(label, [[
        background-color: gray;
        border-radius: 16px;
        border-width: 8px;
        border-style: solid;
        border-color: rgb(50, 0, 75);
        text-align: center;
    ]])
               
    resizeWindow(label, strLen * 25, 70)
    local tab_len, offset = utils.counttable(ui.event_labels), 100
    local top_pos = (height / 2.0) - (tab_len * 75)
    if top_pos > 0 then
        moveWindow(label, (width - (strLen * 25)) / 3, top_pos)
    end

    echo(label, [[<p style="font-size:24px; font-family: 'Quicksand Regular';"><b><center><font color="brown">]] .. text .. [[</font></center></b></p>]])
        
    if top_pos > 0 then
        showWindow(label)
        table.insert(ui.displayed_labels, label)
    else
        hideWindow(label)
        table.insert(ui.label_queue, label)
    end

    resetFormat()
end


function ui.eventLabelLoop()
    if not ui.event_labels then return end
    local to_hide = {}
    local need_redraw = false

    for index, label in pairs(ui.displayed_labels) do
        ui.event_labels[label].duration = ui.event_labels[label].duration - 0.5
        if ui.event_labels[label].duration <= 0 then
            to_hide[label] = true
            need_redraw = true
        end
    end

    for i = 1, #(ui.displayed_labels) do
        if not ui.displayed_labels[i] then 
            break 
        end
            
        if to_hide[ui.displayed_labels[i]] then
            hideWindow(ui.displayed_labels[i])
            ui.event_labels[ui.displayed_labels[i]] = nil
            table.remove(ui.displayed_labels, i)
            i = i - 1
        end
    end
        
    local width, height = getMainWindowSize()
    if need_redraw or (#(ui.displayed_labels) == 0 and #(ui.label_queue) > 0) then
        local brk = false
        local iter = 1
        while not brk do
            local top_pos = (height / 2.0) - ((iter) * 75)
            if ui.displayed_labels[iter] then
                local label = ui.displayed_labels[iter]
                moveWindow(label, (width - (#(ui.event_labels[label].text) * 25)) / 3, top_pos)
            elseif top_pos >= 0 and #(ui.label_queue) > 0 then
                local label = table.remove(ui.label_queue, 1)
                table.insert(ui.displayed_labels, label)
                moveWindow(label, (width - (#(ui.event_labels[label].text) * 25)) / 3, top_pos)
                showWindow(label)
            else
                brk = true
                break;
            end
                        
            iter = iter + 1
        end
    end
end



return ui
