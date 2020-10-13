local ui = {}

-- Outpost User Interface 


-- Define our containers and set properties

ui.top = Adjustable.Container:new({name = "Character Details", y="0%", height = "6%", autoLoad = false})
ui.bottom = Adjustable.Container:new({name = "Character Status", height = "6%", y = "-6%", autoLoad = false})
ui.right = Adjustable.Container:new({name = "Map & Chat", y = "0%", height = "100%", x = "-30%", width = "30%", autoLoad = false})
ui.left = Adjustable.Container:new({name = "GMCP Data", x = "0%", y = "0%", height = "100%", width = "16%", autoLoad = false})


ui.top:attachToBorder("top")
ui.bottom:attachToBorder("bottom")
ui.left:attachToBorder("left")
ui.right:attachToBorder("right")

ui.top:connectToBorder("left")
ui.top:connectToBorder("right")
ui.bottom:connectToBorder("left")
ui.bottom:connectToBorder("right")

ui.top:changeMenuStyle("dark")
ui.bottom:changeMenuStyle("dark")
ui.left:changeMenuStyle("dark")
ui.right:changeMenuStyle("dark")

ui.top:lockContainer("full")
ui.bottom:lockContainer("full")
ui.left:lockContainer("full")
ui.right:lockContainer("full")



-- First we create our border labels. These are 1% bigger than all elements so as to contain a border-image.

ui.map_border = Geyser.Label:new({
    name = "ui.map_border",
    x = 0, y = 0,
    width = "100%", height = "50%",
    fgColor = "black",
    color = "sea_green"
}, ui.right)

ui.chat_border = Geyser.Label:new({
    name = "ui.chat_border",
    x = 0, y = "50%",
    width = "100%", height = "50%",
    fgColor = "black",
    color = "sea_green"
}, ui.right)

ui.whohere_border = Geyser.Label:new({
    name = "ui.whowhere_border",
    x = 0, y = 0,
    width = "100%", height = "30%",
    fgColor = "black",
    color = "sea_green"
}, ui.left)

ui.afflictions_border = Geyser.Label:new({
    name = "ui.afflictions_border",
    x = 0, y = "30%",
    width = "100%", height = "30%",
    fgColor = "black",
    color = "sea_green"
}, ui.left)

ui.roomitems_border = Geyser.Label:new({
    name = "ui.roomitems_border",
    x = 0, y = "60%",
    width = "100%", height = "40%",
    fgColor = "black",
    color = "sea_green"
}, ui.left)

ui.chardetails_border = Geyser.Label:new({
    name = "ui.chardetails_border",
    x = 0, y = 0,
    width = "100%", height = "100%",
    fgColor = "black",
    color = "royal_blue"
}, ui.top)

ui.gauge_border = Geyser.Label:new({
    name = "ui.gauge_border",
    x = 0, y = 0,
    width = "100%", height = "100%",
    fgColor = "black",
    color = "black"
}, ui.bottom)



-- Now, let's create our elements.

ui.map_window = Geyser.Mapper:new({
    name = "ui.map_window",
    x = "1%", y = "1%",
    width = "98%",
    height = "48%",
  }, ui.right)

ui.whohere_label = Geyser.Label:new({
    name = "ui.whowhere_label",
    x = "1%", y = "3%",
    width = "98%", height = "26%",
    fgColor = "black",
    color = "black"
  }, ui.left)

ui.afflictions_label = Geyser.Label:new({
    name = "ui.afflictions_label",
    x = "1%", y = "33%",
    width = "98%", height = "26%",
    fgColor = "black",
    color = "black"
  }, ui.left)

ui.roomitems_label = Geyser.Label:new({
    name = "ui.roomitems_label",
    x = "1%", y = "63%",
    width = "98%", height = "36%",
    fgColor = "black",
    color = "black"
  }, ui.left)

ui.chardetails_label = Geyser.Label:new({
    name = "ui.chardetails_label",
    x = "1%", y = "1%",
    width = "98%", height = "98%",
    fgColor = "black",
    color = "black"
  }, ui.top)

ui.hpgauge = Geyser.Gauge:new({
    name = "ui.hpgauge",
    x = "1%", y = "1%",
    width = "48%", height = "48%"
  }, ui.bottom)

ui.mpgauge = Geyser.Gauge:new({
    name = "ui.mpgauge",
    x = "51%", y = "1%",
    width = "48%", height = "48%"
  }, ui.bottom)

ui.egogauge = Geyser.Gauge:new({
    name = "ui.egogauge",
    x = "1%", y = "51%",
    width = "48%", height = "48%"
  }, ui.bottom)

ui.powergauge = Geyser.Gauge:new({
    name = "ui.powergauge",
    x = "51%", y = "51%",
    width = "48%", height = "48%"
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

ui.hpgauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #3880a7, stop: 1 #7dbfe2);
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

ui.mpgauge.back:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #292335, stop: 1 #564c69);
    border-width: 1px;
    border-color: black;
    border-style: solid;
    border-radius: 3;
  ]])

ui.egogauge.front:setStyleSheet([[background-color: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1, stop: 0 #3880a7, stop: 1 #7dbfe2);
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

ui.chat_window:setTabFont("Saved by zero")



-- Create our ticker.

ui.ticker = chyron:new({
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
ui.ticker:setMessage("Outpost System - Put something cool here.")



return ui