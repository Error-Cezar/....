-- https://www.roblox.com/games/510444657/CRIMINAL-VS-SWAT
local Global = getgenv and getgenv() or _G

local TeamCheck = Global.TeamCheck or true
local Loop = Global.Loop or true
local StopMessage = Global.StopMessage or "stop"

function Kill(v: Player)
    local ohInstance1 = v.Character.Humanoid
    local ohInstance2 = v.Character.Head
    local ohNumber3 = 105
    local ohVector34 = Vector3.new(-0.9070560932159424, -0.419465035200119, -0.03603137284517288)
    local ohNumber5 = 0
    local ohBoolean6 = false
    local ohBoolean7 = false
    
    game:GetService("Players").LocalPlayer.Backpack.Sniperswat.GunScript_Server.InflictTarget:FireServer(ohInstance1, ohInstance2, ohNumber3, ohVector34, ohNumber5, ohBoolean6, ohBoolean7)
end

if Loop then
StepLoop = game:GetService("RunService").Stepped:Connect(function(time, deltaTime)
if Loop == false then StepLoop:Disconnect() return end
for _,v in pairs(game:GetService("Players"):GetPlayers()) do
    if v == game:GetService("Players").LocalPlayer then continue end 
    if v.Team == game:GetService("Players").LocalPlayer.Team and TeamCheck then continue end
    Kill(v)
end
end)
game:GetService("Players").LocalPlayer.Chatted:Connect(function(message)
    if message:lower() == StopMessage:lower() then Loop = false end
end)
else
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
        if v == game:GetService("Players").LocalPlayer then continue end 
        if v.Team == game:GetService("Players").LocalPlayer.Team and TeamCheck then continue end
        Kill(v)
    end
end