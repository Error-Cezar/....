-- https://www.roblox.com/games/510444657/CRIMINAL-VS-SWAT
local Global = getgenv and getgenv() or _G

local TeamCheck = Global.TeamCheck or false
local Loop = Global.LoopKill or false
local StopMessage = Global.StopMessage or "stop"

function notify(title, Message)
	game:GetService("StarterGui"):SetCore("SendNotification", { 
		Title = title;
		Text = Message;
		Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
end


function Kill(v: Player)
    if not v.Character then return end
    if not v.Character:FindFirstChild("Humanoid") then return end
    if not v.Character:FindFirstChild("Head") then return end
    local ohInstance1 = v.Character.Humanoid
    local ohInstance2 = v.Character.Head
    local ohNumber3 = 105
    local ohVector34 = Vector3.new(-0.9070560932159424, -0.419465035200119, -0.03603137284517288)
    local ohNumber5 = 0
    local ohBoolean6 = false
    local ohBoolean7 = false
    local Gun = game:GetService("Players").LocalPlayer.Character:FindFirstAncestorWhichIsA("Tool")
    if Gun == nil then
        for _,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if string.find(v.Name:lower(), "sniper") then
                Gun = v
            end
        end
    end
    if Gun == nil then notify("Error", "No valid weapon found.") return end
    Gun.GunScript_Server.InflictTarget:FireServer(ohInstance1, ohInstance2, ohNumber3, ohVector34, ohNumber5, ohBoolean6, ohBoolean7)
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
