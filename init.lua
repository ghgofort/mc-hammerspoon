--------------------------------------------------------------------------------
-- GGoforth / Hammerspoon config file
--------------------------------------------------------------------------------

-- Include local machine variables
require("localvars")

--------------------------------------------------------------------------------
-- Key Combinations
--------------------------------------------------------------------------------
local cmd = {'cmd'}
local cmc = {'cmd', 'ctrl'}
local cmac = {'cmd', 'alt', 'ctrl'}
local cma = {'cmd', 'alt'}
local ac = {'alt', 'ctrl'}

--------------------------------------------------------------------------------
-- Application Shortcuts
--------------------------------------------------------------------------------
hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)

--------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------

-- Loads work related apps.
function load_work_apps()
  local apps = {
    {"Clockify Desktop"}
    {"iTerm"},
    {"Google Chrome"},
    {"Microsoft OneNote"},
    {"Microsoft Outlook"},
    {"Slack"},
    {"Visual Studio Code"},
  }

  -- Open Applications
  for i, app in ipairs(appList) do
    hs.application.launchOrFocus(app[1])
  end

  -- Arrange Applications
  hs.timer.doAfter(3, function()
    arrange_apps()
  end)
end

-- Arrange apps to different spaces & windows.
function arrange_apps()
  local windows = {
    -- Left Monitor
    {"Microsoft Outlook", nil, hs.screen.allScreens()[3], hs.geometry.rect{0, (1/3), (2/3), (2/3)}, nil, nil},
    {"Google Chrome", nil, hs.screen.allScreens()[3], hs.geometry.rect{2/3, 0, 0.12, 0.5}, nil, nil},

    -- Middle Monitor
    {"Visual Studio Code", nil, hs.screen.allScreens()[1], hs.geometry.rect{0, 0, (2/3), 1}, nil, nil},

    -- Right Monitor
    {"iTerm", "1. Shell", hs.screen.allScreens()[2], hs.geometry.rect{(2/3), 0, (1/3), 1}, nil, nil},
    {"Microsoft OneNote", nil, hs.screen.allScreens()[2], hs.geometry.rect{0, 0, 1, 1}, nil, nil},
    {"Slack", nil, hs.screen.allScreens()[2], hs.geometry.rect{0, 0.3, 0.5, 0.7}, nil, nil}
  }

  hs.layout.apply(windows);
end

-- Individual Application Hotkeys
hs.fnutils.each({
  { key = "c", app = "Google Chrome" },
  { key = "l", app = "Slack" },
  { key = "t", app = "iTerm" },
  { key = "o", app = "Microsoft Outlook" },
  { key = "g", app = "TogglDesktop" },
  { key = "z", app = "Visual Studio Code" }
}, function(object)
  hotkey.bind(cma, object.key, function() hs.application.launchOrFocus(object.app) end)
end)
