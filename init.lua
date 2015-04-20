-----------------------------------------------
-- Set up
-----------------------------------------------
require "pomodoor"

local hyper = {"⌘", "⌥", "⌃", "⇧"}


-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")


-- Replace Caffeine.app with 18 lines of Lua :D
local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    local result
    if state then
        result = caffeine:setIcon("caffeine-on.pdf")
    else
        result = caffeine:setIcon("caffeine-off.pdf")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end


-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "d", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)


-----------------------------------------------
-- hyper g for right one half window
-----------------------------------------------

hs.hotkey.bind(hyper, "g", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)


-----------------------------------------------
-- hyper f for fullscreen
-----------------------------------------------

hs.hotkey.bind(hyper, "f", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)


-----------------------------------------------
-- hyper r for top left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "r", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-----------------------------------------------
-- hyper t for top right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "t", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-----------------------------------------------
-- hyper v for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "v", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-----------------------------------------------
-- hyper c for bottom right one quarter window
-----------------------------------------------

hs.hotkey.bind(hyper, "c", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y + (max.h / 2)
    f.w = max.w / 2
    f.h = max.h / 2
    win:setFrame(f)
end)


-----------------------------------------------
-- Hyper i to show window hints
-----------------------------------------------

hs.hotkey.bind(hyper, "i", function()
    hs.hints.windowHints()
end)


-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

hs.hotkey.bind(hyper, 'k', function()
    hs.window.focusedWindow():focusWindowNorth()
end)

hs.hotkey.bind(hyper, 'j', function()
    hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(hyper, 'l', function()
    hs.window.focusedWindow():focusWindowEast()
end)

hs.hotkey.bind(hyper, 'h', function()
    hs.window.focusedWindow():focusWindowWest()
end)


-----------------------------------------------
-- Screen layout
-----------------------------------------------
local laptopScreen = "Color LCD"
local windowLayout = {
    {"Safari",   nil,          laptopScreen, hs.layout.left50,    nil, nil},
    {"Terminal", nil,          laptopScreen, hs.layout.right50,   nil, nil},
}
--hs.layout.apply(windowLayout)



-- pomodoro key binding
hs.hotkey.bind(hyper, '9', function() pom_enable() end)
hs.hotkey.bind(hyper, '0', function() pom_disable() end)


-----------------------------------------------
-- Safari tab keys
-- see https://github.com/Hammerspoon/hammerspoon/wiki/Safari-Tab-switch-(CMD-%23),-like-Chrome
-----------------------------------------------
hs.hotkey.bind({"cmd"}, "1", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 1')
end)
hs.hotkey.bind({"cmd"}, "2", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 2')
end)
hs.hotkey.bind({"cmd"}, "3", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 3')
end)
hs.hotkey.bind({"cmd"}, "4", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 4')
end)
hs.hotkey.bind({"cmd"}, "5", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 5')
end)
hs.hotkey.bind({"cmd"}, "6", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 6')
end)
hs.hotkey.bind({"cmd"}, "7", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 7')
end)
hs.hotkey.bind({"cmd"}, "8", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 8')
end)
hs.hotkey.bind({"cmd"}, "9", function()
    hs.applescript._applescript('tell front window of app "Safari" to set current tab to tab 9')
end)
