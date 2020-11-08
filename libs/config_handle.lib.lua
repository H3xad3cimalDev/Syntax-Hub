local config_lib = {config = {}};

local httpService = game:GetService("HttpService");
local config_name = game.PlaceId .. ".syntax_h.json";

print('Loading Config Library...');

if not isfolder("Syntax Hub JSON") then
    makefolder("Syntax Hub JSON");
end;

writefile("Syntax Hub JSON/readme.txt", game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/info/db_readme.txt", true));

if isfile("Syntax Hub JSON/" .. config_name) then
    config = httpService:JSONDecode(readfile("Syntax Hub JSON/" .. config_name));
end;

function config_lib:IfSetting(sName)
    if config_lib.config[sName] then
        return true;
    else
        return false;
    end
end;

function config_lib:Config2JSON()
    return httpService:JSONEncode(config_lib.config);
end;

function config_lib:Write2Config()
    writefile("Syntax Hub JSON/" .. config_name, config_lib:Config2JSON());
end;

function config_lib:SetSetting(sName, uValue)
    config_lib.config[sName] = uValue;
end;

function config_lib:GetSetting(sName)
    -- for some unholy reason doing "return config_lib.config[sName]" doesn't work
    for i,v in pairs(config_lib.config) do
        print(i);
        if i == sName then
            return v;
        end
    end
end;

print('Loaded Config Library!');

return config_lib;