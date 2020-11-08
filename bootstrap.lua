-- Simple Bootstrap script that will auto load the script for the game
print('Loading Bootstrap...');
local httpService = game:GetService("HttpService");
local gameList    = httpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/info/gameList.json", true));
for i,v in pairs(gameList)
print(i,v)
end
local info        = gameList[tostring(game.PlaceId)];

if info ~= nil then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/scripts/" .. info.Script, true))();
    print("Executed Script and Loaded Bootstrap!");
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Syntax Hub Bootstrap",
        Text  = "We're sorry for the issue but we couldn't find a script for the game " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) .. ". :(",
        Duration = 6,
        Button1 = "Ok"
    });
    print("Failed to Load Bootstrap.");
end;