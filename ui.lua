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

map_border = Geyser.Label:new({
    name = "map_border",
    x = 0, y = 0,
    width = "100%", height = "50%",
    fgColor = "black",
    color = "firebrick"
}, ui.right)

chat_border = Geyser.Label:new({
    name = "chat_border",
    x = 0, y = "50%",
    width = "100%", height = "50%",
    fgColor = "black",
    color = "black"
}, ui.right)

whohere_border = Geyser.Label:new({
    name = "whowhere_border",
    x = 0, y = 0,
    width = "100%", height = "30%",
    fgColor = "black",
    color = "firebrick"
}, ui.left)

afflictions_border = Geyser.Label:new({
    name = "afflictions_border",
    x = 0, y = "30%",
    width = "100%", height = "30%",
    fgColor = "black",
    color = "firebrick"
}, ui.left)

roomitems_border = Geyser.Label:new({
    name = "roomitems_border",
    x = 0, y = "60%",
    width = "100%", height = "40%",
    fgColor = "black",
    color = "firebrick"
}, ui.left)

chardetails_border = Geyser.Label:new({
    name = "chardetails_border",
    x = 0, y = 0,
    width = "100%", height = "100%",
    fgColor = "black",
    color = "royal_blue"
}, ui.top)

charstatus_border = Geyser.Label:new({
    name = "charstatus_border",
    x = 0, y = 0,
    width = "100%", height = "100%",
    fgColor = "black",
    color = "royal_blue"
}, ui.bottom)



-- Now, let's create our elements.

map_window = Geyser.Mapper:new({
    name = "map_window",
    x = "1%", y = "1%",
    width = "98%",
    height = "48%",
  }, ui.right)

whohere_label = Geyser.Label:new({
    name = "whowhere_label",
    x = "1%", y = "3%",
    width = "98%", height = "26%",
    fgColor = "black",
    color = "black"
  }, ui.left)

afflictions_label = Geyser.Label:new({
    name = "afflictions_label",
    x = "1%", y = "33%",
    width = "98%", height = "26%",
    fgColor = "black",
    color = "black"
  }, ui.left)

roomitems_label = Geyser.Label:new({
    name = "roomitems_label",
    x = "1%", y = "63%",
    width = "98%", height = "36%",
    fgColor = "black",
    color = "black"
  }, ui.left)

chardetails_label = Geyser.Label:new({
    name = "chardetails_label",
    x = "1%", y = "1%",
    width = "98%", height = "98%",
    fgColor = "black",
    color = "black"
  }, ui.top)

charstatus_label = Geyser.Label:new({
    name = "charstatus_label",
    x = "1%", y = "1%",
    width = "98%", height = "98%",
    fgColor = "black",
    color = "black"
  }, ui.bottom)



  -- Now, the magic happens! Let's create our EMCO chat console.

local stylesheet = [[background-color: rgb(153,255,153,255); border-top-left-radius: 5px;border-top-right-radius: 5px; margin-right: 1px; margin-left: 1px]]
local istylesheet = [[background-color: rgb(255,229,204,255); border-top-left-radius: 5px;border-top-right-radius: 5px; margin-right: 1px; margin-left: 1px]]

chat_window = EMCO:new({
    x = "1%",
    y = "51%",
    width = "98%",
    height = "48%",
    allTab = true,
    allTabName = "All",
    gap = 2,
    consoleColor = "black",

    consoles = {
        "All",
        "Says",
        "Tells",
        "Emotes",
        "Org", 
        "Clans",
        "Combat",
        "Squad",
    },

    activeTabCSS = stylesheet,
    inactiveTabCSS = istylesheet,
}, ui.right)

chat_window:setTabFont("Zekton")

return ui