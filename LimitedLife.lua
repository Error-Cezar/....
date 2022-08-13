-- https://www.roblox.com/games/10219658196/Limited-Life
local Global = getgenv and getgenv() or _G
local Loop = Global.Looped or false
local Time = Global.Time or 500
local StopMessage = Global.StopMessage or "stop"

function GetTime(TimeInSec)
    local ohNumber1 = TimeInSec
    local ohInstance2 = workspace.Tasks["UnNamed Task"]
    game:GetService("ReplicatedStorage").remotes.TaskCompleted:FireServer(ohNumber1, ohInstance2)
end
game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.Tasks.CreateTaskServer:InvokeServer("NoFolder")
wait()
game:GetService("ReplicatedStorage").remotes.createQuestServer:FireServer(1000, workspace.Tasks["UnNamed Task"])
if Loop then
    StepLoop = game:GetService("RunService").Stepped:Connect(function(time, deltaTime)
    if Loop == false then StepLoop:Disconnect() return end
       GetTime(Time)
    end)
    game:GetService("Players").LocalPlayer.Chatted:Connect(function(message)
        if message:lower() == StopMessage:lower() then Loop = false end
    end)
    else
       GetTime(Time)
end
