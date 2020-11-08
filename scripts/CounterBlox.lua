-- test for work
local config_lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/libs/config_handle.lib.lua", true))();
local uilib      = loadstring(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/libs/syntax_ui.lib.lua", true))();

local switchon = config_lib:GetSetting("switch");
if switchon == nil then
    config_lib:SetSetting("switch", false);
end;
switchon = config_lib:GetSetting("switch");
print(switchon);
local window = uilib:AddWindow("Test");
local tab1   = window:AddTab("Test 1");
tab1:AddButton("Print", function()
    print('test')
end)
local switch = tab1:AddSwitch("Test Save", function(s)
    switchon = s;
end)
switch:Set(switchon);

game:GetService("Players").PlayerRemoving:Connect(function(Player)
    if Player == game:GetService("Players").LocalPlayer then
        config_lib:SetSetting("switch", switchon);
        config_lib:Write2Config();
    end
end)