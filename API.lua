-- Error's API by Error-Cezar yes yes

module = {}

local ESPStorage = {}
local ESPPart = {}
local httpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local GUI = nil
local PartGUI = nil
local PlayerOnly = false

function module:TeleportToPart(part)
	if not part:IsA("BasePart") then
		warn("Expected <BasePart> Instance")
		return
	end
	LP.Character:SetPrimaryPartCFrame(part.CFrame)
end

function module:TeleportToPlayer(player)
	local plr = nil

	if typeof(player) ~= "Instance" then
		for _, australia in pairs(Players:GetPlayers()) do
			if string.sub(string.lower(australia.Name), 0, string.len(player)) == string.lower(player) then
				plr = australia
			end
		end
	end
	if plr == nil then warn("Player not found.") return end
	LP.Character:SetPrimaryPartCFrame(plr.Character:WaitForChild("HumanoidRootPart").CFrame)
end


function module:Rejoin()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
end

function module:ServerHop()
	-- "borrow'ed from Infinity Yield"
	local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
		local function localTeleportWithRetry(placeId, retryTime)
       game:GetService("TeleportService").TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
        if player == LP then
           warn("Teleport failed, TeleportResult: "..teleportResult.Name)
            -- check the teleportResult to ensure it is appropriate to retry
            if teleportResult == Enum.TeleportResult.Failiure or teleportResult == Enum.TeleportResult.Flooded then
		warn("Retrying ServerHoping")
                module:ServerHop()
            end
        end
    end)
	else
		return warn("Couldn't find a server for serverhop.")
	end
end

function module:Loadstring(rawlink)
	if rawlink == nil then return warn("Rawlink expected.") end
	loadstring(game:HttpGet(rawlink)) ()
end

function module:HttpSend(Type, Url, Header, body)
	local httpRequest = (syn and syn.request) or (httpService and httpService.request) or (http_request)
	if not httpRequest then warn("HTTPService not found.") return end
	if Type ~= "GET" and Type ~= "POST" then warn("Invalid request type.") return end
	if typeof(Header) ~= "table" then warn("Header type must be table got "..typeof(Header)) return end 
	if typeof(body) ~= "string" then warn("Invalid Body type.") return end
	if typeof(Url) ~= "string" then warn("Invalid Body type.") return end
	httpRequest {
		Url = Url;
		Method = Type;
		Headers = Header;
		Body = body
	};
end

function module:DestroySeat(Seat)
	if not Seat:IsA("Seat") and not Seat:IsA("VehiculeSeat") then warn("Seat expected.") return end
	if Seat.Occupant ~= nil then warn("Seat is already been used.") return end
	Seat:Sit(LP.Character.Humanoid)
	LP.Character.Humanoid.Health = 0
	Seat:Sit(LP.Character.Humanoid)
end

function module:View(player)
	local plr = nil

	if typeof(player) ~= "Instance" then
		for _, australia in pairs(Players:GetPlayers()) do
			if string.sub(string.lower(australia.Name), 0, string.len(player)) == string.lower(player) then
				plr = australia
			end
		end
	end
	if plr == nil then warn("Player not found.") return end
	Workspace.CurrentCamera.CameraSubject = plr.Character
end


function module:UnView()
	if Workspace.CurrentCamera.CameraSubject == LP.Character then warn("View isn't active at the moment.") return end
	Workspace.CurrentCamera.CameraSubject = LP.Character
end

function module:GetPosition(Player)
	if Player == nil then Player = LP end
	
	if typeof(player) ~= "Instance" then
		for _, australia in pairs(Players:GetPlayers()) do
			if string.sub(string.lower(australia.Name), 0, string.len(player)) == string.lower(player) then
				plr = australia
			end
		end
	end
	if typeof(player) ~= "Instance" then warn("No player found.") return end
	if not Player.Character or not Player.Character:GetPrimaryPartCFrame() then warn("No character found.") return end
	return Player.Character:GetPrimaryPartCFrame()
end

function module:Equip(item)
	if not item or not item:IsA("Tool") then warn("No tool found")
        item.Parent = LP.Character
end
end

function Update(player)
	for _,v in pairs(GUI:GetChildren()) do
		if v.Name == player.Name then v:Destroy() end
	end
	local Tea
	if player.Team == nil then Tea = "None" else Tea = player.Team.Name end
	local BillboardGui = Instance.new("BillboardGui", GUI)
	local TextLabel = Instance.new("TextLabel", BillboardGui)
	BillboardGui.Adornee = player.Character.Head
	BillboardGui.Name = player.Name
	BillboardGui.Size = UDim2.new(0, 100, 0, 150)
	BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
	BillboardGui.AlwaysOnTop = true
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 20
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = 'Name: '..player.Name.." | HP: "..player.Character.Humanoid.Health.."\nTeam: "..Tea
	TextLabel.ZIndex = 10
	for _,v in pairs(player.Character:GetChildren()) do
		if v:IsA("BasePart") then
			local a = Instance.new("BoxHandleAdornment", GUI)
			a.Name = player.Name
			a.Adornee = v
			a.AlwaysOnTop = true            
			a.ZIndex = 10
			a.Size = v.Size
			a.Color = player.TeamColor
		end
	end
local Tea
if player.Team == nil then Tea = "None" else Tea = player.Team.Name end
local BillboardGui = Instance.new("BillboardGui", GUI)
local TextLabel = Instance.new("TextLabel", BillboardGui)
BillboardGui.Adornee = player.Character.Head
BillboardGui.Name = player.Name
BillboardGui.Size = UDim2.new(0, 100, 0, 150)
BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
BillboardGui.AlwaysOnTop = true
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 0, -50)
TextLabel.Size = UDim2.new(0, 100, 0, 100)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.TextSize = 20
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextStrokeTransparency = 0
TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
TextLabel.Text = 'Name: '..player.Name.." | HP: "..player.Character.Humanoid.Health.."\nTeam: "..Tea
TextLabel.ZIndex = 10
for _,v in pairs(player.Character:GetChildren()) do
	if v:IsA("BasePart") then
		local a = Instance.new("BoxHandleAdornment", GUI)
		a.Name = player.Name
		a.Adornee = v
		a.AlwaysOnTop = true            
		a.ZIndex = 10
		a.Size = v.Size
		a.Color = player.TeamColor
	end
end
end

function Add(player)
	local Tea
	if player.Team == nil then Tea = "None" else Tea = player.Team.Name end
	local BillboardGui = Instance.new("BillboardGui", GUI)
	local TextLabel = Instance.new("TextLabel", BillboardGui)
	BillboardGui.Adornee = player.Character.Head
	BillboardGui.Name = player.Name
	BillboardGui.Size = UDim2.new(0, 100, 0, 150)
	BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
	BillboardGui.AlwaysOnTop = true
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 20
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = 'Name: '..player.Name.." | HP: "..player.Character.Humanoid.Health.."\nTeam: "..Tea
	TextLabel.ZIndex = 10
	for _,v in pairs(player.Character:GetChildren()) do
		if v:IsA("BasePart") then
			local a = Instance.new("BoxHandleAdornment", GUI)
			a.Name = player.Name
			a.Adornee = v
			a.AlwaysOnTop = true            
			a.ZIndex = 10
			a.Size = v.Size
			a.Color = player.TeamColor
		end
	end

local Tea
if player.Team == nil then Tea = "None" else Tea = player.Team.Name end
local BillboardGui = Instance.new("BillboardGui", GUI)
local TextLabel = Instance.new("TextLabel", BillboardGui)
BillboardGui.Adornee = player.Character.Head
BillboardGui.Name = player.Name
BillboardGui.Size = UDim2.new(0, 100, 0, 150)
BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
BillboardGui.AlwaysOnTop = true
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 0, -50)
TextLabel.Size = UDim2.new(0, 100, 0, 100)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.TextSize = 20
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextStrokeTransparency = 0
TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
TextLabel.Text = 'Name: '..player.Name.." | HP: "..player.Character.Humanoid.Health.."\nTeam: "..Tea
TextLabel.ZIndex = 10
for _,v in pairs(player.Character:GetChildren()) do
	if v:IsA("BasePart") then
		local a = Instance.new("BoxHandleAdornment", GUI)
		a.Name = player.Name
		a.Adornee = v
		a.AlwaysOnTop = true            
		a.ZIndex = 10
		a.Size = v.Size
		a.Color = player.TeamColor
	end
end
end

function module:Esp(toggle, player)
	if typeof(toggle) ~= "boolean" then warn("Expected a bool value") return end
	if toggle == false and game:GetService("CoreGui"):FindFirstChild("Silver Balls") then
		game:GetService("CoreGui"):FindFirstChild("Silver Balls"):Destroy()
		for a,v in pairs(ESPStorage) do
			v:Disconnect()
			table.remove(ESPStorage, a)
		end
		return
	end 
	warn("Idk first time trying to make an ESP so yea.") 
	GUI = Instance.new("ScreenGui", game:GetService("CoreGui"))
	GUI.Name = "Silver Balls"
	if player ~= nil then
		if not player.Character then return warn("Invalid player.") end
		PlayerOnly = true
		task.spawn(function()
			local Temp2 = player:GetPropertyChangedSignal("Team"):Connect(function()
				Update(player)
			end)
			local Temp = player.CharacterAdded:Connect(function()        
				repeat wait() until player.Character:FindFirstChild("Humanoid")
				wait(1)
				Update(player)
			end)
			table.insert(ESPStorage, Temp)
		end)
		Add(player)
	else
		PlayerOnly = false
		for _,player in pairs(Players:GetPlayers()) do
            if player.Name ~= LP.Name then
			task.spawn(function()
				local Temp2 = player:GetPropertyChangedSignal("Team"):Connect(function()
					Update(player)
				end)
				local Temp = player.CharacterAdded:Connect(function()        
					repeat wait() until player.Character:FindFirstChild("Humanoid")
					wait(1)
					Update(player)
				end)
				table.insert(ESPStorage, Temp)
			end)
			Add(player)
		end
    end
	end
end

function AddPart(part)
	local BillboardGui = Instance.new("BillboardGui", PartGUI)
	local TextLabel = Instance.new("TextLabel", BillboardGui)
	BillboardGui.Adornee = part
	BillboardGui.Name = part:GetFullName()
	BillboardGui.Size = UDim2.new(0, 100, 0, 150)
	BillboardGui.StudsOffset = Vector3.new(0, 1, 0)
	BillboardGui.AlwaysOnTop = true
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0, 0, 0, -50)
	TextLabel.Size = UDim2.new(0, 100, 0, 100)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.TextSize = 20
	TextLabel.TextColor3 = Color3.new(1, 1, 1)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	TextLabel.Text = ''
	TextLabel.ZIndex = 10

    local a = Instance.new("BoxHandleAdornment", PartGUI)
    a.Name = part:GetFullName()
    a.Adornee = part
    a.AlwaysOnTop = true            
    a.ZIndex = 10
    a.Size = part.Size
    a.Transparency = 0.5
    table.insert(ESPPart, part)
end

function module:PartEsp(toggle, part)
    if typeof(toggle) ~= "boolean" then warn("Expected a bool value") return end
	if toggle == false and game:GetService("CoreGui"):FindFirstChild("Silver") then
		game:GetService("CoreGui"):FindFirstChild("Silver"):Destroy()
		PartGUI = nil
		for a,v in pairs(ESPPart) do
			table.remove(ESPPart, a)
		end
		return
	end 
    if toggle == true then
    if PartGUI == nil then
    PartGUI = Instance.new("ScreenGui", game:GetService("CoreGui"))
	PartGUI.Name = "Silver"
    end
	print(part)
if part:IsA("BasePart") then
AddPart(part)
end

  if part:IsA("Model") then
     for _,v in pairs(part:GetDescendants()) do
       if v:IsA("BasePart") then AddPart(v) end
     end
  end
end
end

game:GetService("Workspace").DescendantRemoving:Connect(function(descendant)
    if PartGUI ~= nil then
    for _,v in pairs(PartGUI:GetChildren()) do
        if v.Name == descendant:GetFullName() then v:Destroy() end
    end
end
end)


	Players.PlayerRemoving:Connect(function(player)
		if GUI ~= nil then
			for _,v in pairs(GUI:GetChildren()) do
				if v.Name == player.Name then v:Destroy() end
			end
		end
	end)

	Players.PlayerAdded:Connect(function(player)
		if GUI ~= nil and PlayerOnly == false then
		
            repeat wait() until player.Character
					repeat wait() until player.Character:FindFirstChild("Humanoid")
					wait(1)
					task.spawn(function()
						local Temp2 = player:GetPropertyChangedSignal("Team"):Connect(function()
							Update(player)
						end)
						local Temp = player.CharacterAdded:Connect(function()        
							repeat wait() until player.Character:FindFirstChild("Humanoid")
							wait(1)
							Update(player)
						end)
						table.insert(ESPStorage, Temp)
					end)
					Add(player)
				end
			end)

			function module:TriggerInterest(Interest)
				firetouchinterest(LP.Character.HumanoidRootPart, Interest, 1)
				wait(0.1)
				firetouchinterest(LP.Character.HumanoidRootPart, Interest, 0)
			end
			return module
