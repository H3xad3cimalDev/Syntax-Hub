local httpService = game:GetService("HttpService");
local gameList    = httpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/Syntax-Hub/master/info/gameList.json", true));

if gameList[tostring(game.PlaceId)] then

else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Syntax Hub Bootstrap",
        Text  = "We're sorry for the issue but we couldn't find a script for the game " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId) .. ". :("
        Duration = 6,
        Button1 = "Ok"
    });
end;