-- test for work
local config_lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/libs/config_handle.lib.lua", true))();
local imgui      = loadstring(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/libs/syntax_ui.lib.lua", true))();

local hub_window  = imgui:AddWindow("Syntax Hub - Counter Blox");

local tab_aim     = hub_window:AddTab("Aim");
local tab_vision  = hub_window:AddTab("Visual");
local tab_gunmod  = hub_window:AddTab("Gun Modifications");
local tab_credits = hub_window:AddTab("Credits");

-- Credits
tab_credits:AddButton("H3xad3cimal Github", function()
    setclipboard("https://github.com/H3xad3cimalDev");
end)

-- Aim
local switch_silent_aim = tab_aim:AddSwitch("Silent Aim", function(s)

end);

local switch_team_check = tab_aim:AddSwitch("Team Check", function(s)

end);

-- Vision
local switch_bullet_tracers = tab_vision:AddSwitch("Bullet Tracers", function(s)

end);

local switch_team_check = tab_vision:AddSwitch("ESP", function(s)

end);
-- Mod Guns
local button_infinte_ammo = tab_gunmod:AddButton("Infinite Ammo", function()

end)