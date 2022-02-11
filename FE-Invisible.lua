-- FE Invisible by YetAnotherDumbBoi/Error-Cezar
-- Inspired from BitingTheDust version ; https://v3rmillion.net/member.php?action=profile&uid=1628149

local SoundService = game:GetService("SoundService")
local StoredCF
local SafeZone
if _G.CFrame ~= nil then
	if type(_G.CFrame) ~= "userdata" then return error("CFrame must be a userdata (CFrame.new(X, X, X)") end
	SafeZone = _G.CFrame
else
	SafeZone = CFrame.new(0,-300,0)       
end

local ScriptStart = true
local Activate
local Noclip
if _G.Key == nil then
	Activate = "F"
else
	Activate = tostring(_G.Key)     
end

if _G.Noclip == nil then
	Noclip = false
else
	Noclip = _G.Noclip        
end

if type(Noclip) ~= "boolean" then return error("Noclip value isn't a boolean") end

function notify(Message)
	game:GetService("StarterGui"):SetCore("SendNotification", { 
		Title = "FE Invisible";
		Text = Message;
		Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://7046168694"
	SoundService:PlayLocalSound(sound)
end

if _G.Running then
   return notify("Script is already running")
   else
       _G.Running = true
end

local IsInvisible = false
local WasInvisible = false
local Died = false
local LP = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
repeat wait() until LP.Character:FindFirstChild("Humanoid")
local RealChar = LP.Character or LP.CharacterAdded:Wait()
RealChar.Archivable = true
local FakeChar = RealChar:Clone()
FakeChar.Parent = game:GetService("Workspace")

for _, child in pairs(FakeChar:GetDescendants()) do
	if child:IsA("BasePart") and child.CanCollide == true then
		child.CanCollide = false
	end
end

FakeChar:SetPrimaryPartCFrame(SafeZone * CFrame.new(0, 5, 0))

local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = SafeZone
Part.CanCollide = true


for i, v in pairs(FakeChar:GetDescendants()) do
	if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
		v.Transparency = 0.7
	end
end

for i, v in pairs(RealChar:GetChildren()) do
	if v:IsA("LocalScript") then
		local clone = v:Clone()
		clone.Disabled = true
		clone.Parent = FakeChar
	end
end

function StopScript()
    	if ScriptStart == false then return end
    if Died == false then
        notify("The character used died!\nStopping...")
    Part:Destroy()
    if IsInvisible then
    Visible() 
    WasInvisible = true
    end
    
    if FakeChar then
        FakeChar:Destroy()
    end
    
    if RealChar:WaitForChild("Humanoid").Health > 0 and WasInvisible then
        RealChar:WaitForChild("Humanoid").Health = 0
    end
    _G.Running = false
    ScriptStart = false
    notify("You can rerun the script when ever you want!")
end
end

RealChar:WaitForChild("Humanoid").Died:Connect(function()
	StopScript()
end)


FakeChar:WaitForChild("Humanoid").Died:Connect(function()
StopScript()
end)

function Invisible()
	StoredCF = RealChar:GetPrimaryPartCFrame()
	if Part == nil then
		FakeChar:WaitForChild("HumanoidRootPart").Anchored = false
	end
	for _, child in pairs(FakeChar:GetDescendants()) do
		if child:IsA("BasePart") and child.CanCollide == true then
			child.CanCollide = true
		end
	end
	FakeChar:SetPrimaryPartCFrame(StoredCF)
	LP.Character = FakeChar
	game:GetService("Workspace").CurrentCamera.CameraSubject = FakeChar:WaitForChild("Humanoid")
	if Noclip == false then
		for _, child in pairs(RealChar:GetDescendants()) do
			if child:IsA("BasePart") and child.CanCollide == true then
				child.CanCollide = false
			end
		end
	end

	RealChar:SetPrimaryPartCFrame(SafeZone * CFrame.new(0, 5, 0))
	if Part == nil then
		RealChar:WaitForChild("HumanoidRootPart").Anchored = true
	end
	RealChar:WaitForChild("Humanoid"):UnequipTools()

	for i, v in pairs(FakeChar:GetChildren()) do
		if v:IsA("LocalScript") then
			v.Disabled = false
		end
	end
end

function Visible()
	StoredCF = FakeChar:GetPrimaryPartCFrame()
	if Part == nil then
		RealChar:WaitForChild("HumanoidRootPart").Anchored = false
	end
	for _, child in pairs(RealChar:GetDescendants()) do
		if child:IsA("BasePart") and child.CanCollide == true then
			child.CanCollide = true
		end
	end
	RealChar:SetPrimaryPartCFrame(StoredCF)
	LP.Character = RealChar
	FakeChar:WaitForChild("Humanoid"):UnequipTools()
	game:GetService("Workspace").CurrentCamera.CameraSubject = RealChar:WaitForChild("Humanoid")
	for _, child in pairs(FakeChar:GetDescendants()) do
		if child:IsA("BasePart") and child.CanCollide == true then
			child.CanCollide = false
		end
	end
	FakeChar:SetPrimaryPartCFrame(SafeZone * CFrame.new(0, 5, 0))
	if Part == nil then
		FakeChar:WaitForChild("HumanoidRootPart").Anchored = true
	end
	for i, v in pairs(FakeChar:GetChildren()) do
		if v:IsA("LocalScript") then
			v.Disabled = true
		end
	end
end


UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if ScriptStart == false then return end
	if gameProcessed then return end
	print(input.KeyCode.Name)
	if input.KeyCode.Name:lower() ~= Activate:lower() then return end
	print(IsInvisible)
	if IsInvisible == false then
		Invisible()
		IsInvisible = true
	else
		Visible()
		IsInvisible = false
	end
end)

notify("Press "..Activate.." to turn on/off invisibility!")
