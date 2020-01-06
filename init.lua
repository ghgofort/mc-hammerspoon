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

  }

  hs.layout.apply(windows);

