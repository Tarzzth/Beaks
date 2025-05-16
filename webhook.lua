local url = "https://discord.com/api/webhooks/1371024170581889054/ZnDO1c5wO05anqIg3bPkb_X9rp9zJNdpsKZIjQaDuerSXh8ahLu7SrAxVwQCjwUQXyn6" -- เปลี่ยนเป็นของคุณ

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer

-- ดึงชื่อเกมจริงจาก MarketplaceService
local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)

local gameName = success and info.Name or "Unknown"

local data = {
    embeds = {
        {
            title = "📦 Data Log",
            description = "```" ..
                "\nGame Name   : " .. gameName ..
                "\nPlace ID    : " .. game.PlaceId ..
                "\nJob ID      : " .. game.JobId ..
                "\n\nPlayer Name : " .. player.Name ..
                "\nUser ID     : " .. player.UserId ..
            "\n```",
            color = 1376199,
            author = {
                name = "Player Run Script"
            }
        }
    },
    attachments = {}
}

local newdata = HttpService:JSONEncode(data)
local headers = {
    ["Content-Type"] = "application/json"
}

local request = http_request or request or syn.request or http.request
if request then
    request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = newdata
    })
else
    warn("ไม่พบฟังก์ชัน request ที่ใช้ได้ใน executor นี้")
end
