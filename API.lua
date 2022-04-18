-- Error's API by Error-Cezar yes yes

module = {}

local httpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer

function module:TeleportToPart(part)
    if not part:IsA("BasePart") then
       warn("Expected <Part type> Instance")
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
	else
		return warn("Couldn't find a server for serverhop.")
	end
end

function module:Loadstring(rawlink)
    if rawlink == nil then warn("Rawlink expected.")
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

function module:Esp(toggle, player)
    if toggle == false and game:GetService("CoreGui"):FindFirstChild("Silver Balls") then
        game:GetService("CoreGui"):FindFirstChild("Silver Balls"):Destroy()
        return
    end 
warn("Idk first time trying to make an ESP so yea.") 
local GUI = Instance.new("ScreenGui", game:GetService("CoreGui"))
GUI.Name = "Silver Balls"
if player ~= nil then
    if not player.Character then return warn("Invalid player.") end
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
				TextLabel.Text = 'Name: '..plr.Name.." | HP: "..plr.Character.Humanoid.Health.."\nTeam: "..plr.Team.Name
				TextLabel.ZIndex = 10
    for _,v in pairs(player.Character:GetChildren()) do
        if v:IsA("BasePart") then
            local a = Instance.new("BoxHandleAdornment", GUI)
            a.Name = player.Name
            a.Adornee = v
            a.AlwaysOnTop = true
            a.Size = v.Size
            a.Color = player.TeamColor
        end
    end
else
    for _,player in pairs(Players:GetPlayers()) do
        if player.Name ~= LP.Name then
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
        TextLabel.Text = 'Name: '..plr.Name.." | HP: "..plr.Character.Humanoid.Health.."\nTeam: "..plr.Team.Name
        TextLabel.ZIndex = 10
        for _,v in pairs(player.Character:GetChildren()) do
           if v:IsA("BasePart") then
              local a = Instance.new("BoxHandleAdornment", GUI)
               a.Name = player.Name
               a.Adornee = v
               a.AlwaysOnTop = true
               a.Size = v.Size
               a.Color = player.TeamColor
            end
        end
    end
    end
end
end

function module:TriggerInterest(Interest)
    firetouchinterest(LP.Character.HumanoidRootPart, Interest, 1)
    wait(0.1)
    firetouchinterest(LP.Character.HumanoidRootPart, Interest, 0)
end

return module
