local config_lib = {};

local httpService = game:GetService("HttpService");
local config_name = game.PlaceId .. ".syntax_h.json";

if not isfolder("Syntax Hub JSON") then
    makefolder("Syntax Hub JSON");
end;

writefile("Syntax Hub JSON/readme.txt", game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/info/db_readme.txt", true));

if isfile("Syntax Hub JSON/" .. config_name) then
    config = httpService:JSONDecode(readfile("Syntax Hub JSON/" .. config_name));
else
	config = {};
end;

function config_lib:IfSetting(sName)
    if config[sName] then
        return true;
    else
        return false;
    end
end;

function config_lib:Config2JSON()
    return httpService:JSONEncode(config);
end;

function config_lib:Write2Config()
    writefile("Syntax Hub JSON/" .. config_name, config_lib:Config2JSON());
end;

function config_lib:SetSetting(sName, uValue)
    config[sName] = uValue;
end;

function config_lib:GetSetting(sName)
    return config[sName]
end;

return config_lib;