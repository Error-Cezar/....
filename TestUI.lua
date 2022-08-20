local Global = getgenv and getgenv() or _G
module = {}

function module:CreateUI(Location, UIName: string)
    if Location == nil then Location = game:GetService("Players").LocalPlayer.PlayerGui end
    if UIName == nil then error("UIName is undefined") return end
    Global.__ErrorUIName = UIName
    local ScreenGui = Instance.new("ScreenGui", Location)
    local Frame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local Header = Instance.new("Frame")
    local UICorner_1 = Instance.new("UICorner")
    local UIStroke_1 = Instance.new("UIStroke")
    local TextLabel = Instance.new("TextLabel")
    local cross = Instance.new("ImageButton")
    local Frames = Instance.new("Frame")
    local Selector = Instance.new("Frame")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Toggle = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local UIStroke_2 = Instance.new("UIStroke")
    local UICorner_3 = Instance.new("UICorner")
    local UIStroke_3 = Instance.new("UIStroke")
    local Template = Instance.new("Folder")
    local Space = Instance.new("Frame")
    local TextBox = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
    local UIStroke_4 = Instance.new("UIStroke")
    local more_horiz = Instance.new("ImageButton")
    local TextBox_1 = Instance.new("TextBox")
    local UICorner_5 = Instance.new("UICorner")
    local UIStroke_5 = Instance.new("UIStroke")
    local Button = Instance.new("TextButton")
    local UICorner_6 = Instance.new("UICorner")
    local UIStroke_6 = Instance.new("UIStroke")
    local more_horiz_1 = Instance.new("ImageButton")
    local Label = Instance.new("TextLabel")
    local UICorner_7 = Instance.new("UICorner")
    local UIStroke_7 = Instance.new("UIStroke")
    local Frame_1 = Instance.new("ScrollingFrame")
    local UICorner_8 = Instance.new("UICorner")
    local UIListLayout_1 = Instance.new("UIListLayout")
    local SelectorButton = Instance.new("ImageButton")
    local Button_1 = Instance.new("TextButton")
    
    
    ScreenGui.Name = UIName or "ScreenGui"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Frame.Parent = ScreenGui
    Frame.Name = "Frame"
    Frame.BackgroundColor3 = Color3.new(0.192157, 0.192157, 0.192157)
    Frame.ClipsDescendants = true
    Frame.Position = UDim2.new(0.29688751697540283,0,0.10935796052217484,0)
    Frame.Size = UDim2.new(0,619,0,341)
    
    UICorner.Parent = Frame
    UICorner.Name = "UICorner"
    
    UIStroke.Parent = Frame
    UIStroke.Name = "UIStroke"
    
    Header.Parent = Frame
    Header.Name = "Header"
    Header.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
    Header.BorderSizePixel = 0
    Header.Position = UDim2.new(0.012247655540704727,0,0.025852985680103302,0)
    Header.Size = UDim2.new(0,599,0,40)
    Header.ZIndex = 0
    
    UICorner_1.Parent = Header
    UICorner_1.Name = "UICorner"
    
    UIStroke_1.Parent = Header
    UIStroke_1.Name = "UIStroke"
    UIStroke_1.Color = Color3.new(1, 0, 0.0156863)
    UIStroke_1.Thickness = 2
    
    TextLabel.Parent = Header
    TextLabel.Name = Name
    TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
    TextLabel.BackgroundTransparency = 1
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(0,599,0,40)
    TextLabel.Font = Enum.Font.GothamMedium
    TextLabel.Text = [[UI Name]]
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextSize = 17
    
    cross.Parent = Header
    cross.Name = "cross"
    cross.BackgroundTransparency = 1
    cross.Position = UDim2.new(0.9340567588806152,0,0.17500001192092896,0)
    cross.Size = UDim2.new(0,25,0,25)
    cross.ZIndex = 2
    cross.Image = [[rbxassetid://6764432408]]
    cross.ImageRectOffset = Vector2.new(200, 600)
    cross.ImageRectSize = Vector2.new(50, 50)
    
    Frames.Parent = Frame
    Frames.Name = "Frames"
    Frames.BackgroundColor3 = Color3.new(1, 1, 1)
    Frames.BackgroundTransparency = 1
    Frames.Position = UDim2.new(0.012247655540704727,0,0.1994134485721588,0)
    Frames.Size = UDim2.new(0,611,0,273)
    Frames.ZIndex = 0
    
    Selector.Parent = Frame
    Selector.Name = "Selector"
    Selector.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
    Selector.BorderSizePixel = 0
    Selector.Position = UDim2.new(-0.000047378664021380246,0,0.025852996855974197,0)
    Selector.Size = UDim2.new(0,192,0,321)
    
    ScrollingFrame.Parent = Selector
    ScrollingFrame.Name = "ScrollingFrame"
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.Position = UDim2.new(0,0,0.04157634824514389,0)
    ScrollingFrame.Size = UDim2.new(0,190,0,307)
    ScrollingFrame.ScrollBarThickness = 4
    
    UIListLayout.Parent = ScrollingFrame
    UIListLayout.Name = "UIListLayout"
    UIListLayout.Padding = UDim.new(0, 10)
    
    Toggle.Parent = Selector
    Toggle.Name = "Toggle"
    Toggle.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
    Toggle.Position = UDim2.new(0.9981058239936829,0,-0.001323772594332695,0)
    Toggle.Size = UDim2.new(0,34,0,22)
    Toggle.ZIndex = 2
    Toggle.Font = Enum.Font.GothamBold
    Toggle.Text = [[>]]
    Toggle.TextColor3 = Color3.new(1, 1, 1)
    Toggle.TextSize = 14
    
    UICorner_2.Parent = Toggle
    UICorner_2.Name = "UICorner"
    
    UIStroke_2.Parent = Toggle
    UIStroke_2.Name = "UIStroke"
    UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_2.Color = Color3.new(1, 0, 0.0156863)
    
    UICorner_3.Parent = Selector
    UICorner_3.Name = "UICorner"
    
    UIStroke_3.Parent = Selector
    UIStroke_3.Name = "UIStroke"
    UIStroke_3.Color = Color3.new(1, 0, 0.0156863)
    UIStroke_3.Thickness = 2
    
    Template.Parent = Frame
    Template.Name = "Template"
    
    Space.Parent = Template
    Space.Name = "Space"
    Space.BackgroundColor3 = Color3.new(1, 1, 1)
    Space.BackgroundTransparency = 1
    Space.Position = UDim2.new(0,0,0.42181816697120667,0)
    Space.Size = UDim2.new(0,106,0,53)
    Space.Visible = false
    
    TextBox.Parent = Template
    TextBox.Name = "TextBox"
    TextBox.BackgroundColor3 = Color3.new(0.290196, 0.290196, 0.290196)
    TextBox.Position = UDim2.new(0,0,0.09340659528970718,0)
    TextBox.Size = UDim2.new(0,599,0,48)
    TextBox.Visible = false
    TextBox.Font = Enum.Font.GothamMedium
    TextBox.Text = [[TextBox]]
    TextBox.TextColor3 = Color3.new(1, 1, 1)
    TextBox.TextSize = 18
    TextBox.TextXAlignment = Enum.TextXAlignment.Left
    
    UICorner_4.Parent = TextBox
    UICorner_4.Name = "UICorner"
    
    UIStroke_4.Parent = TextBox
    UIStroke_4.Name = "UIStroke"
    
    more_horiz.Parent = TextBox
    more_horiz.Name = "more_horiz"
    more_horiz.BackgroundTransparency = 1
    more_horiz.LayoutOrder = 9
    more_horiz.Position = UDim2.new(0.9340567588806152,0,0.2291666567325592,0)
    more_horiz.Rotation = 90
    more_horiz.Size = UDim2.new(0,25,0,25)
    more_horiz.ZIndex = 2
    more_horiz.Image = [[rbxassetid://3926305904]]
    more_horiz.ImageRectOffset = Vector2.new(4, 804)
    more_horiz.ImageRectSize = Vector2.new(36, 36)
    
    TextBox_1.Parent = TextBox
    TextBox_1.Name = "TextBox"
    TextBox_1.BackgroundColor3 = Color3.new(0.392157, 0.392157, 0.392157)
    TextBox_1.Position = UDim2.new(0.6076794862747192,0,0.2291666716337204,0)
    TextBox_1.Size = UDim2.new(0,173,0,25)
    TextBox_1.Font = Enum.Font.GothamMedium
    TextBox_1.PlaceholderText = [[Insert Text]]
    TextBox_1.Text = [[]]
    TextBox_1.TextColor3 = Color3.new(0, 0, 0)
    TextBox_1.TextScaled = true
    TextBox_1.TextSize = 14
    TextBox_1.TextWrapped = true
    
    UICorner_5.Parent = TextBox_1
    UICorner_5.Name = "UICorner"
    
    UIStroke_5.Parent = TextBox_1
    UIStroke_5.Name = "UIStroke"
    UIStroke_5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke_5.Thickness = 1.5
    
    Button.Parent = Template
    Button.Name = "Button"
    Button.BackgroundColor3 = Color3.new(0.290196, 0.290196, 0.290196)
    Button.BorderColor3 = Color3.new(0.105882, 0.164706, 0.207843)
    Button.Size = UDim2.new(0,599,0,48)
    Button.Visible = false
    Button.Font = Enum.Font.GothamMedium
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.TextSize = 18
    
    UICorner_6.Parent = Button
    UICorner_6.Name = "UICorner"
    
    UIStroke_6.Parent = Button
    UIStroke_6.Name = "UIStroke"
    
    more_horiz_1.Parent = Button
    more_horiz_1.Name = "more_horiz"
    more_horiz_1.BackgroundTransparency = 1
    more_horiz_1.LayoutOrder = 9
    more_horiz_1.Position = UDim2.new(0.9340567588806152,0,0.2291666567325592,0)
    more_horiz_1.Rotation = 90
    more_horiz_1.Size = UDim2.new(0,25,0,25)
    more_horiz_1.ZIndex = 2
    more_horiz_1.Image = [[rbxassetid://3926305904]]
    more_horiz_1.ImageRectOffset = Vector2.new(4, 804)
    more_horiz_1.ImageRectSize = Vector2.new(36, 36)
    
    Label.Parent = Template
    Label.Name = "Label"
    Label.BackgroundColor3 = Color3.new(0.290196, 0.290196, 0.290196)
    Label.Position = UDim2.new(0,0,0.3163636326789856,0)
    Label.Size = UDim2.new(0,599,0,50)
    Label.Visible = false
    Label.Font = Enum.Font.GothamMedium
    Label.TextColor3 = Color3.new(1, 1, 1)
    Label.TextSize = 19
    
    UICorner_7.Parent = Label
    UICorner_7.Name = "UICorner"
    
    UIStroke_7.Parent = Label
    UIStroke_7.Name = "UIStroke"
    
    Frame_1.Parent = Template
    Frame_1.Name = "Frame"
    Frame_1.Active = true
    Frame_1.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame_1.BackgroundTransparency = 1
    Frame_1.Position = UDim2.new(0,0,-0.007916796021163464,0)
    Frame_1.Size = UDim2.new(0,611,0,275)
    Frame_1.Visible = false
    Frame_1.ScrollBarThickness = 4
    
    UICorner_8.Parent = Frame_1
    UICorner_8.Name = "UICorner"
    
    UIListLayout_1.Parent = Frame_1
    UIListLayout_1.Name = "UIListLayout"
    UIListLayout_1.Padding = UDim.new(0, 10)
    
    SelectorButton.Parent = Template
    SelectorButton.Name = "SelectorButton"
    SelectorButton.BackgroundColor3 = Color3.new(1, 1, 1)
    SelectorButton.Position = UDim2.new(0.03479516878724098,0,0.06422531604766846,0)
    SelectorButton.Size = UDim2.new(0,30,0,31)
    SelectorButton.Image = [[rbxasset://textures/ui/GuiImagePlaceholder.png]]
    
    Button_1.Parent = SelectorButton
    Button_1.Name = "Button"
    Button_1.BackgroundColor3 = Color3.new(1, 1, 1)
    Button_1.BackgroundTransparency = 1
    Button_1.Position = UDim2.new(1.4666666984558105,0,0,0)
    Button_1.Size = UDim2.new(0,140,0,31)
    Button_1.Font = Enum.Font.GothamBold
    Button_1.Text = [[Name]]
    Button_1.TextColor3 = Color3.new(1, 1, 1)
    Button_1.TextSize = 14
    Button_1.TextXAlignment = Enum.TextXAlignment.Left

    local functions = {}


    function functions:AddPage(Name: string, image: string)
        local PageFunc = {}
        local Main = Frame_1:Clone()
        local Selector = SelectorButton:Clone()
        Main.Parent = Frames
        Main.Visible = false
        Selector.Parent = ScrollingFrame
        Selector.Button.Text = Name
        Selector.Image = image

        Selector.Button.MouseButton1Click:Connect(function()
            TextLabel.Text = Global.__ErrorUIName.." | "..Name
            for _,v in pairs(Frames:GetChildren()) do
                local boolvalue =  v == Main
                v.Visible = boolvalue
            end
        end)

        function PageFunc:Space()
            Space:Clone().Parent = Main
        end

        function PageFunc:Button(Name: string, Execute: any)
            local But = Button:Clone()
            But.Name = Name
            But.Text = Name
            But.MouseButton1Click:Connect(Execute)
        end

        function PageFunc:TextBox(Name: string, Execute: any, TextString: string)
            local TextFunc = {}
            local But = TextBox:Clone()
            But.Name = Name
            But.Text = Name
            But.TextBox.PlaceholderText = TextString or "Insert Text"
            But.MouseButton1Click:Connect(Execute)

            function TextFunc:String()
                return But.TextBox.Text or nil
            end

            return TextFunc
        end

        function PageFunc:Label(Text: string)
            local lab = Label:Clone()
            lab.Text = Text
            lab.Name = Text
        end

        return PageFunc
    end
    return functions
end

return module
