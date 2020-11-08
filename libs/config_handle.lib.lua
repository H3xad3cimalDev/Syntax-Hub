local config_lib = {config = {}};

local httpService = game:GetService("HttpService");
local config_name = game.PlaceId .. ".syntax_h.json";

print('Loading Config Library...');

if not isfolder("Syntax Hub JSON") then
    makefolder("Syntax Hub JSON");
end;

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
    if not config_lib:IfSetting(sName) then
        table.insert(config_lib.config, unpack({ [tostring(sName)] = uValue } ));
        return true;
    else
        config_lib.config[sName] = uValue;
        return true;
    end
end;

function config_lib:GetSetting(sName)
    if config_lib:IfSetting(sName) then
        return config_lib.config[sName];
    else
        return nil;
    end
end;

print('Loaded Config Library!');

return config_lib;