if getgenv().Setting then else
	if _G.KAITAN1CLICK then
		repeat wait() until game:IsLoaded()
		getgenv().Setting = {
			["Join Team"] = "Pirate", -- "Marine" / "Pirate"

			["Auto Farm Full"] = true,
			["Bring Devil Fruit"] = true,
			["Auto Rengoku"] = false,
			["Auto Kill Cake Prince"] = false,

			["Devil Fruit Sniper Name"] = "",
			["Devil Fruit Sniper"] = false,
			["Auto Awaken"] = true,
			["Auto Yama"] = true,
			["Secret"] = true,
			["Redeem All Code"] = true,
		}
	else
		getgenv().Setting = {
			["Join Team"] = "Pirate", -- "Marine" / "Pirate"
		
			["Auto Farm Full"] = false,
			["Bring Devil Fruit"] = false,
			["Auto Rengoku"] = false,
			["Auto Kill Cake Prince"] = false,
	
			["Devil Fruit Sniper Name"] = "",
			["Devil Fruit Sniper"] = false,
			["Auto Awaken"] = false,
			["Auto Yama"] = false,
            ["Fast Attack"] = false,
			["Secret"] = false,
			["Redeem All Code"] = false,
		}
	end
end

if not game:IsLoaded() then game.Loaded:Wait() end
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");

do  local ui =  game:GetService("CoreGui").RobloxGui:FindFirstChild("ZRIXHUB")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local ZRIXHUB = Instance.new("ScreenGui")
ZRIXHUB.Name = "ZRIXHUB"
ZRIXHUB.Parent = game:GetService("CoreGui").RobloxGui
ZRIXHUB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function MakeDraggable(topbarobject, object)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
        local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topbarobject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = object.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end
                )
            end
        end
    )

    topbarobject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end
    )
end

local Create = {}
    function Create:window()
        local FocusUI = false ; -- tap
        local Main = Instance.new("Frame")
        Main.Name = "Main"
        Main.Parent = ZRIXHUB
        Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        Main.Position = UDim2.new(0.330043167, 0, 0.254589975, 0)
        Main.Size = UDim2.new(0, 550, 0, 400)
        Main.ClipsDescendants = true

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 8)
        UICorner.Parent = Main

        local PageTab = Instance.new("Frame")
        PageTab.Name = "PageTab"
        PageTab.Parent = Main
        PageTab.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        PageTab.BorderSizePixel = 0
        PageTab.Position = UDim2.new(-0.000865922426, 0, 0, 0)
        PageTab.Size = UDim2.new(0, 150, 0, 400)

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 8)
        UICorner.Parent = PageTab

        local Logo = Instance.new("ImageLabel")
        Logo.Name = "Logo"
        Logo.Parent = PageTab
        Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Logo.BackgroundTransparency = 1.000
        Logo.Position = UDim2.new(0.133333325, 0, -0.000689207751, 0)
        Logo.Size = UDim2.new(0, 110, 0, 110)
        Logo.Image = "http://www.roblox.com/asset/?id=10180536577"

        local PageFrame = Instance.new("Frame")
        PageFrame.Name = "PageFrame"
        PageFrame.Parent = PageTab
        PageFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        PageFrame.BorderSizePixel = 0
        PageFrame.Position = UDim2.new(0.866666675, 0, 0, 0)
        PageFrame.Size = UDim2.new(0, 20, 0, 398)

        local Scrolling_PageTab = Instance.new("ScrollingFrame")
        Scrolling_PageTab.Parent = PageTab
        Scrolling_PageTab.Active = true
        Scrolling_PageTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Scrolling_PageTab.BackgroundTransparency = 1.000
        Scrolling_PageTab.BorderSizePixel = 0
        Scrolling_PageTab.Position = UDim2.new(0, 0, 0.280701756, 0)
        Scrolling_PageTab.Size = UDim2.new(0, 150, 0, 287)
        Scrolling_PageTab.CanvasSize = UDim2.new(0, 0, 1, 50)
        Scrolling_PageTab.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Scrolling_PageTab.ScrollBarThickness = 4
        Scrolling_PageTab.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Scrolling_PageTab
        UIListLayout.FillDirection = Enum.FillDirection.Vertical
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)

        UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            Scrolling_PageTab.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 5)
        end)

        local PageOrders = -1

        local Container_Page = Instance.new("Frame",Main)
        Container_Page.Name = ""
        Container_Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Container_Page.Size = UDim2.new(0, 400, 0, 400)
        Container_Page.BackgroundTransparency = 1
        Container_Page.Position = UDim2.new(0.5, 0, 0.5, 0)
        Container_Page.AnchorPoint = Vector2.new(0.315, 0.5)

        local PageFolder = Instance.new("Folder")
        PageFolder.Parent = Container_Page

        local UIPage = Instance.new('UIPageLayout',PageFolder)
        UIPage.FillDirection = Enum.FillDirection.Vertical
        UIPage.SortOrder = Enum.SortOrder.LayoutOrder
        UIPage.EasingDirection = Enum.EasingDirection.InOut
        UIPage.EasingStyle = Enum.EasingStyle.Quad
        UIPage.Padding = UDim.new(2, 0)
        UIPage.TweenTime = 0.350

        MakeDraggable(PageTab,Main)
        local tween = game:GetService("TweenService")
        local library = {currenttab = '',toggledui = false}
        tween:Create(Main,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 400)}):Play()
    
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.RightControl then 
                if library.toggledui == false then
                    library.toggledui = true  
                    tween:Create(Main,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size = UDim2.new(0, 550, 0, 0)}):Play()
                    wait(0.1) Main.Visible = false
                else 
                    library.toggledui = false
                    Main.Visible = true
                    tween:Create(Main,TweenInfo.new(0.5,Enum.EasingStyle.Back),{Size = UDim2.new(0, 550, 0, 400)}):Play()
                end 
            end
        end)

local Tab = {}
    function Tab:CreateTab(text)
        PageOrders = PageOrders + 1
        local name = tostring(text) or tostring(math.random(1,5000))
        
        local TextButton_Tab = Instance.new("TextButton")
        TextButton_Tab.Name = text.."Server"
        TextButton_Tab.Parent = Scrolling_PageTab
        TextButton_Tab.BackgroundColor3 = Color3.fromRGB(10,10,10)
        TextButton_Tab.BackgroundTransparency = 1
        TextButton_Tab.BorderSizePixel = 0
        TextButton_Tab.Position = UDim2.new(0.5, 0, 0, 0)
        TextButton_Tab.Size = UDim2.new(0, 150, 0, 35)
        TextButton_Tab.Font = Enum.Font.GothamMedium
        TextButton_Tab.Text = ""
        TextButton_Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Tab.TextSize = 14.000
        TextButton_Tab.TextXAlignment = Enum.TextXAlignment.Left
        TextButton_Tab.ZIndex = 2

        local TextButton_Line = Instance.new("Frame")
        TextButton_Line.Parent = TextButton_Tab
        TextButton_Line.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        TextButton_Line.BackgroundTransparency = 1
        TextButton_Line.Size = UDim2.new(0, 2, 0, 35)

        local TextButton_Tab1 = Instance.new("TextButton")
        TextButton_Tab1.Parent = TextButton_Tab
        TextButton_Tab1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Tab1.BackgroundTransparency = 1
        TextButton_Tab1.BorderSizePixel = 0
        TextButton_Tab1.AnchorPoint = Vector2.new(0.5,0.5)
        TextButton_Tab1.Position = UDim2.new(0.55, 0, 0.5, 0)
        TextButton_Tab1.Size = UDim2.new(0, 150, 0, 35)
        TextButton_Tab1.Font = Enum.Font.GothamMedium
        TextButton_Tab1.Text = tostring(text)
        TextButton_Tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_Tab1.TextSize = 14.000
        TextButton_Tab1.TextXAlignment = Enum.TextXAlignment.Left
        TextButton_Tab1.ZIndex = 2

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Scrolling_PageTab
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)

        local UIPadding = Instance.new("UIPadding")
        UIPadding.Parent = Scrolling_PageTab

        local PageMain = Instance.new("Frame")
        PageMain.Name = name.."_PageMain"
        PageMain.Parent = PageFolder
        PageMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageMain.BackgroundTransparency = 1.000
        PageMain.BorderSizePixel = 0
        PageMain.Position = UDim2.new(0.271861345, 0, 0, 0)
        PageMain.Size = UDim2.new(0, 400, 0, 400)
        PageMain.Visible = true
        PageMain.LayoutOrder = PageOrders

        local Scrolling_PageMain = Instance.new("ScrollingFrame")
        Scrolling_PageMain.Parent = PageMain
        Scrolling_PageMain.Active = true
        Scrolling_PageMain.AnchorPoint = Vector2.new(0.5, 0.5)
        Scrolling_PageMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Scrolling_PageMain.BackgroundTransparency = 1.000
        Scrolling_PageMain.BorderSizePixel = 0
        Scrolling_PageMain.Position = UDim2.new(0.513095379, 0, 0.5, 0)
        Scrolling_PageMain.Size = UDim2.new(0, 390, 0, 380)
        Scrolling_PageMain.CanvasSize = UDim2.new(0, 0, 0, 0)
        Scrolling_PageMain.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
        Scrolling_PageMain.ScrollBarThickness = 4
        Scrolling_PageMain.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Scrolling_PageMain
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)

        UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
            Scrolling_PageMain.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)
        end)

        local UIPadding_2 = Instance.new("UIPadding")
        UIPadding_2.Parent = Scrolling_PageMain

        TextButton_Tab1.MouseButton1Click:connect(function()
            if PageMain.Name == text.."_PageMain" then
                UIPage:JumpToIndex(PageMain.LayoutOrder)
            end

            for i ,v in next , Scrolling_PageTab:GetChildren() do
                if v:IsA("TextButton") then
                    for o,p in pairs(v:GetChildren()) do
                        for x,d in pairs(v:GetChildren()) do
                        TweenService:Create(
                            v,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency =  1}
                        ):Play()
                        TweenService:Create(
                            p,
                            TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {BackgroundTransparency =  1}
                        ):Play()
                        end
                    end
                end
                TweenService:Create(
                    TextButton_Tab,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency =  0}
                ):Play()
                TweenService:Create(
                    TextButton_Line,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundTransparency =  0}
                ):Play()
            end
        end)
        if FocusUI == false then
            TweenService:Create(
                TextButton_Tab,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency =  0}
            ):Play()
            TweenService:Create(
                TextButton_Line,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundTransparency =  0}
            ):Play()

            PageMain.Visible = true
            TextButton_Tab.Name = text .. "Server"
            FocusUI  = true
        end

        TextButton_Tab.MouseEnter:Connect(function()
            TweenService:Create(
                TextButton_Tab1,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 0, 0)}
            ):Play()
        end)
        TextButton_Tab.MouseLeave:Connect(function()
            TweenService:Create(
                TextButton_Tab1,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255,255,255)}
            ):Play()
        end)

local Page = {}
    function Page:CreatePage(text)
        local Page = Instance.new("Frame")
        Page.Name = "Page"
        Page.Parent = Scrolling_PageMain
        Page.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Page.BorderSizePixel = 0
        Page.Position = UDim2.new(0, 0, 0.0215189867, 0)
        Page.Size = UDim2.new(0, 380, 0, 380)
        Page.ZIndex = true
        
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Parent = Page
        TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderSizePixel = 0
        TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabel.Size = UDim2.new(0, 359, 0, 35)
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.Text = tostring(text)
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 14.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Page

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Page
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 10)

        local UIPaddingPage = Instance.new("UIPadding")
        UIPaddingPage.Parent = Page
        UIPaddingPage.PaddingLeft = UDim.new(0, 10)
        UIPaddingPage.PaddingTop = UDim.new(0, 0)

        TextLabel.MouseEnter:Connect(function()
            TweenService:Create(
                TextLabel,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255, 0, 0)}
            ):Play()
        end)
        TextLabel.MouseLeave:Connect(function()
            TweenService:Create(
                TextLabel,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255,255,255)}
            ):Play()
        end)

        UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.Size =  UDim2.new(0, 380, 0,UIListLayout.AbsoluteContentSize.Y + 12)
        end);


local Items = {}
    function Items:Label(text)
        local Labelfuc = {}
        local Label_Main = Instance.new("TextLabel")
        Label_Main.Parent = Page
        Label_Main.BackgroundColor3 = Color3.fromRGB(10,10,10)
        Label_Main.BackgroundTransparency = 1
        Label_Main.BorderSizePixel = 0
        Label_Main.AnchorPoint = Vector2.new(0.5,0.5)
        Label_Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Label_Main.Size = UDim2.new(0, 360, 0, 25)
        Label_Main.Font = Enum.Font.GothamMedium
        Label_Main.TextColor3 = Color3.fromRGB(255,255,255)
        Label_Main.Text = tostring(text)
        Label_Main.TextSize = 14.000
    
        local Line1 = Instance.new("Frame")
        Line1.Name = "Page"
        Line1.Parent = Label_Main
        Line1.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Line1.BorderSizePixel = 0
        Line1.AnchorPoint = Vector2.new(0.5,0.5)
        Line1.Position = UDim2.new(0.825, 0, 0.5, 0)
        Line1.Size = UDim2.new(0, 110, 0, 2)

        local Line2 = Instance.new("Frame")
        Line2.Name = "Page"
        Line2.Parent = Label_Main
        Line2.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Line2.BorderSizePixel = 0
        Line2.AnchorPoint = Vector2.new(0.5,0.5)
        Line2.Position = UDim2.new(0.175, 0, 0.5, 0)
        Line2.Size = UDim2.new(0, 110, 0, 2)

        function  Labelfuc:Change(text)
            Label_Main.Text = tostring(text)
        end
            return Labelfuc
        end

    function Items:Button(text,callback)
        local Button_Frame = Instance.new("Frame")
        Button_Frame.Parent = Page
        Button_Frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
        Button_Frame.BackgroundTransparency = 1
        Button_Frame.BorderSizePixel = 0
        Button_Frame.AnchorPoint = Vector2.new(0.5,0.5)
        Button_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Button_Frame.Size = UDim2.new(0, 360, 0, 25)

        local Button_Main = Instance.new("TextButton")
        Button_Main.Parent = Button_Frame
        Button_Main.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Button_Main.BackgroundTransparency = 0
        Button_Main.BorderSizePixel = 0
        Button_Main.AnchorPoint = Vector2.new(0.5,0.5)
        Button_Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Button_Main.Size = UDim2.new(0, 320, 0, 25)
        Button_Main.Font = Enum.Font.GothamMedium
        Button_Main.TextColor3 = Color3.fromRGB(255,255,255)
        Button_Main.Text = tostring(text)
        Button_Main.TextSize = 14.000

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Name = ""
        UICorner.Parent = Button_Main

        Button_Main.MouseButton1Click:Connect(function()
            TweenService:Create(
                Button_Main,
                TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 300, 0, 25)}
            ):Play() wait(0.1)
            TweenService:Create(
                Button_Main,
                TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                {Size = UDim2.new(0, 320, 0, 25)}
            ):Play()
            TweenService:Create(
                Button_Main,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {TextSize = 10}
            ):Play() wait(0.1)
            TweenService:Create(
                Button_Main,
                TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                {TextSize = 14}
            ):Play()
            callback()
        end)
        end

    function Items:Toggle(text,Stats,callback)
        local Toggle_Main = Instance.new("Frame")
        Toggle_Main.Parent = Page
        Toggle_Main.BackgroundColor3 = Color3.fromRGB(22,22,22)
        Toggle_Main.BorderSizePixel = 0
        Toggle_Main.AnchorPoint = Vector2.new(0.5,0.5)
        Toggle_Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Toggle_Main.Size = UDim2.new(0, 360, 0, 35)

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Name = ""
        UICorner.Parent = Toggle_Main

        local TextButton_Toggle = Instance.new("TextButton")
        TextButton_Toggle.Parent = Toggle_Main
        TextButton_Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        TextButton_Toggle.BackgroundTransparency = 1
        TextButton_Toggle.BorderSizePixel = 0
        TextButton_Toggle.AnchorPoint = Vector2.new(0.5,0.5)
        TextButton_Toggle.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextButton_Toggle.Size = UDim2.new(0,340, 0, 35)
        TextButton_Toggle.Font = Enum.Font.GothamMedium
        TextButton_Toggle.TextColor3 = Color3.fromRGB(100,100,100)
        TextButton_Toggle.Text = tostring(text)
        TextButton_Toggle.TextSize = 14.000
        TextButton_Toggle.TextXAlignment = Enum.TextXAlignment.Left

        local Toggle1 = Instance.new("Frame")
        Toggle1.Parent = Toggle_Main
        Toggle1.BackgroundColor3 = Color3.fromRGB(15,15,15)
        Toggle1.AnchorPoint = Vector2.new(0.5,0.5)
        Toggle1.Position = UDim2.new(0.925, 0, 0.5, 0)
        Toggle1.Size = UDim2.new(0, 18, 0, 18)

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Name = ""
        UICorner.Parent = Toggle1

        local Togglevalue = false

        TextButton_Toggle.MouseButton1Down:Connect(function()
            if Togglevalue == false then ------- true
                TweenService:Create(
                    TextButton_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,255,255)}
                ):Play()
                TweenService:Create(
                    Toggle1,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}
                ):Play()
            elseif Togglevalue == true then
                TweenService:Create(
                    TextButton_Toggle,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(100,100,100)}
                ):Play()
                TweenService:Create(
                    Toggle1,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(15,15,15)}
                ):Play()
            end
            Togglevalue = not Togglevalue
            pcall(callback,Togglevalue)
        end)

        if Stats == true then
            TweenService:Create(
                TextButton_Toggle,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255,255,255)}
            ):Play()
            TweenService:Create(
                Toggle1,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(10,140,255)}
            ):Play()
            Togglevalue = not Togglevalue
            pcall(callback,Togglevalue)
        end

        TextButton_Toggle.MouseEnter:Connect(function()
            if Togglevalue == false then
            TweenService:Create(
                Toggle1,
                TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}
            ):Play()
            end
        end)
        TextButton_Toggle.MouseLeave:Connect(function()
            if Togglevalue == false then
                TweenService:Create(
                    Toggle1,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(10,10,10)}
                ):Play()
            end
        end)

            return  Togglevalue
        end

    function Items:Dropdown(text,option,default,callback)
        local defaultt = default or ""
        local Drop_Frame = Instance.new("Frame")
        Drop_Frame.Name = "DropFrame"
        Drop_Frame.Parent = Page
        Drop_Frame.BackgroundColor3 = Color3.fromRGB(22,22,22)
        Drop_Frame.BackgroundTransparency = 0
        Drop_Frame.BorderSizePixel = 0
        Drop_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Drop_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Drop_Frame.Size = UDim2.new(0, 360, 0, 35)
        Drop_Frame.ClipsDescendants = true

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Name = ""
        UICorner.Parent = Drop_Frame

        local TextLabe_DropDown = Instance.new("TextLabel")
        TextLabe_DropDown.Name = "LabelFrameDrop"
        TextLabe_DropDown.Parent = Drop_Frame
        TextLabe_DropDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabe_DropDown.BackgroundTransparency = 1
        TextLabe_DropDown.Position = UDim2.new(0.035, 0, 0.025, 0)
        TextLabe_DropDown.Size = UDim2.new(0, 350, 0, 35)
        TextLabe_DropDown.Font = Enum.Font.GothamMedium
        TextLabe_DropDown.TextColor3 = Color3.fromRGB(100,100,100)
        TextLabe_DropDown.TextSize = 14
        TextLabe_DropDown.TextWrapped = true
        TextLabe_DropDown.TextXAlignment = Enum.TextXAlignment.Left
        TextLabe_DropDown.Text = tostring(text).." :"

        function getpro()
            if default then
                if table.find(option, default) then
                    pcall(callback, default)
                    return tostring(text).." : " .. default
                else
                    return text
                end
            else
                return text
            end
        end
        TextLabe_DropDown.Text = getpro()
        local Icon = Instance.new("ImageLabel")
        Icon.Name = "Icon"
        Icon.Parent = TextLabe_DropDown
        Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon.BackgroundTransparency = 1.000
        Icon.AnchorPoint = Vector2.new(0.5,0.5)
        Icon.Position = UDim2.new(0.925, 0, 0.5, 0)
        Icon.Rotation = 0
        Icon.Size = UDim2.new(0, 12, 0, 12)
        Icon.Image = "http://www.roblox.com/asset/?id=10815258127"
        Icon.ImageColor3 = Color3.fromRGB(100,100,100)
        local Scrolling_Drop = Instance.new("ScrollingFrame")
        Scrolling_Drop.Name = "Scrolling_Drop"
        Scrolling_Drop.Parent = TextLabe_DropDown
        Scrolling_Drop.Active = true
        Scrolling_Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Scrolling_Drop.BackgroundTransparency = 1
        Scrolling_Drop.BorderSizePixel = 0
        Scrolling_Drop.AnchorPoint = Vector2.new(0.5,0.5)
        Scrolling_Drop.Position = UDim2.new(0.5, 0, 2.7, 0)
        Scrolling_Drop.Size = UDim2.new(0, 360, 0, 120) --UDim2.new(0, 270, 0, 155)
        Scrolling_Drop.CanvasSize = UDim2.new(0, 0, 0, 2)
        Scrolling_Drop.ScrollBarThickness = 1
        Scrolling_Drop.ScrollBarImageTransparency = 1
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Name = "UIListLayout"
        UIListLayout.Parent = Scrolling_Drop
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 6)
        local UIPaddinglist = Instance.new("UIPadding")
        UIPaddinglist.Name = "UIPaddinglist"
        UIPaddinglist.Parent = Scrolling_Drop
        UIPaddinglist.PaddingTop = UDim.new(0, 5)
        local Button_Drop = Instance.new("TextButton")
        Button_Drop.Name = "ButtonDrop"
        Button_Drop.Parent = Drop_Frame
        Button_Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button_Drop.BackgroundTransparency = 1
        Button_Drop.ClipsDescendants = true
        Button_Drop.Size = UDim2.new(0, 360, 0, 35)
        Button_Drop.Font = Enum.Font.SourceSans
        Button_Drop.Text = ""
        Button_Drop.TextColor3 = Color3.fromRGB(0, 0, 0)
        Button_Drop.TextSize = 14.000
        local dog = false
        local droptween = true
        local FrameSize = 160
        local cout = 0
        for i , v in pairs(option) do
            cout =cout + 1
            if cout == 1 then
                FrameSize = 160
            elseif cout == 2 then
                FrameSize = 160
            elseif cout >= 3 then
                FrameSize = 160
            end
            local Button_Frame = Instance.new("Frame")
            Button_Frame.Name = "ListFrame"
            Button_Frame.Parent = Scrolling_Drop
            Button_Frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
            Button_Frame.BackgroundTransparency = 1
            Button_Frame.BorderSizePixel = 0
            Button_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
            Button_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
            Button_Frame.Size = UDim2.new(0, 360, 0, 30)

            local Dropdown_Button = Instance.new("TextButton")
            Dropdown_Button.Name = "Dropdwon_Button"
            Dropdown_Button.Parent = Button_Frame
            Dropdown_Button.AnchorPoint = Vector2.new(0.5, 0.5)
            Dropdown_Button.BackgroundColor3 = Color3.fromRGB(15,15,15)
            Dropdown_Button.BackgroundTransparency = 0
            Dropdown_Button.BorderSizePixel = 0
            Dropdown_Button.Position = UDim2.new(0.475, 0, 0.5, 0)
            Dropdown_Button.Size = UDim2.new(0, 330, 0, 30)
            Dropdown_Button.Font = Enum.Font.GothamSemibold
            Dropdown_Button.TextColor3 = Color3.fromRGB(136, 136, 138)
            Dropdown_Button.TextSize = 14
            Dropdown_Button.TextXAlignment = Enum.TextXAlignment.Left
            Dropdown_Button.Text = ""

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Name = ""
            UICorner.Parent = Dropdown_Button

            local TextLabel_Button = Instance.new("TextLabel")
            TextLabel_Button.Name = "TextLabel_TapDro2p"
            TextLabel_Button.Parent = Dropdown_Button
            TextLabel_Button.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_Button.BackgroundTransparency = 1
            TextLabel_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextLabel_Button.Size = UDim2.new(0, 330, 0, 30)
            TextLabel_Button.Font = Enum.Font.GothamSemibold
            TextLabel_Button.TextColor3 = Color3.fromRGB(100,100,100)
            TextLabel_Button.TextSize = 14
            TextLabel_Button.TextXAlignment = Enum.TextXAlignment.Center
            TextLabel_Button.Text = tostring(v)

            Dropdown_Button.MouseButton1Click:Connect(function()
                TweenService:Create(
                    TextLabe_DropDown,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,255,255)}
                ):Play()
                TweenService:Create(
                    Icon,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(255,255,255)}
                ):Play()
                TweenService:Create(
                    Drop_Frame,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 360, 0, 35)}
                ):Play()
                TweenService:Create(
                    Icon,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                TextLabe_DropDown.Text =  text.." : "..tostring(v)
                callback(v)
                dog = not dog
                droptween = false
            end)
            Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20 )
        end
        Button_Drop.MouseButton1Click:Connect(function()
            if dog == false then
                TweenService:Create(
                    Drop_Frame,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 360, 0, FrameSize)}
                ):Play()
                TweenService:Create(
                    Icon,
                    TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 90}
                ):Play()
                Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20  )
            else
                TweenService:Create(
                    Drop_Frame,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 360, 0, 35)}
                ):Play()
                TweenService:Create(
                    Icon,
                    TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20  )
            end
            dog = not dog
        end)
        Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20  )
        local dropfunc = {}

        function dropfunc:Clear()
            TextLabe_DropDown.Text = tostring(text).." :"
            TweenService:Create(
                TextLabe_DropDown,
                TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(100,100,100)}
            ):Play()
            TweenService:Create(
                Icon,
                TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {ImageColor3 = Color3.fromRGB(100,100,100)}
            ):Play()
            TweenService:Create(
                Drop_Frame,
                TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 360, 0, 35)}
            ):Play()
            TweenService:Create(
                Icon,
                TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {Rotation = 0}
            ):Play()
            dog = not dog
            droptween = true
            for i, v in next, Scrolling_Drop:GetChildren() do
                if v:IsA("Frame") then
                    v:Destroy()
                end
            end
        end
        function dropfunc:Add(t)
            local Button_Frame = Instance.new("Frame")
            Button_Frame.Name = "ListFrame"
            Button_Frame.Parent = Scrolling_Drop
            Button_Frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
            Button_Frame.BackgroundTransparency = 1
            Button_Frame.BorderSizePixel = 0
            Button_Frame.AnchorPoint = Vector2.new(0.5, 0.5)
            Button_Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
            Button_Frame.Size = UDim2.new(0, 360, 0, 30)

            local Dropdown_Button = Instance.new("TextButton")
            Dropdown_Button.Name = "Dropdwon_Button"
            Dropdown_Button.Parent = Button_Frame
            Dropdown_Button.AnchorPoint = Vector2.new(0.5, 0.5)
            Dropdown_Button.BackgroundColor3 = Color3.fromRGB(15,15,15)
            Dropdown_Button.BackgroundTransparency = 0
            Dropdown_Button.BorderSizePixel = 0
            Dropdown_Button.Position = UDim2.new(0.475, 0, 0.5, 0)
            Dropdown_Button.Size = UDim2.new(0, 330, 0, 30)
            Dropdown_Button.Font = Enum.Font.GothamSemibold
            Dropdown_Button.TextColor3 = Color3.fromRGB(136, 136, 138)
            Dropdown_Button.TextSize = 14
            Dropdown_Button.TextXAlignment = Enum.TextXAlignment.Left
            Dropdown_Button.Text = ""

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 5)
            UICorner.Name = ""
            UICorner.Parent = Dropdown_Button

            local TextLabel_Button = Instance.new("TextLabel")
            TextLabel_Button.Name = "TextLabel_TapDro2p"
            TextLabel_Button.Parent = Dropdown_Button
            TextLabel_Button.AnchorPoint = Vector2.new(0.5, 0.5)
            TextLabel_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_Button.BackgroundTransparency = 1
            TextLabel_Button.Position = UDim2.new(0.5, 0, 0.5, 0)
            TextLabel_Button.Size = UDim2.new(0, 330, 0, 30)
            TextLabel_Button.Font = Enum.Font.GothamSemibold
            TextLabel_Button.TextColor3 = Color3.fromRGB(100,100,100)
            TextLabel_Button.TextSize = 14
            TextLabel_Button.TextXAlignment = Enum.TextXAlignment.Center
            TextLabel_Button.Text = tostring(t)

            Dropdown_Button.MouseButton1Click:Connect(function()
                TweenService:Create(
                    TextLabe_DropDown,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,255,255)}
                ):Play()
                TweenService:Create(
                    Icon,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(255,255,255)}
                ):Play()
                TweenService:Create(
                    Drop_Frame,
                    TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 360, 0, 35)}
                ):Play()
                TweenService:Create(
                    Icon,
                    TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Rotation = 0}
                ):Play()
                TextLabe_DropDown.Text =  text.." : "..tostring(t)
                callback(t)
                dog = not dog
                droptween = false
            end)
            Scrolling_Drop.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 20)
        end
        return dropfunc
        end

    function Items:Slider(text,floor,min,max,de,lol,callback)
        local sliderfunc = {}
        local SliderFrame = Instance.new("Frame")
        SliderFrame.Name = "SliderFrame"
        SliderFrame.Parent = Page
        SliderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        SliderFrame.BackgroundColor3 = Color3.fromRGB(22,22,22)
        SliderFrame.BackgroundTransparency = 0
        SliderFrame.ClipsDescendants = true
        SliderFrame.Position = UDim2.new(0.5, 0, 0.457317084, 0)
        SliderFrame.Size = UDim2.new(0, 360, 0, 45)

        local SliderFrame_UICorner = Instance.new("UICorner")
        SliderFrame_UICorner.Name = "SliderFrame_UICorner"
        SliderFrame_UICorner.Parent = SliderFrame
        SliderFrame_UICorner.CornerRadius = UDim.new(0, 5)

        local LabelNameSlider = Instance.new("TextLabel")
        LabelNameSlider.Name = "LabelNameSlider"
        LabelNameSlider.Parent = SliderFrame
        LabelNameSlider.AnchorPoint = Vector2.new(0.5, 0.5)
        LabelNameSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelNameSlider.BackgroundTransparency = 1
        LabelNameSlider.BorderSizePixel = 0
        LabelNameSlider.Position = UDim2.new(0.5, 0, 0.35, 0)
        LabelNameSlider.Size = UDim2.new(0, 340, 0, 20)
        LabelNameSlider.Font = Enum.Font.GothamMedium
        LabelNameSlider.TextColor3 = Color3.fromRGB(100,100,100)
        LabelNameSlider.Text = tostring(text)
        LabelNameSlider.TextSize = 14
        LabelNameSlider.TextWrapped = true
        LabelNameSlider.TextXAlignment = Enum.TextXAlignment.Left

        local ShowValueFrame = Instance.new("Frame")
        ShowValueFrame.Name = "ShowValueFrame"
        ShowValueFrame.Parent = SliderFrame
        ShowValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ShowValueFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
        ShowValueFrame.BorderSizePixel = 0
        ShowValueFrame.Position = UDim2.new(0.9, 0, 0.35, 0)
        ShowValueFrame.Size = UDim2.new(0, 50, 0, 18)

        local ShowValueFrameUICorner = Instance.new("UICorner")
        ShowValueFrameUICorner.CornerRadius = UDim.new(0, 4)
        ShowValueFrameUICorner.Name = "ShowValueFrameUICorner"
        ShowValueFrameUICorner.Parent = ShowValueFrame

        local CustomValue = Instance.new("TextBox")
        CustomValue.Name = "CustomValue"
        CustomValue.Parent = ShowValueFrame
        CustomValue.AnchorPoint = Vector2.new(0.5, 0.5)
        CustomValue.BackgroundColor3 = Color3.fromRGB(10,10,10)
        CustomValue.BackgroundTransparency = 1
        CustomValue.ClipsDescendants = true
        CustomValue.Position = UDim2.new(0.5, 0, 0.5, 0)
        CustomValue.Size = UDim2.new(0, 50, 0, 18)
        CustomValue.Font = Enum.Font.GothamMedium
        CustomValue.PlaceholderColor3 = Color3.fromRGB(222, 222, 222)
        CustomValue.Text = ""
        CustomValue.TextSize = 12
        CustomValue.TextColor3 = Color3.fromRGB(100,100,100)

        if floor == true then
            CustomValue.Text =  tostring(de and string.format((de / max) * (max - min) + min) or 0)
        else
            CustomValue.Text =  tostring(de and math.floor((de / max) * (max - min) + min) or 0)
        end

        local ValueFrame = Instance.new("Frame")
        ValueFrame.Name = "ValueFrame"
        ValueFrame.Parent = SliderFrame
        ValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        ValueFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
        ValueFrame.BorderSizePixel = 0
        ValueFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
        ValueFrame.Size = UDim2.new(0, 340, 0, 5)

        local Main_UiStroke = Instance.new("UIStroke")
        Main_UiStroke.Thickness = 1
        Main_UiStroke.Name = ""
        Main_UiStroke.Parent = ValueFrame
        Main_UiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        Main_UiStroke.LineJoinMode = Enum.LineJoinMode.Round
        Main_UiStroke.Color = Color3.fromRGB(15,15,15)
        Main_UiStroke.Transparency = 0

        local ValueFrameUICorner = Instance.new("UICorner")
        ValueFrameUICorner.CornerRadius = UDim.new(0, 10)
        ValueFrameUICorner.Name = "ShowValueFrameUICorner"
        ValueFrameUICorner.Parent = ValueFrame

        local PartValue = Instance.new("Frame")
        PartValue.Name = "PartValue"
        PartValue.Parent = ValueFrame
        PartValue.Active = true
        PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
        PartValue.BackgroundColor3 = Color3.fromRGB(10,10,10)
        PartValue.BackgroundTransparency = 1.000
        PartValue.Position = UDim2.new(0.498982757, 0, 0.300000012, 0)
        PartValue.Size = UDim2.new(0, 340, 0, 5)

        local MainValue = Instance.new("Frame")
        MainValue.Name = "MainValue"
        MainValue.Parent = PartValue
        MainValue.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        MainValue.Position = UDim2.new(0.00101725257, 0, 0.200000003, 0)
        MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 5)
        MainValue.BorderSizePixel = 0

        local MainValueUICorner = Instance.new("UICorner")
        MainValueUICorner.CornerRadius = UDim.new(0, 10)
        MainValueUICorner.Name = "a"
        MainValueUICorner.Parent = MainValue

        local ConneValue = Instance.new("Frame")
        ConneValue.Name = "ConneValue"
        ConneValue.Parent = PartValue
        ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
        ConneValue.BackgroundColor3 = Color3.fromRGB(10,10,10)
        ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.6,0, 0)
        ConneValue.Size = UDim2.new(0, 0, 0, 0)
        ConneValue.BorderSizePixel = 0

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 300)
        UICorner.Parent = ConneValue

        local function move(input)
            local pos =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0.6,
                    0
                )
            local pos1 =
                UDim2.new(
                    math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
                    0,
                    0,
                    5
                )
            MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)
            ConneValue:TweenPosition(pos, "Out", "Sine", 0.2, true)
            if floor == true then
                local value = string.format("%.0f",((pos.X.Scale * max) / max) * (max - min) + min)
                CustomValue.Text = tostring(value)
                callback(value)
            else
                local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                CustomValue.Text = tostring(value)
                callback(value)
            end
        end
        local dragging = false
        ConneValue.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
        ConneValue.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
        SliderFrame.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
        SliderFrame.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
        ValueFrame.InputBegan:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                end
            end)
        ValueFrame.InputEnded:Connect(
            function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                move(input)
            end
        end)
        CustomValue.FocusLost:Connect(function()
            if CustomValue.Text == "" then
                CustomValue.Text  = de
            end
            if  tonumber(CustomValue.Text) > max then
                CustomValue.Text  = max
            end
            MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
            ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.6, 0) , "Out", "Sine", 0.2, true)
            if floor == true then
                CustomValue.Text = tostring(CustomValue.Text and string.format("%.0f",(CustomValue.Text / max) * (max - min) + min) )
            else
                CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
            end
            pcall(callback, CustomValue.Text)
        end)

        function sliderfunc:Update(value)
            MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 5), "Out", "Sine", 0.2, true)
            CustomValue.Text = value
            pcall(function()
                callback(value)
            end)
        end
            return sliderfunc
        end
----------------
    return Items
end
    return Page
end
    return Tab
end


-- Load Function 
local ServerHop = loadstring(game:HttpGet('https://raw.githubusercontent.com/NoNiName/Library/main/Serverhop.lua'))()
local CodeLibrary = loadstring(game:HttpGet('https://pastebin.com/raw/CcGsHUpT'))()
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
local getInventoryFruit = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")
local getInventoryWeapon = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")

if getgenv().Setting["Redeem All Code"] == true then
	function UseCode(Text)
		game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
	end
	for i,v in pairs(CodeLibrary) do
		UseCode(v) 
	end
end

-- Quest
local placeId = game.PlaceId
if placeId == 2753915549 then
    OldWorld = true
elseif placeId == 4442272183 then
    NewWorld = true
elseif placeId == 7449423635 then
    ThreeWorld = true
end

function CheckQuest()
	local MyLevel = game.Players.LocalPlayer.Data.Level.Value
	if OldWorld then
		if MyLevel == 1 or MyLevel <= 9 then -- Bandit
			Ms = "Bandit [Lv. 5]"
			NameQuest = "BanditQuest1"
			LevelQuest = 1
			NameMon = "Bandit"
			CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
			CFrameMon = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
		elseif MyLevel == 10 or MyLevel <= 14 then -- Monkey
			Ms = "Monkey [Lv. 14]"
			NameQuest = "JungleQuest"
			LevelQuest = 1
			NameMon = "Monkey"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
		elseif MyLevel == 15 or MyLevel <= 29 then -- Gorilla
			Ms = "Gorilla [Lv. 20]"
			NameQuest = "JungleQuest"
			LevelQuest = 2
			NameMon = "Gorilla"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08, -0.580869019, -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
		elseif MyLevel == 30 or MyLevel <= 39 then -- Pirate
			Ms = "Pirate [Lv. 35]"
			NameQuest = "BuggyQuest1"
			LevelQuest = 1
			NameMon = "Pirate"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(-1311.44727, 4.77785587, 3878.10913, -0.266229719, 2.94305789e-08, -0.963909626, -1.10684184e-07, 1, 6.11032362e-08, 0.963909626, 1.22957047e-07, -0.266229719)
		elseif MyLevel == 40 or MyLevel <= 59 then -- Brute
			Ms = "Brute [Lv. 45]"
			NameQuest = "BuggyQuest1"
			LevelQuest = 2
			NameMon = "Brute"
			CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(-1349.54773, 4.77724838, 4440.31836, 0.905865192, -0.000296127051, -0.423566043, -1.13833148e-05, 0.999999762, -0.000723473262, 0.423566163, 0.000660190824, 0.905864954)
		elseif MyLevel == 60 or MyLevel <= 74 then -- Desert Bandit
			Ms = "Desert Bandit [Lv. 60]"
			NameQuest = "DesertQuest"
			LevelQuest = 1
			NameMon = "Desert Bandit"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
			CFrameMon = CFrame.new(1054.46924, 28.8281326, 4487.78516, 0.095742099, 9.99517002e-09, 0.995405734, 3.27853407e-08, 1, -1.31947298e-08, -0.995405734, 3.38979973e-08, 0.095742099)
		elseif MyLevel == 75 or MyLevel <= 89 then -- Desert Officre
			Ms = "Desert Officer [Lv. 70]"
			NameQuest = "DesertQuest"
			LevelQuest = 2
			NameMon = "Desert Officer"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
			CFrameMon = CFrame.new(1539.19324, 1.63675952, 4372.31982, 0.367986321, -7.58386349e-08, -0.929831564, -1.96705994e-08, 1, -8.93464929e-08, 0.929831564, 5.11685769e-08, 0.367986321)
		elseif MyLevel == 90 or MyLevel <= 99 then -- Snow Bandits
			Ms = "Snow Bandit [Lv. 90]"
			NameQuest = "SnowQuest"
			LevelQuest = 1
			NameMon = "Snow Bandits"
			CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMon = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, 0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
		elseif MyLevel == 100 or MyLevel <= 119 then -- Snowman
			Ms = "Snowman [Lv. 100]"
			NameQuest = "SnowQuest"
			LevelQuest = 2
			NameMon = "Snowman"
			CFrameQuest = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMon = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
		elseif MyLevel == 120 or MyLevel <= 149 then -- Chief Petty Officer
			Ms = "Chief Petty Officer [Lv. 120]"
			NameQuest = "MarineQuest2"
			LevelQuest = 1
			NameMon = "Chief Petty Officer"
			CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
		elseif MyLevel == 150 or MyLevel <= 174 then -- Sky Bandit
			Ms = "Sky Bandit [Lv. 150]"
			NameQuest = "SkyQuest"
			LevelQuest = 1
			NameMon = "Sky Bandit"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
		elseif MyLevel == 175 or MyLevel <= 189 then -- Dark Master
			Ms = "Dark Master [Lv. 175]"
			NameQuest = "SkyQuest"
			LevelQuest = 2
			NameMon = "Dark Master"
			CFrameQuest = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
		elseif MyLevel == 190 or MyLevel <= 209 then
            Ms = "Prisoner [Lv. 190]"
            LevelQuest = 1
            NameQuest = "PrisonerQuest"
            NameMon = "Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
        elseif MyLevel == 210 or MyLevel <= 249 then
            Ms = "Dangerous Prisoner [Lv. 210]"
            LevelQuest = 2
            NameQuest = "PrisonerQuest"
            NameMon = "Dangerous Prisoner"
            CFrameQuest = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
            CFrameMon = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
        elseif MyLevel == 250 or MyLevel <= 274 then -- Toga Warrior
			Ms = "Toga Warrior [Lv. 250]"
			NameQuest = "ColosseumQuest"
			LevelQuest = 1
			NameMon = "Toga Warrior"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
		elseif MyLevel == 275 or MyLevel <= 299 then -- Gladiato
			Ms = "Gladiator [Lv. 275]"
			NameQuest = "ColosseumQuest"
			LevelQuest = 2
			NameMon = "Gladiato"
			CFrameQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
			CFrameMon = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
		elseif MyLevel == 300 or MyLevel <= 329 then -- Military Soldier
			Ms = "Military Soldier [Lv. 300]"
			NameQuest = "MagmaQuest"
			LevelQuest = 1
			NameMon = "Military Soldier"
			CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
		elseif MyLevel == 330 or MyLevel <= 374 then -- Military Spy
			Ms = "Military Spy [Lv. 325]"
			NameQuest = "MagmaQuest"
			LevelQuest = 2
			NameMon = "Military Spy"
			CFrameQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
			CFrameMon = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
		elseif MyLevel == 375 or MyLevel <= 399 then -- Fishman Warrior
			Ms = "Fishman Warrior [Lv. 375]"
			NameQuest = "FishmanQuest"
			LevelQuest = 1
			NameMon = "Fishman Warrior"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504, 0.893533468, 3.95251609e-09, 0.448996574, -2.34327455e-08, 1, 3.78297464e-08, -0.448996574, -4.43233645e-08, 0.893533468)
			CFrameMon = CFrame.new(60946.6094, 48.6735229, 1525.91687, -0.0817126185, 8.90751153e-08, 0.996655822, 2.00889794e-08, 1, -8.77269599e-08, -0.996655822, 1.28533992e-08, -0.0817126185)
		elseif MyLevel == 400 or MyLevel <= 449 then -- Fishman Commando
			Ms = "Fishman Commando [Lv. 400]"
			NameQuest = "FishmanQuest"
			LevelQuest = 2
			NameMon = "Fishman Commando"
			CFrameQuest = CFrame.new(61122.5625, 18.4716396, 1568.16504)
			CFrameMon = CFrame.new(61947.8555, 76.4840546, 1593.33154, -0.997647464, 4.47890507e-08, -0.0685530752, 3.90950667e-08, 1, 8.44011367e-08, 0.0685530752, 8.15224936e-08, -0.997647464)
		elseif MyLevel == 450 or MyLevel <= 474 then 
			Ms = "God's Guard [Lv. 450]"
			NameQuest = "SkyExp1Quest"
			LevelQuest = 1
			NameMon = "God's Guards"
			CFrameQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105)
			CFrameMon = CFrame.new(-4716.95703, 853.089722, -1933.925427)
		elseif MyLevel == 475 or MyLevel <= 524 then 
			Ms = "Shanda [Lv. 475]"
			NameQuest = "SkyExp1Quest"
			LevelQuest = 2
			NameMon = "Shandas"
			CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
			CFrameMon = CFrame.new(-7904.57373, 5584.37646, -459.62973, 0.65171206, 5.11171692e-08, 0.758466363, -4.76232476e-09, 1, -6.33034247e-08, -0.758466363, 3.76435416e-08, 0.65171206)
		elseif MyLevel == 525 or MyLevel <= 549 then -- Royal Squad
			Ms = "Royal Squad [Lv. 525]"
			NameQuest = "SkyExp2Quest"
			LevelQuest = 1
			NameMon = "Royal Squad"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-7555.04199, 5606.90479, -1303.24744, -0.896107852, -9.6057462e-10, -0.443836004, -4.24974544e-09, 1, 6.41599973e-09, 0.443836004, 7.63560326e-09, -0.896107852)
		elseif MyLevel == 550 or MyLevel <= 624 then -- Royal Soldier
			Ms = "Royal Soldier [Lv. 550]"
			NameQuest = "SkyExp2Quest"
			LevelQuest = 2
			NameMon = "Royal Soldier"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMon = CFrame.new(-7837.31152, 5649.65186, -1791.08582, -0.716008604, 0.0104285581, -0.698013008, 5.02521061e-06, 0.99988848, 0.0149335321, 0.69809103, 0.0106890313, -0.715928733)
		elseif MyLevel == 625 or MyLevel <= 649 then -- Galley Pirate
			Ms = "Galley Pirate [Lv. 625]"
			NameQuest = "FountainQuest"
			LevelQuest = 1
			NameMon = "Galley Pirate"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMon = CFrame.new(5569.80518, 38.5269432, 3849.01196, 0.896460414, 3.98027495e-08, 0.443124533, -1.34262139e-08, 1, -6.26611296e-08, -0.443124533, 5.02237434e-08, 0.896460414)
		elseif MyLevel >= 650 then -- Galley Captain
			Ms = "Galley Captain [Lv. 650]"
			NameQuest = "FountainQuest"
			LevelQuest = 2
			NameMon = "Galley Captain"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMon = CFrame.new(5782.90186, 94.5326462, 4716.78174, 0.361808896, -1.24757526e-06, -0.932252586, 2.16989656e-06, 1, -4.96097414e-07, 0.932252586, -1.84339774e-06, 0.361808896)
		end
	end
	if NewWorld then
		if MyLevel == 700 or MyLevel <= 724 then -- Raider [Lv. 700]
			Ms = "Raider [Lv. 700]"
			NameQuest = "Area1Quest"
			LevelQuest = 1
			NameMon = "Raider"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMon = CFrame.new(-737.026123, 10.1748352, 2392.57959, 0.272128761, 0, -0.962260842, -0, 1, -0, 0.962260842, 0, 0.272128761)
		elseif MyLevel == 725 or MyLevel <= 774 then -- Mercenary [Lv. 725]
			Ms = "Mercenary [Lv. 725]"
			NameQuest = "Area1Quest"
			LevelQuest = 2
			NameMon = "Mercenary"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMon = CFrame.new(-1022.21271, 72.9855194, 1891.39148, -0.990782857, 0, -0.135460541, 0, 1, 0, 0.135460541, 0, -0.990782857)
		elseif MyLevel == 775 or MyLevel <= 799 then -- Swan Pirate [Lv. 775]
			Ms = "Swan Pirate [Lv. 775]"
			NameQuest = "Area2Quest"
			LevelQuest = 1
			NameMon = "Swan Pirate"
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
			CFrameMon = CFrame.new(976.467651, 111.174057, 1229.1084, 0.00852567982, -4.73897828e-08, -0.999963999, 1.12251888e-08, 1, -4.7295778e-08, 0.999963999, -1.08215579e-08, 0.00852567982)
		elseif MyLevel == 800 or MyLevel <= 874 then -- Factory Staff [Lv. 800]
			Ms = "Factory Staff [Lv. 800]"
			NameQuest = "Area2Quest"
			LevelQuest = 2
			NameMon = "Factory Staff"
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
			CFrameMon = CFrame.new(336.74585, 73.1620483, -224.129272, 0.993632793, 3.40154607e-08, 0.112668738, -3.87658332e-08, 1, 3.99718729e-08, -0.112668738, -4.40850592e-08, 0.993632793)
		elseif MyLevel == 875 or MyLevel <= 899 then -- Marine Lieutenant [Lv. 875]
			Ms = "Marine Lieutenant [Lv. 875]"
			NameQuest = "MarineQuest3"
			LevelQuest = 1
			NameMon = "Marine Lieutenant"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-2842.69922, 72.9919434, -2901.90479, -0.762281299, 0, -0.64724648, 0, 1.00000012, 0, 0.64724648, 0, -0.762281299)
		elseif MyLevel == 900 or MyLevel <= 949 then -- Marine Captain [Lv. 900]
			Ms = "Marine Captain [Lv. 900]"
			NameQuest = "MarineQuest3"
			LevelQuest = 2
			NameMon = "Marine Captain"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMon = CFrame.new(-1814.70313, 72.9919434, -3208.86621, -0.900422215, 7.93464423e-08, -0.435017526, 3.68856199e-08, 1, 1.06050372e-07, 0.435017526, 7.94441988e-08, -0.900422215)
		elseif MyLevel == 950 or MyLevel <= 974 then -- Zombie [Lv. 950]
			Ms = "Zombie [Lv. 950]"
			NameQuest = "ZombieQuest"
			LevelQuest = 1
			NameMon = "Zombie"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMon = CFrame.new(-5649.23438, 126.0578, -737.773743, 0.355238914, -8.10359282e-08, 0.934775114, 1.65461245e-08, 1, 8.04023372e-08, -0.934775114, -1.3095117e-08, 0.355238914)
		elseif MyLevel == 975 or MyLevel <= 999 then -- Vampire [Lv. 975]
			Ms = "Vampire [Lv. 975]"
			NameQuest = "ZombieQuest"
			LevelQuest = 2
			NameMon = "Vampire"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMon = CFrame.new(-6030.32031, 0.4377408, -1313.5564, -0.856965423, 3.9138893e-08, -0.515373945, -1.12178942e-08, 1, 9.45958547e-08, 0.515373945, 8.68467822e-08, -0.856965423)
		elseif MyLevel == 1000 or MyLevel <= 1049 then -- Snow Trooper [Lv. 1000] **
			Ms = "Snow Trooper [Lv. 1000]"
			NameQuest = "SnowMountainQuest"
			LevelQuest = 1
			NameMon = "Snow Trooper"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame.new(621.003418, 391.361053, -5335.43604, 0.481644779, 0, 0.876366913, 0, 1, 0, -0.876366913, 0, 0.481644779)
		elseif MyLevel == 1050 or MyLevel <= 1099 then -- Winter Warrior [Lv. 1050]
			Ms = "Winter Warrior [Lv. 1050]"
			NameQuest = "SnowMountainQuest"
			LevelQuest = 2
			NameMon = "Winter Warrior"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMon = CFrame.new(1295.62683, 429.447784, -5087.04492, -0.698032081, -8.28980049e-08, -0.71606636, -1.98835952e-08, 1, -9.63858184e-08, 0.71606636, -5.30424877e-08, -0.698032081)
		elseif MyLevel == 1100 or MyLevel <= 1124 then -- Lab Subordinate [Lv. 1100]
			Ms = "Lab Subordinate [Lv. 1100]"
			NameQuest = "IceSideQuest"
			LevelQuest = 1
			NameMon = "Lab Subordinate"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMon = CFrame.new(-5769.2041, 37.9288292, -4468.38721, -0.569419742, -2.49055017e-08, 0.822046936, -6.96206541e-08, 1, -1.79282633e-08, -0.822046936, -6.74401548e-08, -0.569419742)
		elseif MyLevel == 1125 or MyLevel <= 1174 then -- Horned Warrior [Lv. 1125]
			Ms = "Horned Warrior [Lv. 1125]"
			NameQuest = "IceSideQuest"
			LevelQuest = 2
			NameMon = "Horned Warrior"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMon = CFrame.new(-6401.27979, 15.9775667, -5948.24316, 0.388303697, 0, -0.921531856, 0, 1, 0, 0.921531856, 0, 0.388303697)
		elseif MyLevel == 1175 or MyLevel <= 1199 then -- Magma Ninja [Lv. 1175]
			Ms = "Magma Ninja [Lv. 1175]"
			NameQuest = "FireSideQuest"
			LevelQuest = 1
			NameMon = "Magma Ninja"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-5466.06445, 57.6952019, -5837.42822, -0.988835871, 0, -0.149006829, 0, 1, 0, 0.149006829, 0, -0.988835871)
		elseif MyLevel == 1200 or MyLevel <= 1249 then 
			Ms = "Lava Pirate [Lv. 1200]"
			NameQuest = "FireSideQuest"
			LevelQuest = 2
			NameMon = "Lava Pirate"
			CFrameQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
			CFrameMon = CFrame.new(-5169.71729, 34.1234779, -4669.73633, -0.196780294, 0, 0.98044765, 0, 1.00000012, -0, -0.98044765, 0, -0.196780294)
		elseif MyLevel == 1250 or MyLevel <= 1274 then 
			Ms = "Ship Deckhand [Lv. 1250]"
			NameQuest = "ShipQuest1"
			LevelQuest = 1
			NameMon = "Ship Deckhand"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(1163.80872, 138.288452, 33058.4258, -0.998580813, 5.49076979e-08, -0.0532564968, 5.57436763e-08, 1, -1.42118655e-08, 0.0532564968, -1.71604082e-08, -0.998580813)
		elseif MyLevel == 1275 or MyLevel <= 1299 then 
			Ms = "Ship Engineer [Lv. 1275]"
			NameQuest = "ShipQuest1"
			LevelQuest = 2
			NameMon = "Ship Engineer"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
			CFrameMon = CFrame.new(921.30249023438, 125.400390625, 32937.34375)
		elseif MyLevel == 1300 or MyLevel <= 1324 then 
			Ms = "Ship Steward [Lv. 1300]"
			NameQuest = "ShipQuest2"
			LevelQuest = 1
			NameMon = "Ship Steward"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(917.96057128906, 136.89932250977, 33343.4140625)
		elseif MyLevel == 1325 or MyLevel <= 1349 then 
			Ms = "Ship Officer [Lv. 1325]"
			NameQuest = "ShipQuest2"
			LevelQuest = 2
			NameMon = "Ship Officer"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
			CFrameMon = CFrame.new(944.44964599609, 181.40081787109, 33278.9453125)
		elseif MyLevel == 1350 or MyLevel <= 1374 then 
			Ms = "Arctic Warrior [Lv. 1350]"
			NameQuest = "FrostQuest"
			LevelQuest = 1
			NameMon = "Arctic Warrior"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMon = CFrame.new(5878.23486, 81.3886948, -6136.35596, -0.451037169, 2.3908234e-07, 0.892505825, -1.08168464e-07, 1, -3.22542007e-07, -0.892505825, -2.4201924e-07, -0.451037169)
		elseif MyLevel == 1375 or MyLevel <= 1424 then -- Snow Lurker [Lv. 1375]
			Ms = "Snow Lurker [Lv. 1375]"
			NameQuest = "FrostQuest"
			LevelQuest = 2
			NameMon = "Snow Lurker"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMon = CFrame.new(5513.36865, 60.546711, -6809.94971, -0.958693981, -1.65617333e-08, 0.284439981, -4.07668654e-09, 1, 4.44854642e-08, -0.284439981, 4.14883701e-08, -0.958693981)
		elseif MyLevel == 1425 or MyLevel <= 1449 then -- Sea Soldier [Lv. 1425]
			Ms = "Sea Soldier [Lv. 1425]"
			NameQuest = "ForgottenQuest"
			LevelQuest = 1
			NameMon = "Sea Soldier"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMon = CFrame.new(-3115.78223, 63.8785706, -9808.38574, -0.913427353, 3.11199457e-08, 0.407000452, 7.79564235e-09, 1, -5.89660658e-08, -0.407000452, -5.06883708e-08, -0.913427353)
		elseif MyLevel >= 1450 then -- Water Fighter [Lv. 1450]
			Ms = "Water Fighter [Lv. 1450]"
			NameQuest = "ForgottenQuest"
			LevelQuest = 2
			NameMon = "Water Fighter"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMon = CFrame.new(-3212.99683, 263.809296, -10551.8799, 0.742111444, -5.59139615e-08, -0.670276582, 1.69155214e-08, 1, -6.46908234e-08, 0.670276582, 3.66697037e-08, 0.742111444)
		end
	end
	if ThreeWorld then
		if MyLevel >= 1500 and MyLevel <= 1524 then -- Pirate Millionaire [Lv. 1500]
			Ms = "Pirate Millionaire [Lv. 1500]"
			NameQuest = "PiratePortQuest"
			LevelQuest = 1
			NameMon = "Pirate Millionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
		elseif MyLevel >= 1525 and MyLevel <= 1574 then -- Pistol Billionaire [Lv. 1525]
			Ms = "Pistol Billionaire [Lv. 1525]"
			NameQuest = "PiratePortQuest"
			LevelQuest = 2
			NameMon = "Pistol Billionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMon = CFrame.new(81.164993286133, 43.755737304688, 5724.7021484375)
		elseif MyLevel >= 1575 and MyLevel <= 1599 then -- Dragon Crew Warrior [Lv. 1575]
			Ms = "Dragon Crew Warrior [Lv. 1575]"
			NameQuest = "AmazonQuest"
			LevelQuest = 1
			NameMon = "Dragon Crew Warrior"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6241.9951171875, 51.522083282471, -1243.9771728516)
		elseif MyLevel >= 1600 and MyLevel <= 1624 then -- Dragon Crew Archer [Lv. 1600]
			Ms = "Dragon Crew Archer [Lv. 1600]"
			NameQuest = "AmazonQuest"
			LevelQuest = 2
			NameMon = "Dragon Crew Archer"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMon = CFrame.new(6488.9155273438, 383.38375854492, -110.66246032715)
		elseif MyLevel >= 1625 and MyLevel <= 1649 then -- Female Islander [Lv. 1625]
			Ms = "Female Islander [Lv. 1625]"
			NameQuest = "AmazonQuest2"
			LevelQuest = 1
			NameMon = "Female Islander"
			CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4770.4990234375, 758.95520019531, 1069.8680419922)
		elseif MyLevel >= 1650 and MyLevel <= 1699 then -- Giant Islander [Lv. 1650]
			Ms = "Giant Islander [Lv. 1650]"
			NameQuest = "AmazonQuest2"
			LevelQuest = 2
			NameMon = "Giant Islander"
			CFrameQuest = CFrame.new(5448.86133, 601.516174, 751.130676, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMon = CFrame.new(4530.3540039063, 656.75695800781, -131.60952758789)
		elseif MyLevel >= 1700 and MyLevel <= 1724 then -- Marine Commodore [Lv. 1700]
			Ms = "Marine Commodore [Lv. 1700]"
			NameQuest = "MarineTreeIsland"
			LevelQuest = 1
			NameMon = "Marine Commodore"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(2490.0844726563, 190.4232635498, -7160.0502929688)
		elseif MyLevel >= 1725 and MyLevel <= 1774 then -- Marine Rear Admiral [Lv. 1725]
			Ms = "Marine Rear Admiral [Lv. 1725]"
			NameQuest = "MarineTreeIsland"
			LevelQuest = 2
			NameMon = "Marine Rear Admiral"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMon = CFrame.new(3951.3903808594, 229.11549377441, -6912.81640625)
		elseif MyLevel >= 1775 and MyLevel <= 1799 then -- Fishman Raider [Lv. 1775]
			Ms = "Fishman Raider [Lv. 1775]"
			NameQuest = "DeepForestIsland3"
			LevelQuest = 1
			NameMon = "Fishman Raider"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-10322.400390625, 390.94473266602, -8580.0908203125)
		elseif MyLevel >= 1800 and MyLevel <= 1824 then -- Fishman Captain [Lv. 1800]
			Ms = "Fishman Captain [Lv. 1800]"
			NameQuest = "DeepForestIsland3"
			LevelQuest = 2
			NameMon = "Fishman Captain"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMon = CFrame.new(-11194.541992188, 442.02795410156, -8608.806640625)
		elseif MyLevel >= 1825 and MyLevel <= 1849 then -- Forest Pirate [Lv. 1825]
			Ms = "Forest Pirate [Lv. 1825]"
			NameQuest = "DeepForestIsland"
			LevelQuest = 1
			NameMon = "Forest Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13225.809570313, 428.19387817383, -7753.1245117188)
		elseif MyLevel >= 1850 and MyLevel <= 1899 then -- Mythological Pirate [Lv. 1850]
			Ms = "Mythological Pirate [Lv. 1850]"
			NameQuest = "DeepForestIsland"
			LevelQuest = 2
			NameMon = "Mythological Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMon = CFrame.new(-13869.172851563, 564.95251464844, -7084.4135742188)
		elseif MyLevel >= 1900 and MyLevel <= 1924 then -- Jungle Pirate [Lv. 1900]
			Ms = "Jungle Pirate [Lv. 1900]"
			NameQuest = "DeepForestIsland2"
			LevelQuest = 1
			NameMon = "Jungle Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-11982.221679688, 376.32522583008, -10451.415039063)
		elseif MyLevel >= 1925 and MyLevel <= 1974 then -- Musketeer Pirate [Lv. 1925]
			Ms = "Musketeer Pirate [Lv. 1925]"
			NameQuest = "DeepForestIsland2"
			LevelQuest = 2
			NameMon = "Musketeer Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMon = CFrame.new(-13282.3046875, 496.23684692383, -9565.150390625)
		elseif MyLevel >= 1975 and MyLevel <= 1999 then
			Ms = "Reborn Skeleton [Lv. 1975]"
			NameQuest = "HauntedQuest1"
			LevelQuest = 1
			NameMon = "Reborn Skeleton"
			CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame.new(-8817.880859375, 191.16761779785, 6298.6557617188)
		elseif MyLevel >= 2000 and MyLevel <= 2024 then
			Ms = "Living Zombie [Lv. 2000]"
			NameQuest = "HauntedQuest1"
			LevelQuest = 2
			NameMon = "Living Zombie"
			CFrameQuest = CFrame.new(-9480.8271484375, 142.13066101074, 5566.0712890625)
			CFrameMon = CFrame.new(-10125.234375, 183.94705200195, 6242.013671875)
		elseif MyLevel >= 2025 and MyLevel <= 2049  then
			Ms = "Demonic Soul [Lv. 2025]"
			NameQuest = "HauntedQuest2"
			LevelQuest = 1
			NameMon = "Demonic Soul"
			CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame.new(-9712.03125, 204.69589233398, 6193.322265625)
		elseif MyLevel >= 2050 and MyLevel <= 2074 then
			Ms = "Posessed Mummy [Lv. 2050]"
			NameQuest = "HauntedQuest2"
			LevelQuest = 2
			NameMon = "Posessed Mummy"
			CFrameQuest = CFrame.new(-9516.9931640625, 178.00651550293, 6078.4653320313)
			CFrameMon = CFrame.new(-9545.7763671875, 69.619895935059, 6339.5615234375)    
		elseif MyLevel >= 2075 and MyLevel <= 2099 then
			Ms = "Peanut Scout [Lv. 2075]"
			NameQuest = "NutsIslandQuest"
			LevelQuest = 1
			NameMon = "Peanut Scout"
			CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
			CFrameMon = CFrame.new(-2098.07544, 192.611862, -10248.8867, 0.983392298, -9.57031787e-08, 0.181492642, 8.7276355e-08, 1, 5.44169616e-08, -0.181492642, -3.76732068e-08, 0.983392298)
		elseif MyLevel >= 2100 and MyLevel <= 2124 then
			Ms = "Peanut President [Lv. 2100]"
			NameQuest = "NutsIslandQuest"
			LevelQuest = 2
			NameMon = "Peanut President"
			CFrameQuest = CFrame.new(-2104.17163, 38.1299706, -10194.418, 0.758814394, -1.38604395e-09, 0.651306927, 2.85280208e-08, 1, -3.1108879e-08, -0.651306927, 4.21863646e-08, 0.758814394)
			CFrameMon = CFrame.new(-1876.95959, 192.610947, -10542.2939, 0.0553516336, -2.83836812e-08, 0.998466909, -6.89634405e-10, 1, 2.84654931e-08, -0.998466909, -2.26418861e-09, 0.0553516336)
		elseif MyLevel >= 2125 and MyLevel <= 2149 then
			Ms = "Ice Cream Chef [Lv. 2125]"
			NameQuest = "IceCreamIslandQuest"
			LevelQuest = 1
			NameMon = "Ice Cream Chef"
			CFrameQuest = CFrame.new(-820.404358, 65.8453293, -10965.5654, 0.822534859, 5.24448502e-08, -0.568714678, -2.08336317e-08, 1, 6.20846663e-08, 0.568714678, -3.92184099e-08, 0.822534859)
			CFrameMon = CFrame.new(-821.614075, 208.39537, -10990.7617, -0.870096624, 3.18909272e-08, 0.492881238, -1.8357893e-08, 1, -9.71107568e-08, -0.492881238, -9.35439957e-08, -0.870096624)
		elseif MyLevel >= 2150 and MyLevel <= 2199 then 
			Ms = "Ice Cream Commander [Lv. 2150]"
			NameQuest = "IceCreamIslandQuest"
			LevelQuest = 2
			NameMon = "Ice Cream Commander"
			CFrameQuest = CFrame.new(-819.376526, 67.4634171, -10967.2832)
			CFrameMon = CFrame.new(-610.11669921875, 208.26904296875, -11253.686523438)
		elseif MyLevel >= 2200 and MyLevel <= 2224 then 
			Ms = "Cookie Crafter [Lv. 2200]"
			NameQuest = "CakeQuest1"
			LevelQuest = 1
			NameMon = "Cookie Crafter"
			CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
			CFrameMon = CFrame.new(-2286.684326171875, 146.5656280517578, -12226.8818359375)
		elseif MyLevel >= 2225 and MyLevel <= 2249 then 
			Ms = "Cake Guard [Lv. 2225]"
			NameQuest = "CakeQuest1"
			LevelQuest = 2
			NameMon = "Cake Guard"
			CFrameQuest = CFrame.new(-2020.6068115234375, 37.82400894165039, -12027.80859375)
			CFrameMon = CFrame.new(-1817.9747314453125, 209.5632781982422, -12288.9228515625)
		elseif MyLevel >= 2250 and MyLevel <= 2274 then 
			Ms = "Baking Staff [Lv. 2250]"
			NameQuest = "CakeQuest2"
			LevelQuest = 1
			NameMon = "Baking Staff"
			CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame.new(-1818.347900390625, 93.41275787353516, -12887.66015625)
		elseif MyLevel >= 2275 then 
			Ms = "Head Baker [Lv. 2275]"
			NameQuest = "CakeQuest2"
			LevelQuest = 2
			NameMon = "Head Baker"
			CFrameQuest = CFrame.new(-1928.31763, 37.7296638, -12840.626)
			CFrameMon = CFrame.new(-2288.795166015625, 106.9419174194336, -12811.111328125)
		end
	end
end

CheckQuest()

-- Function
function toTarget(CFgo)
    local tweenfunc = {}
    if (game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude <= 20 then
        pcall(function()
            tween:Cancel()

            game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame = CFgo

            return
        end)
    end
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/275, Enum.EasingStyle.Linear)
    local tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
    tween:Play()

    function tweenfunc:Stop()
        tween:Cancel()
    end 

    return tweenfunc
end

function Click()
	pcall(function()
		if game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeapon) then
			local VirtualUser = game:GetService('VirtualUser')
			VirtualUser:CaptureController()
			VirtualUser:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
		end
	end)
end
function EquipWeapon(ToolSe)
	spawn(function()
	    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) or game.Players.LocalPlayer.Character:FindFirstChild(ToolSe) then
			local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
			wait(.1)
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
		end
	end)
end 
local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
Table_DevilFruitSniper = {}
for i,v in next,Remote_GetFruits do
    table.insert(Table_DevilFruitSniper,v.Name)
end

local CombatFrameworkROld = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local CombatFrameworkR = getupvalues(CombatFrameworkROld)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
fastattack = true
spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			CombatFrameworkR.activeController.hitboxMagnitude = 55
			if Usefastattack then
				if fastattack then
					if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
						CombatFrameworkR.activeController.timeToNextAttack = 3
					elseif game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
						CombatFrameworkR.activeController.timeToNextAttack = 2
					else
						CombatFrameworkR.activeController.timeToNextAttack = 0
					end
					CombatFrameworkR.activeController.attacking = false
					CombatFrameworkR.activeController.increment = 3
					CombatFrameworkR.activeController.blocking = false
					CombatFrameworkR.activeController.timeToNextBlock = 0
					game.Players.LocalPlayer.Character.Humanoid.Sit = false	
				end
			end
		end)
	end)
end)

spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if Usefastattack then
				if fastattack then
					Click()
				end
			end
		end)
	end)
end)

if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
    game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
        pcall(function()
			if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
				game.Players.LocalPlayer.Character.Stun.Value = 0
			end
        end)
    end)
end
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if AutoFarmLevel or AutoRaids then
            if not KRNL_LOADED and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                setfflag("HumanoidParallelRemoveNoPhysics", "False")
                setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            else
                if not game:GetService("Workspace"):FindFirstChild("LOL") then
                    local LOL = Instance.new("Part")
                    LOL.Name = "LOL"
                    LOL.Parent = game.Workspace
                    LOL.Anchored = true
                    LOL.Transparency = 1
                    LOL.Size = Vector3.new(50,0.5,50)
                elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                    game.Workspace["LOL"].CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y - 3.9,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
                end
            end
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)

platform = Instance.new("Part")
platform.Name = "WaterWalk"
platform.Size = Vector3.new(math.huge, 1, math.huge)
platform.Transparency = 1
platform.Anchored = true
platform.Parent = game.workspace
spawn(function()
    while wait() do
        if AutoFarmLevel then
            platform.CanCollide = true
            platform.Position = Vector3.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y * 0 -5, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z)
        else
            platform.CanCollide = false
            platform.Position = Vector3.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.X,game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Y * 0 -6, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.Z)
        end
    end
end)

HaveSaber = false
StatusSaber = "Not Finished" 
-- Auto Farm Zone
HaveDevilFruitSea3 = false
haveFruitDrop = false
UseThireWorld = false
HaveRengoku = false
local function RemoveSpaces(str)
    return str:gsub(" Fruit", "")
end
function AutoFarm()
    GetQuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title
    GetQuest = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest
    MyLevelNow = game.Players.LocalPlayer.Data.Level.Value
    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
    if OldWorld and MyLevelNow >= 700 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
        if HaveSaber then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
                if Workspace.Map.Ice.Door.Transparency == 1 then
                    if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 250 then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                            local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                            wait(.4)
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                        end
                        DoorNewWorldTween = toTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                            if DoorNewWorldTween then
                                DoorNewWorldTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                        end
                    elseif game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 and (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if DoorNewWorldTween then
                            DoorNewWorldTween:Stop()
                        end
                        CheckBoss = true
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not CheckBoss or not v.Parent or v.Humanoid.Health <= 0 or AutoFarmLevel== false
                                Usefastattack = false
                                repeat wait()
                                    a = 2
                                    local args = {
                                        [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                until a == 1
                            end
                        end
                        CheckBoss = false
                    end 
                else
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") or game.Players.LocalPlayer.Character:FindFirstChild("Key") then
                        DoorNewWorldTween = toTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
                        if (CFrame.new(1347.7124, 37.3751602, -1325.6488).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                            if DoorNewWorldTween then
                                DoorNewWorldTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1347.7124, 37.3751602, -1325.6488)
                            local args = {
                                [1] = "DressrosaQuestProgress",
                                [2] = "Detective"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            wait(0.5)
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                                wait(.4)
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                            end
                        end
                    else
                        AutoNewWorldTween = toTarget(CFrame.new(4849.29883, 5.65138149, 719.611877))
                        if (CFrame.new(4849.29883, 5.65138149, 719.611877).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 250 then
                            if AutoNewWorldTween then
                                AutoNewWorldTween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4849.29883, 5.65138149, 719.611877)
                            local args = {
                                [1] = "DressrosaQuestProgress",
                                [2] = "Detective"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            wait(0.5)
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
                                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
                                wait(.4)
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                            end
                        end
                    end
                end
            else
                local args = {
                    [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        else
            if game.Workspace.Map.Jungle.Final.Part.CanCollide == false then
                if game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
					if SaberDelete then
						SaberDelete:Delete()
					end
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if AutoFarmLevel and v.Name == "Saber Expert [Lv. 200] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat wait()
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                    Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Farmtween then
                                        Farmtween:Stop()
                                    end
                                    EquipWeapon(SelectToolWeapon)
                                    Usefastattack = true
                                    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                        local args = {
                                            [1] = "Buso"
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                                    Click()
                                end
                            until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0
                            local BuyAll = {
                                "Soru",
                                "Buso",
                                "Geppo"
                            }
                            for i,v in pairs(BuyAll) do
                                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyHaki", v)
                            end
                            Usefastattack = false
                        end
                    end
                else
					SaberDelete = library:Notification("Boss Not Spawn\nบอสยังไม่เกิด")
                    Questtween = toTarget(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                    if (CFrame.new(-1405.41956, 29.8519993, 5.62435055).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.41956, 29.8519993, 5.62435055, 0.885240912, 3.52892613e-08, 0.465132833, -6.60881128e-09, 1, -6.32913171e-08, -0.465132833, 5.29540891e-08, 0.885240912)
                    end
                end
            elseif game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") and game.Players.localPlayer.Data.Level.Value >= 200 then
                EquipWeapon("Relic")
                wait(0.5)
                Questtween = toTarget(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                if (CFrame.new(-1405.41956, 29.8519993, 5.62435055).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Questtween then
                        Questtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.41956, 29.8519993, 5.62435055, 0.885240912, 3.52892613e-08, 0.465132833, -6.60881128e-09, 1, -6.32913171e-08, -0.465132833, 5.29540891e-08, 0.885240912)
                end
            else
                if Workspace.Map.Jungle.QuestPlates.Door.CanCollide == false then
                    if game.Workspace.Map.Desert.Burn.Part.CanCollide == false then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") == 0 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 0 then
                                if game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if AutoFarmLevel and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Mob Leader [Lv. 120] [Boss]" then
                                            repeat
                                                pcall(function() wait() 
                                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                                        if Farmtween then
                                                            Farmtween:Stop()
                                                        end
                                                        EquipWeapon(SelectToolWeapon)
                                                        Usefastattack = true
                                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                                            local args = {
                                                                [1] = "Buso"
                                                            }
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        end
                                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                                                        Click()
                                                    end
                                                end)
                                            until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0
                                            Usefastattack = false
                                        end
                                    end
                                else
                                    Questtween = toTarget(CFrame.new(-2848.59399, 7.4272871, 5342.44043))
                                    if (CFrame.new(-2848.59399, 7.4272871, 5342.44043).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2848.59399, 7.4272871, 5342.44043, -0.928248107, -8.7248246e-08, 0.371961564, -7.61816636e-08, 1, 4.44474857e-08, -0.371961564, 1.29216433e-08, -0.928248107)
                                    end
                                end
                            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","RichSon") == 1 then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Relic") or game.Players.LocalPlayer.Character:FindFirstChild("Relic") then
                                    EquipWeapon("Relic")
                                    wait(0.5)
                                    Questtween = toTarget(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                                    if (CFrame.new(-1405.41956, 29.8519993, 5.62435055).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1405.41956, 29.8519993, 5.62435055)
                                    end
                                else
                                    Questtween = toTarget(CFrame.new(-910.979736, 13.7520342, 4078.14624))
                                    if (CFrame.new(-910.979736, 13.7520342, 4078.14624).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Questtween then
                                            Questtween:Stop()
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-910.979736, 13.7520342, 4078.14624, 0.00685182028, -1.53155766e-09, -0.999976516, 9.15205245e-09, 1, -1.46888401e-09, 0.999976516, -9.14177267e-09, 0.00685182028)
                                        wait(.5)
                                        local args = {
                                            [1] = "ProQuestProgress",
                                            [2] = "RichSon"
                                        }
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    end
                                end
                            else
                                Questtween = toTarget(CFrame.new(-910.979736, 13.7520342, 4078.14624))
                                if (CFrame.new(-910.979736, 13.7520342, 4078.14624).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Questtween then
                                        Questtween:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-910.979736, 13.7520342, 4078.14624)
                                    local args = {
                                        [1] = "ProQuestProgress",
                                        [2] = "RichSon"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                            end
                        else
                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") or game.Players.LocalPlayer.Character:FindFirstChild("Cup") then
								pcall(function()
									EquipWeapon("Cup")
									wait(1)
									if game.Players.LocalPlayer.Character["Cup"].Handle:FindFirstChild("TouchInterest") or game.Players.LocalPlayer.Backpack["Cup"].Handle:FindFirstChild("TouchInterest") then
										Questtween = toTarget(CFrame.new(1397.229, 37.3480148, -1320.85217))
										if (CFrame.new(1397.229, 37.3480148, -1320.85217).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
											if Questtween then
												Questtween:Stop()
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1397.229, 37.3480148, -1320.85217, -0.11285457, 2.01368788e-08, 0.993611455, 1.91641178e-07, 1, 1.50028845e-09, -0.993611455, 1.90586206e-07, -0.11285457)
										end
									else
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1458.54285, 88.2521744, -1390.34912, -0.00596274994, 1.13679788e-09, -0.999982238, 7.28181793e-10, 1, 1.132476e-09, 0.999982238, -7.21416205e-10, -0.00596274994)
										wait(0.5)
										if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress","SickMan") ~= 0 then
											local args = {
												[1] = "ProQuestProgress",
												[2] = "SickMan"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
									end
								end)
                            else
                                Questtween = toTarget(game.Workspace.Map.Desert.Cup.CFrame)
                                if (game.Workspace.Map.Desert.Cup.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                    if Questtween then
                                        Questtween:Stop()
                                    end
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Desert.Cup.CFrame
                                end
                            end
                        end
                    else
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                            EquipWeapon("Torch")
                            Questtween = toTarget(CFrame.new(1114.87708, 4.9214654, 4349.8501))
                            if (CFrame.new(1114.87708, 4.9214654, 4349.8501).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Questtween then
                                    Questtween:Stop()
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1114.87708, 4.9214654, 4349.8501, -0.612586915, -9.68697833e-08, 0.790403247, -1.2634203e-07, 1, 2.4638446e-08, -0.790403247, -8.47679615e-08, -0.612586915)
                            end
                        else
                            Questtween = toTarget(CFrame.new(-1610.00757, 11.5049858, 164.001587))
                            if (CFrame.new(-1610.00757, 11.5049858, 164.001587).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Questtween then
                                    Questtween:Stop()
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1610.00757, 11.5049858, 164.001587, 0.984807551, -0.167722285, -0.0449818149, 0.17364943, 0.951244235, 0.254912198, 3.42372805e-05, -0.258850515, 0.965917408)
                            end
                        end
                    end
                else
                    for i,v in pairs(Workspace.Map.Jungle.QuestPlates:GetChildren()) do
                        if v:IsA("Model") then wait()
                            if v.Button.BrickColor ~= BrickColor.new("Camo") then
                                repeat wait()
                                    Questtween = toTarget(v.Button.CFrame)
                                    if (v.Button.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 150 then
                                        if Questtween then Questtween:Stop() end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Button.CFrame
                                    end
                                until not AutoFarmLevel or v.Button.BrickColor == BrickColor.new("Camo")
                            end
                        end
                    end    
                end
            end
        end
    elseif NewWorld and MyLevelNow >= 850 and (game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2) then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
            if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == "Swan Pirate [Lv. 775]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then Farmtween:Stop() end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        StartMagnetAutoFarmLevel = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not v.Parent or v.Humanoid.Health <= 0 or AutoFarmLevel == false or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                Usefastattack = false
                                StartMagnetAutoFarmLevel = false
                            end)
                        end
                    end
                else
                    StartMagnetAutoFarmLevel = false
                    Questtween = toTarget(CFrame.new(1057.92761, 137.614319, 1242.08069))
                    if (CFrame.new(1057.92761, 137.614319, 1242.08069).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                        if Questtween then
                            Questtween:Stop()
                        end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1057.92761, 137.614319, 1242.08069)
                    end
                end
            else
                Bartilotween = toTarget(CFrame.new(-456.28952, 73.0200958, 299.895966))
                if ( CFrame.new(-456.28952, 73.0200958, 299.895966).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Bartilotween then Bartilotween:Stop() end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  CFrame.new(-456.28952, 73.0200958, 299.895966)
                    local args = {
                        [1] = "StartQuest",
                        [2] = "BartiloQuest",
                        [3] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end 
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
            StartMagnetAutoFarmLevel = false
            if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == "Jeremy [Lv. 850] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat wait()
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                            elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Farmtween then Farmtween:Stop() end
                                EquipWeapon(SelectToolWeapon)
                                Usefastattack = true
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {
                                        [1] = "Buso"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                Click()
                            end 
                        until not v.Parent or v.Humanoid.Health <= 0 or AutoFarmLevel == false
                        Usefastattack = false
                    end
                end
            else
                Bartilotween = toTarget(CFrame.new(2099.88159, 448.931, 648.997375))
                if (CFrame.new(2099.88159, 448.931, 648.997375).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Bartilotween then Bartilotween:Stop() end
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099.88159, 448.931, 648.997375)
                end
            end
        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
            if (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                Bartilotween = toTarget(CFrame.new(-1836, 11, 1714))
            elseif (CFrame.new(-1836, 11, 1714).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                if Bartilotween then Bartilotween:Stop() end
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1836, 11, 1714)
                wait(.5)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329, 13.1789551, 1750.89685)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305, 19.3777466, 1712.01807)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324, 16.5789185, 1750.89685)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835, 16.8604317, 1724.79541)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224, 15.987854, 1681.00659)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979, 16.4978027, 1684.52368)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343, 14.795166, 1717.90625)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843, 14.8604736, 1724.79541)
            end
        end
    elseif NewWorld and MyLevelNow >= 1500 then
        if AutoRengoku and game:GetService("Workspace").Map.IceCastle:FindFirstChild("RengokuChest") and not HaveRengoku then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or  game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
                EquipWeapon("Hidden Key")
                if (CFrame.new(6571.81885, 296.689758, -6966.76514).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                    Farmtween = toTarget(CFrame.new(6571.81885, 296.689758, -6966.76514))
                elseif (CFrame.new(6571.81885, 296.689758, -6966.76514).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Farmtween then
                        Farmtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(6571.81885, 296.689758, -6966.76514, 0.825126112, 8.412257e-10, 0.564948559, -2.42370835e-08, 1, 3.39100339e-08, -0.564948559, -4.16727595e-08, 0.825126112)
                end 
            elseif game.Workspace.Enemies:FindFirstChild("Snow Lurker [Lv. 1375]") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if AutoFarmLevel and v.Name == "Snow Lurker [Lv. 1375]" and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat wait()
                            if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                StartMagnetAutoFarmLevel = false
                            elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                if Farmtween then
                                    Farmtween:Stop()
                                end
                                PosMon = v.HumanoidRootPart.CFrame
                                EquipWeapon(SelectToolWeapon)
                                Usefastattack = true
                                StartMagnetAutoFarmLevel = true
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {
                                        [1] = "Buso"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                                Click()
                            end 
                        until game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or AutoFarmLevel == false or not v.Parent or v.Humanoid.Health <= 0
                        StartMagnetAutoFarmLevel = false
                        Usefastattack = false
                        if (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                            Farmtween = toTarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
                        elseif (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5518.00684, 60.5559731, -6828.80518, 0.825126112, 8.412257e-10, 0.564948559, -2.42370835e-08, 1, 3.39100339e-08, -0.564948559, -4.16727595e-08, 0.825126112)
                        end 
                    end
                end
            else
                StartMagnetAutoFarmLevel = false
                if (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                    Farmtween = toTarget(CFrame.new(5518.00684, 60.5559731, -6828.80518))
                elseif (CFrame.new(5518.00684, 60.5559731, -6828.80518).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                    if Farmtween then
                        Farmtween:Stop()
                    end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5518.00684, 60.5559731, -6828.80518, -0.650781393, -3.64292951e-08, 0.759265184, -4.07668654e-09, 1, 4.44854642e-08, -0.759265184, 2.58550248e-08, -0.650781393)
                end 
            end
        else
            local args = {
                [1] = "TravelZou" -- OLD WORLD to NEW WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                for i,v in pairs(game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("getInventoryFruits")) do
                    if v.Price >= 1000000 then 
                        HaveDevilFruitSea3 = true
                    end
                end
                if HaveDevilFruitSea3 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                    TabelDevilFruitStore = {}
                    TabelDevilFruitOpen = {}

                    for i,v in pairs(getInventoryFruit) do
                        for i1,v1 in pairs(v) do
                            if i1 == "Name" then 
                                table.insert(TabelDevilFruitStore,v1)
                            end
                        end
                    end

                    for i,v in next,game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
                        if v.Price >= 1000000 then  
                            table.insert(TabelDevilFruitOpen,v.Name)
                        end
                    end

                    for i,DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                        for i1,DevilFruitStore in pairs(TabelDevilFruitStore) do
                            if DevilFruitOpenDoor == DevilFruitStore and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then    
                                if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then   
                                    local string_1 = "LoadFruit";
                                    local string_2 = DevilFruitStore;
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    UseThireWorld = true wait(.1)
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "1";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "2";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "3";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                else
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "1";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "2";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                    local string_1 = "TalkTrevor";
                                    local string_2 = "3";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    Target:InvokeServer(string_1, string_2);
                                end
                            end
                        end
                    end
                    local string_1 = "TalkTrevor";
                    local string_2 = "1";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2);
                    local string_1 = "TalkTrevor";
                    local string_2 = "2";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2);
                    local string_1 = "TalkTrevor";
                    local string_2 = "3";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2);
                else
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                        if v:IsA("Tool") and string.find(v.Name,"Fruit") then 
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)    
                            EquipWeapon(SelectToolWeapon)
                            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                                if string.find(v.Name,"Fruit") then
                                    local FruitName = RemoveSpaces(v.Name)
                                    if v.Name == "Bird: Falcon Fruit" then
                                        NameFruit = "Bird-Bird: Falcon"
                                    elseif v.Name == "Bird: Phoenix Fruit" then
                                        NameFruit = "Bird-Bird: Phoenix"
                                    elseif v.Name == "Human: Buddha Fruit" then
                                        NameFruit = "Human-Human: Buddha"
                                    else
                                        NameFruit = FruitName.."-"..FruitName
                                    end
                
                                    local string_1 = "getInventoryFruits";
                                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                    for i1,v1 in pairs(Target:InvokeServer(string_1)) do
                                        if v1.Name == NameFruit then
                                            HaveFruitInStore = true
                                        end
                                    end
                                    if not HaveFruitInStore and not AutoRaids then
                                        local string_1 = "StoreFruit";
                                        local string_2 = NameFruit;
                                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                        Target:InvokeServer(string_1, string_2);
                                    end
                                    HaveFruitInStore = false
                                end
                            end
                        end
                    end
                    wait(.5)
                    ServerHop:Teleport()
                end
            else
                if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 0 then
                    if game.Workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then 	
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "rip_indra [Lv. 1500] [Boss]" and v:FindFirstChild("Humanoid")and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0 
                                wait(.5)
                                asmrqq = 2
                                repeat wait()
                                    local args = {
                                        [1] = "TravelZou" -- OLD WORLD to NEW WORLD
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                until asmrqq == 1
                                Usefastattack = false
                            end
                        end
                    else -- SlashHit : rbxassetid://2453605589
                        local string_1 = "ZQuestProgress";
                        local string_2 = "Check";
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2);
                        wait()
                        local string_1 = "ZQuestProgress";
                        local string_2 = "Begin";
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2);
                    end
                elseif game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "Check") == 1 then
                    local args = {
                        [1] = "TravelZou" -- OLD WORLD to NEW WORLD
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                else
                    if game.Workspace.Enemies:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then 	
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == "Don Swan [Lv. 1000] [Boss]" and v:FindFirstChild("Humanoid")and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                repeat wait()
                                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                                        Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                                        if Farmtween then
                                            Farmtween:Stop()
                                        end
                                        EquipWeapon(SelectToolWeapon)
                                        Usefastattack = true
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end 
                                until not AutoFarmLevel or not v.Parent or v.Humanoid.Health <= 0 
                                Usefastattack = false
                            end
                        end
                    else -- SlashHit : rbxassetid://2453605589
                        TweenDonSwanthireworld = toTarget(CFrame.new(2288.802, 15.1870775, 863.034607))
                        if (CFrame.new(2288.802, 15.1870775, 863.034607).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if TweenDonSwanthireworld then
                                TweenDonSwanthireworld:Stop()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2288.802, 15.1870775, 863.034607)
                            end
                        end
                    end
                end
            end
        end
    elseif AutoKillCakePrince and game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
        if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                if AutoFarmLevel and AutoKillCakePrince and v.Name == "Cake Prince [Lv. 2300] [Raid Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat wait()
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 300 then
                            Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                            Usefastattack = false
                        elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                            if Farmtween then
                                Farmtween:Stop()
                            end
                            PosFarmBone = v.HumanoidRootPart.CFrame
                            EquipWeapon(SelectToolWeapon)
                            Usefastattack = true
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {
                                    [1] = "Buso"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            Click()
                        end
                    until not AutoFarmLevel or not AutoKillCakePrince or not v.Parent or v.Humanoid.Health <= 0 or game.ReplicatedStorage:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")
                    Usefastattack = false
                end
            end
        else
            Usefastattack = false
            Questtween = toTarget(CFrame.new(-2151.82153, 149.315704, -12404.9053))
            if (CFrame.new(-2151.82153, 149.315704, -12404.9053).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 300 then
                if Questtween then Questtween:Stop() end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2151.82153, 149.315704, -12404.9053)
            end
        end
    else
        if game.ReplicatedStorage:FindFirstChild("Core") and game.ReplicatedStorage:FindFirstChild("Core"):FindFirstChild("Humanoid") then
            GOtween = toTarget(CFrame.new(448.46756, 199.356781, -441.389252))
            if NewWorld and game.ReplicatedStorage:FindFirstChild("Core") and (CFrame.new(448.46756, 199.356781, -441.389252).Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                if Questtween then Questtween:Stop() end
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            elseif (CFrame.new(448.46756, 199.356781, -441.389252).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                if Farmtween then GOtween:Stop()end
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.46756, 199.356781, -441.389252)
            end
        elseif game.Workspace.Enemies:FindFirstChild("Core") then
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                if AutoFarmLevel and v.Name == "Core" and v.Humanoid.Health > 0 then
                    repeat wait(.1)
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
                            Farmtween = toTarget(v.HumanoidRootPart.CFrame)
                        elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                            if Farmtween then Farmtween:Stop() end
                            EquipWeapon(SelectToolWeapon)
                            Usefastattack = true
                            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                local args = {
                                    [1] = "Buso"
                                }
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            end
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 10, 10)
                            Click()
                        end
                    until not AutoFarmLevel or v.Humanoid.Health <= 0 or Factory == false
                    Usefastattack = false
                end
            end
        else
            if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
            if GetQuest.Visible == false then
                Usefastattack = false
                StartMagnetAutoFarmLevel = false
                Questtween = toTarget(CFrameQuest) wait(.1)
                if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
                if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Questtween then Questtween:Stop() end wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                    if Questtween then Questtween:Stop() end wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Questtween then Questtween:Stop() end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                    if Questtween then Questtween:Stop() end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                elseif (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                    if Questtween then Questtween:Stop() end
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameQuest
                    wait(1)
                    local string_1 = "StartQuest";
                    local string_2 = NameQuest;
                    local number_1 = LevelQuest;
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1, string_2, number_1);
                    local string_1 = "SetSpawnPoint";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    Target:InvokeServer(string_1);
                end
            elseif GetQuest.Visible == true then
                if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if AutoFarmLevel and v.Name == Ms and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if string.find(GetQuestTitle.Text, NameMon) then
                                repeat wait()
                                    if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
									spawn(function()
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
									end)
                                    FarmtoTarget = toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
										if FarmtoTarget then FarmtoTarget:Stop() end
                                        Usefastattack = true

                                        EquipWeapon(SelectToolWeapon)
                                        StartMagnetAutoFarmLevel = true
                                        PosMon = v.HumanoidRootPart.CFrame
                                        if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 150 then
                                            game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
                                            game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
                                        end
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                                        Click()
                                    end
                                until not game:GetService("Workspace").Enemies:FindFirstChild(Ms) or not AutoFarmLevel or not string.find(GetQuestTitle.Text, NameMon) or v.Humanoid.Health <= 0 or not v.Parent
                                if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
                                Usefastattack = false
                                StartMagnetAutoFarmLevel = false
                            else
                                game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
                            end
                        end
                    end
                else
                    StartMagnetAutoFarmLevel = false
                    Usefastattack = false
                    if not string.find(GetQuestTitle.Text, NameMon) then game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest"); end
                    Modstween = toTarget(CFrameMon)
                    if OldWorld and (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                    elseif OldWorld and not (Ms == "Fishman Commando [Lv. 400]" or Ms == "Fishman Warrior [Lv. 375]") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
                    elseif NewWorld and string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                    elseif NewWorld and not string.find(Ms, "Ship") and (CFrameQuest.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
                    elseif (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                        if Modstween then Modstween:Stop() end wait(.5)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrameMon
                    end 
                end
            end
        end
    end
end

SuperhumanFull = true
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
	if v:IsA("Tool") then
		v.Parent = game.Players.LocalPlayer.Backpack
	end
end
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") then
	if not game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") then
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") then
			if not game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") then
				if not game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") then
					if not game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
						local args = {
							[1] = "BuyElectro"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
			end
		end
	end
end

AutoRaids = false
spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then 
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
				SelectToolWeapon = "Combat"
                local args = {
                    [1] = "BuyElectro"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
				local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
				local args = {
                    [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
				local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
				local args = {
                    [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300  then
                local args = {
					[1] = "BlackbeardReward",
					[2] = "DragonClaw",
					[3] = "2"
				}
				HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				if SuperhumanFull and game.Players.LocalPlayer.Data.Fragments.Value < 1500 and HaveDragonClaw == 0 then
                    if game.Players.LocalPlayer.Data.Level.Value > 1100 then
						RaidsSelected = "Flame"
						AutoRaids = true
						oldautofarmlvl = AutoFarmLevel
						AutoFarmLevel = false
					end
                else
                    AutoRaids = false
					AutoFarmLevel = oldautofarmlvl
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300  then
                local args = {
					[1] = "BlackbeardReward",
					[2] = "DragonClaw",
					[3] = "2"
				}
				HaveDragonClaw = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				if SuperhumanFull and game.Players.LocalPlayer.Data.Fragments.Value < 1500 and HaveDragonClaw == 0 then
                    if game.Players.LocalPlayer.Data.Level.Value > 1100 then
						RaidsSelected = "Flame"
						AutoRaids = true
						oldautofarmlvl = AutoFarmLevel
						AutoFarmLevel = false
					end
                else
                    AutoRaids = false
					AutoFarmLevel = oldautofarmlvl
                    local args = {
                        [1] = "BlackbeardReward",
                        [2] = "DragonClaw",
                        [3] = "2"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
				local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
				local args = {
                    [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end 

			if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
				SelectToolWeapon = "Combat"
            end

            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") then
                SelectToolWeapon = "Black Leg"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") then
                SelectToolWeapon = "Electro"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") then
                SelectToolWeapon = "Fishman Karate"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                SelectToolWeapon = "Dragon Claw"
            end
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") then
                SelectToolWeapon = "Superhuman"
            end
        end
    end
end)
spawn(function()
    while wait() do
        local args = {
            [1] = "LegendarySwordDealer",
            [2] = "2"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local UpStatus = game.Players.localPlayer.Data.Points.Value or 1
        if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2400 then
            local args = {
                [1] = "AddPoint",
                [2] = "Melee",
                [3] = tonumber(UpStatus)
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        else
            local args = {
                [1] = "AddPoint",
                [2] = "Defense",
                [3] = tonumber(UpStatus)
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
        if setscriptable then
            setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
            game.Players.LocalPlayer.SimulationRadius = math.huge * math.huge, math.huge * math.huge * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0 * 1 / 0
        end
    end
end)
spawn(function()
    while true do game:GetService("RunService").RenderStepped:Wait()
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
			CheckQuest()
            if AutoFarmLevel and v.Name ~= "Ice Admiral [Lv. 700] [Boss]" and v.Name ~= "Don Swan [Lv. 3000] [Boss]" and v.Name ~= "Saber Expert [Lv. 200] [Boss]" and v.Name ~= "Longma [Lv. 2000] [Boss]" and StartMagnetAutoFarmLevel and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
                if syn then
					if isnetworkowner(v.HumanoidRootPart) then
						v.HumanoidRootPart.CFrame = PosMon
						v.Humanoid.JumpPower = 0
						v.Humanoid.WalkSpeed = 0
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(50,50,50)
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
						v.Humanoid:ChangeState(11)
					end
				else
					v.HumanoidRootPart.CFrame = PosMon
					v.Humanoid.JumpPower = 0
					v.Humanoid.WalkSpeed = 0
					v.HumanoidRootPart.CanCollide = false
					v.HumanoidRootPart.Size = Vector3.new(50,50,50)
					if v.Humanoid:FindFirstChild("Animator") then
						v.Humanoid.Animator:Destroy()
					end
					sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  math.huge)
					v.Humanoid:ChangeState(11)
				end	
            end
        end
    end
end)






--return Create
----------------
local window = Create:window()
local Tab1 = window:CreateTab("Main")
local AutoFarmTab = Tab1:CreatePage("AUTOFARM")
AllStatsFarm = AutoFarmTab:Label("AUTOFARM")
StatusBartilo = "Not Finished"


spawn(function()
    while wait() do
        if AutoFarmLevel then
            if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("Candies","Check") then
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main") and not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.Text,"2x ends in") then
                    local args = {
                        [1] = "Candies",
                        [2] = "Buy",
                        [3] = 1,
                        [4] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end
            AllStatsFarm:Refresh("Status : Auto Farm Level Work | Elite Hunter : "..game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        else
            AllStatsFarm:Refresh("Status : Auto Farm Level Not Work | Elite Hunter : "..game.ReplicatedStorage.Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
        end
    end
end)
AutoFarmTab:Toggle("Auto Farm Full", getgenv().Setting["Auto Farm Full"],function(a)
    AutoFarmLevel = a
end)

AutoFarmTab:Toggle("Auto Yama", getgenv().Setting["Auto Yama"],function(a)
    AutoYama = a
end)

AutoFarmTab:Toggle("Fast Attack", getgenv().Setting["Auto Attack"],function(a)
    _G.FastAttack = a

    local Module = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
    local CombatFramework = debug.getupvalues(Module)[2]
    local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
    spawn(function()
        while true do
            if _G.FastAttack then
                pcall(function()
                    CameraShakerR:Stop()
                    CombatFramework.activeController.attacking = false
                    CombatFramework.activeController.timeToNextAttack = 0
                    CombatFramework.activeController.increment = 3
                    CombatFramework.activeController.hitboxMagnitude = 150
                    CombatFramework.activeController.blocking = false
                    CombatFramework.activeController.timeToNextBlock = 0
                    CombatFramework.activeController.focusStart = 0
                    CombatFramework.activeController.humanoid.AutoRotate = true
                end)
            end
            task.wait()
        end
    end)
end)

AutoFarmTab:Toggle("Auto Observation haki", false,function(Value)
    AUTOHAKIObs = Value  
end)



spawn(function()
    while wait() do
        if game.Players.LocalPlayer.Data.Level.Value == 2300 or game.Players.LocalPlayer.Name == "YesIAmNowShutPlease" then

        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if string.find(v.Name,"Fruit") and not UseThireWorld then
                    local FruitName = RemoveSpaces(v.Name)
                    if v.Name == "Bird: Falcon Fruit" then
                        NameFruit = "Bird-Bird: Falcon"
                    elseif v.Name == "Bird: Phoenix Fruit" then
                        NameFruit = "Bird-Bird: Phoenix"
                    elseif v.Name == "Human: Buddha Fruit" then
                        NameFruit = "Human-Human: Buddha"
                    else
                        NameFruit = FruitName.."-"..FruitName
                    end
    
                    local string_1 = "getInventoryFruits";
                    local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                    for i1,v1 in pairs(Target:InvokeServer(string_1)) do
                        if v1.Name == NameFruit then
                            HaveFruitInStore = true
                        end
                    end
                    if not HaveFruitInStore and not AutoRaids then
                        local string_1 = "StoreFruit";
                        local string_2 = NameFruit;
                        local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                        Target:InvokeServer(string_1, string_2);
                    end
                    HaveFruitInStore = false
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        if BringDevilFruit then
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:IsA("Tool") and string.find(v.Name,"Fruit") then wait(60)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)  
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if string.find(v.Name,"Fruit") and not UseThireWorld then
                            local FruitName = RemoveSpaces(v.Name)
                            if v.Name == "Bird: Falcon Fruit" then
                                NameFruit = "Bird-Bird: Falcon"
                            elseif v.Name == "Bird: Phoenix Fruit" then
                                NameFruit = "Bird-Bird: Phoenix"
                            elseif v.Name == "Human: Buddha Fruit" then
                                NameFruit = "Human-Human: Buddha"
                            else
                                NameFruit = FruitName.."-"..FruitName
                            end
            
                            local string_1 = "getInventoryFruits";
                            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                            for i1,v1 in pairs(Target:InvokeServer(string_1)) do
                                if v1.Name == NameFruit then
                                    HaveFruitInStore = true
                                end
                            end
                            if not HaveFruitInStore and not AutoRaids then
                                local string_1 = "StoreFruit";
                                local string_2 = NameFruit;
                                local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
                                Target:InvokeServer(string_1, string_2);
                            end
                            HaveFruitInStore = false
                        end
                    end  
                end
            end
        end 
    end
end)

spawn(function()
    while wait(.1) do
        if game.Players.LocalPlayer.PlayerGui.Main.HP.TextLabel.Text == "Health 100/100" and StatsBypass == "Bypassed" then
            StatsBypass = "NoBypassTP"
        end
        if AUTOHAKI then 
            if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                local args = {
                    [1] = "Buso"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
        if AUTOHAKIObs then 
            if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
            else wait(1)
                game:service('VirtualUser'):CaptureController()
                game:service('VirtualUser'):SetKeyDown('0x65')
                wait(2)
                game:service('VirtualUser'):SetKeyUp('0x65')
            end
        end
    end
end)


local tablefruithave = {}
HaveStore2 =false

for i,v in next,Remote_GetFruits do
    for i1,v1 in pairs(getInventoryFruit) do
        if v.Name == v1.Name then
            HaveStore2 = true
        end
    end
    if HaveStore2 then
        table.insert(tablefruithave,v.Price,v.Name)
    end
    HaveStore2 = false
end


_G.LoadthisFruit = nil
RaidsSelected = "Flame"

spawn(function()
	while wait() do 
		if AutoRaids then
			for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
				if AutoRaids and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
					pcall(function()
						repeat wait()
							v.HumanoidRootPart.Transparency = 0.75
							v.Humanoid.Health = 0
							v:BreakJoints()
						until not AutoRaids or v.Humanoid.Health <= 0 or not v.Parent
					end)
				end
			end
		end	
	end
end)

spawn(function()
    while wait() do
        if AutoRaids then
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
                    
                    if NewWorld then
                        fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                    elseif ThreeWorld then
                        fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                    end
                    wait(17)
                elseif game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then
                    Useraids = true
					if DeleNotify then
						DeleNotify:Delete()
					end
                    pcall(function()
                        repeat wait()
							if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
							elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
								game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame.z)
								if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
									Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame)
								elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
									if Farmtween then
										Farmtween:Stop()
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame
								end
							elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
								game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame.z)
								if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
									Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame)
								elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
									if Farmtween then
										Farmtween:Stop()
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame
								end
							elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
								game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame.z)
								if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
									Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame)
								elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
									if Farmtween then
										Farmtween:Stop()
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame
								end
							elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
								game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame.z)
								if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
									Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame)
								elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
									if Farmtween then
										Farmtween:Stop()
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame
								end
							elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
								game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame.z)
								if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
									Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame)
								elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
									if Farmtween then
										Farmtween:Stop()
									end
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame
								end
							end
                            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                                if AutoRaids and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
                                    pcall(function()
                                        repeat wait()
                                            v.HumanoidRootPart.Transparency = 0.75
                                            v.Humanoid.Health = 0
											v:BreakJoints()
                                        until not AutoRaids or v.Humanoid.Health <= 0 or not v.Parent
                                    end)
                                end
                            end
							local args = {
								[1] = "Awakener",
								[2] = "Check"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							local args = {
								[1] = "Awakener",
								[2] = "Awaken"
							}
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        until AutoRaids == false or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false
                    end)
                end
            else
				local DeleNotify = library:Notification("No Frut To Auto Raids For Buy Dragon Claw\nไม่มีผลลงดันที่จะซื้อDragon Claw")
				spawn(function()
					for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v:IsA("Tool") and string.find(v.Name,"Fruit") then
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)  
							wait(60)
						end
					end
				end)
				for i2,v2 in next,tablefruithave do
					if game.Players.LocalPlayer.Backpack:FindFirstChild(v2) or game.Players.LocalPlayer.Character:FindFirstChild(v2) then
						_G.LoadthisFruit = v2
					end
				end
				if _G.LoadthisFruit ~= nil then
					local args = {
						[1] = "LoadFruit",
						[2] = _G.LoadthisFruit
					}
					
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				local tablefruithave = {}
				HaveStore2 =false

				for i,v in next,Remote_GetFruits do
					for i1,v1 in pairs(getInventoryFruit) do
						if v.Name == v1.Name then
							HaveStore2 = true
						end
					end
					if HaveStore2 then
						table.insert(tablefruithave,v.Price,v.Name)
					end
					HaveStore2 = false
				end
                Useraids = false
                local args = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = RaidsSelected
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				_G.LoadthisFruit = nil
            end
        end
    end
end)

local FrutAwakeken = {
    "Flame-Flame";
    "Ice-Ice";
    "Quake-Quake";
    "Light-Light";
    "Dark-Dark";
    "String-String";
    "Rumble-Rumble";
    "Magma-Magma";
    "Human-Human: Buddha";
}
_G.EatThisFruit = "Notting"
_G.ThisMyFruit = "Not"
_G.NowUEat = false
_G.StopLoop = false
_G.UseThisFruit = "Not"
local YesIHave = false
local YesIHave = false
local function AutoAwakekens()
    if AutoFarmLevel then
        if game.Players.LocalPlayer.Data.Level.Value == 2300 then
            if OldWorld then
                local args = {
                    [1] = "TravelDressrosa" -- OLD WORLD to NEW WORLD
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif NewWorld then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            elseif ThreeWorld then
                spawn(function()
                    if _G.NowUEat == false then
                        for i,v in next,tablefruithave do
                            for i2,v2 in next,FrutAwakeken do
                                if v == v2 then
                                    YesIHave = true
                                end
                            end
                            if YesIHave then
                                if not game.Players.LocalPlayer.Backpack:FindFirstChild(v) or not game.Players.LocalPlayer.Character:FindFirstChild(v) then
                                    _G.EatThisFruit = v
                                    tablefruithave = {}
                                    HaveStore2 =false
                                    local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
                                    for i,v in next,Remote_GetFruits do
                                        for i1,v1 in pairs(getInventoryFruit) do
                                            if v.Name == v1.Name then
                                                HaveStore2 = true
                                            end
                                        end
                                        if HaveStore2 then
                                            table.insert(tablefruithave,v.Price,v.Name)
                                        end
                                        HaveStore2 = false
                                    end
                                end
                            end
                            YesIHave = false
                        end

                        for i2,v2 in next,FrutAwakeken do
							if game.Players.LocalPlayer.Backpack:FindFirstChild(v2) or game.Players.LocalPlayer.Character:FindFirstChild(v2) then
								_G.NowUEat = true
								_G.ThisMyFruit = v2
								_G.EatThisFruit = "Return"
							end
                        end

                        if tostring(_G.EatThisFruit) ~= "Return" then
                            _G.NowUEat = true
                            print("re")
                            return;
                        end

                        if tostring(_G.EatThisFruit) ~= "Notting" then
                            local args = {
                                [1] = "LoadFruit",
                                [2] = _G.EatThisFruit
                            }
                            
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            wait(1)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",tostring(_G.EatThisFruit))
                            _G.NowUEat = true
                        elseif tostring(_G.EatThisFruit) == "Notting" then
                            if _G.StopLoop == false then
                                print("Ws")
                                _G.StopLoop = true
                                local PlaceID = game.PlaceId
                                local AllIDs = {}
                                local foundAnything = ""
                                local actualHour = os.date("!*t").hour
                                local Deleted = false
                                --[[
                                local File = pcall(function()
                                    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                                end)
                                if not File then
                                    table.insert(AllIDs, actualHour)
                                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                end
                                ]]
                                function TPReturner()
                                    local Site;
                                    if foundAnything == "" then
                                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                                    else
                                        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                                    end
                                    local ID = ""
                                    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                                        foundAnything = Site.nextPageCursor
                                    end
                                    local num = 0;
                                    for i,v in pairs(Site.data) do
                                        local Possible = true
                                        ID = tostring(v.id)
                                        if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                            for _,Existing in pairs(AllIDs) do
                                                if num ~= 0 then
                                                    if ID == tostring(Existing) then
                                                        Possible = false
                                                    end
                                                else
                                                    if tonumber(actualHour) ~= tonumber(Existing) then
                                                        local delFile = pcall(function()
                                                            -- delfile("NotSameServers.json")
                                                            AllIDs = {}
                                                            table.insert(AllIDs, actualHour)
                                                        end)
                                                    end
                                                end
                                                num = num + 1
                                            end
                                            if Possible == true then
                                                table.insert(AllIDs, ID)
                                                wait()
                                                pcall(function()
                                                    -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                                    wait()
                                                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                                                end)
                                                wait(4)
                                            end
                                        end
                                    end
                                end

                                function Teleport()
                                    while wait() do
                                        pcall(function()
                                            TPReturner()
                                            if foundAnything ~= "" then
                                                TPReturner()
                                            end
                                        end)
                                    end
                                end

                                Teleport()
                            end
                        end

                    end


                end)

                if _G.NowUEat == true then
                    for i,v in pairs(tablefruithave) do 
                        if tonumber(i) < 1000000 then
                            _G.UseThisFruit = v
                        end
                    end

                    if _G.ThisMyFruit == "Not" then
                        for i2,v2 in next,FrutAwakeken do
							if game.Players.LocalPlayer.Backpack:FindFirstChild(v2) or game.Players.LocalPlayer.Character:FindFirstChild(v2) then
								_G.ThisMyFruit = v2
							end
                        end
                        return;
                    end

                    if _G.ThisMyFruit ~= "Not" or _G.ThisMyFruit ~= nil then
                        if _G.ThisMyFruit ~= "Human-Human: Buddha" then
                            _G.BuyThisRaid = _G.ThisMyFruit:split("-")[1]
                        elseif _G.ThisMyFruit == "Human-Human: Buddha" then
                            _G.BuyThisRaid = "Buddha"
                        end
                    end

                    if (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") == nil) and _G.UseThisFruit ~= "Not" and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        spawn(function()
                            local args = {
                                [1] = "LoadFruit",
                                [2] = _G.UseThisFruit
                            }
                            
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                            wait(.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc", "Select", _G.BuyThisRaid)
                            tablefruithave = {}
                            HaveStore2 =false
                            local Remote_GetFruits = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits");
                            for i,v in next,Remote_GetFruits do
                                for i1,v1 in pairs(getInventoryFruit) do
                                    if v.Name == v1.Name then
                                        HaveStore2 = true
                                    end
                                end
                                if HaveStore2 then
                                    table.insert(tablefruithave,v.Price,v.Name)
                                end
                                HaveStore2 = false
                            end
                        end)
                    elseif (game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") == nil or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") == nil) and _G.UseThisFruit == "Not" and game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                        print("HOP")
                        local PlaceID = game.PlaceId
                        local AllIDs = {}
                        local foundAnything = ""
                        local actualHour = os.date("!*t").hour
                        local Deleted = false
                        --[[
                        local File = pcall(function()
                            AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
                        end)
                        if not File then
                            table.insert(AllIDs, actualHour)
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        end
                        ]]
                        function TPReturner()
                            local Site;
                            if foundAnything == "" then
                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
                            else
                                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
                            end
                            local ID = ""
                            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                                foundAnything = Site.nextPageCursor
                            end
                            local num = 0;
                            for i,v in pairs(Site.data) do
                                local Possible = true
                                ID = tostring(v.id)
                                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                                    for _,Existing in pairs(AllIDs) do
                                        if num ~= 0 then
                                            if ID == tostring(Existing) then
                                                Possible = false
                                            end
                                        else
                                            if tonumber(actualHour) ~= tonumber(Existing) then
                                                local delFile = pcall(function()
                                                    -- delfile("NotSameServers.json")
                                                    AllIDs = {}
                                                    table.insert(AllIDs, actualHour)
                                                end)
                                            end
                                        end
                                        num = num + 1
                                    end
                                    if Possible == true then
                                        table.insert(AllIDs, ID)
                                        wait()
                                        pcall(function()
                                            -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                                            wait()
                                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                                        end)
                                        wait(4)
                                    end
                                end
                            end
                        end

                        function Teleport()
                            while wait() do
                                pcall(function()
                                    TPReturner()
                                    if foundAnything ~= "" then
                                        TPReturner()
                                    end
                                end)
                            end
                        end

                        Teleport()
                        wait(4)
                    end
					if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
						if game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game.Players.LocalPlayer.Character:FindFirstChild("Special Microchip") and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
							
							if NewWorld then
								fireclickdetector(Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
							elseif ThreeWorld then
								fireclickdetector(Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
							end
							wait(17)
						elseif game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == true then							
							pcall(function()
								repeat wait()
									if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false then
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
										game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame.z)
										if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame)
										elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then
												Farmtween:Stop()
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame
										end
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
										game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame.z)
										if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame)
										elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then
												Farmtween:Stop()
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame
										end
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
										game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame.z)
										if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame)
										elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then
												Farmtween:Stop()
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame
										end
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
										game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame.z)
										if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame)
										elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then
												Farmtween:Stop()
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame
										end
									elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
										game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame = CFrame.new(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame.x,60,game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame.z)
										if (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 350 then
											Farmtween = toTarget(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame)
										elseif (game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 350 then
											if Farmtween then
												Farmtween:Stop()
											end
											game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame
										end
									end
									for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
										if AutoAwakeken and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 400 then
											pcall(function()
												repeat wait()
													v.HumanoidRootPart.Transparency = 0.75
													v.Humanoid.Health = 0
												until not AutoAwakeken or v.Humanoid.Health <= 0 or not v.Parent
											end)
										end
									end
									local args = {
										[1] = "Awakener",
										[2] = "Check"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									local args = {
										[1] = "Awakener",
										[2] = "Awaken"
									}
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
								until AutoAwakeken == false or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") or not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") or game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible == false
							end)
						end
					else
						local args = {
							[1] = "RaidsNpc",
							[2] = "Select",
							[3] = RaidsSelected
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
                end
            end
        end
    end
end

_G.HaveYama = false
_G.FruitFullAwake = false
spawn(function()
	for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do 
		if type(v) == "table" then
			for i2,v2 in pairs(v) do 
				if v2 == "Yama" then
					_G.HaveYama = true
				end
			end
		end
	end
	
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
		if v.Name == "Yama" then
			_G.HaveYama = true
		end
	end
	
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
		if v.Name == "Yama" then
			_G.HaveYama = true
		end
	end
end)

function enemyEliteBoss()
	if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") then
		local mobs = game.Workspace.Enemies:GetChildren()
		for i,v in pairs(mobs) do
			if v.Name == "Deandre [Lv. 1750]" or v.Name == "Diablo [Lv. 1750]" or v.Name == "Urban [Lv. 1750]"  and v:IsA("Model") and v:FindFirstChild("Humanoid") and
				v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
				return v
			end
		end
	end
	return game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]")
end

function doyama()
	if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
		fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
		wait(.1)
	else
		if game.Workspace.Enemies:FindFirstChild("Deandre [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Urban [Lv. 1750]") or game.Workspace.Enemies:FindFirstChild("Diablo [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Deandre [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Urban [Lv. 1750]") or game.ReplicatedStorage:FindFirstChild("Diablo [Lv. 1750]") then
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				Usefastattack = false
				repeat 
					MytoTarget(CFrame.new(-5420.49219, 314.446045, -2823.07373)) 
					wait() 
				until not AutoFarmLevel or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-5420.49219, 314.446045, -2823.07373)).Magnitude <= 10
				wait(1.1)
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
				wait(1)
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				CheckQuest()
				pcall(function()
					EquipWeapon(SelectToolWeapon)
					pcall(function()
						local v = enemyEliteBoss()
						v.HumanoidRootPart.CanCollide = false
						v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
						Usefastattack = true
						Click()
						MytoTarget(v.HumanoidRootPart.CFrame * CFrame.new(1,20,1)) 
					end)
				end)
			end
		else
			Usefastattack = false
			function TPReturner()
				local Site;
				if foundAnything == "" then
					Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
				else
					Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
				end
				local ID = ""
				if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
					foundAnything = Site.nextPageCursor
				end
				local num = 0;
				for i,v in pairs(Site.data) do
					local Possible = true
					ID = tostring(v.id)
					if tonumber(v.maxPlayers) > tonumber(v.playing) then
						for _,Existing in pairs(AllIDs) do
							if num ~= 0 then
								if ID == tostring(Existing) then
									Possible = false
								end
							else
								if tonumber(actualHour) ~= tonumber(Existing) then
									local delFile = pcall(function()
										-- delfile("NotSameServers.json")
										AllIDs = {}
										table.insert(AllIDs, actualHour)
									end)
								end
							end
							num = num + 1
						end
						if Possible == true then
							table.insert(AllIDs, ID)
							wait()
							pcall(function()
								-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
								wait()
								game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
							end)
							wait(4)
						end
					end
				end
			end

			function Teleport()
				while wait() do
					pcall(function()
						TPReturner()
						if foundAnything ~= "" then
							TPReturner()
						end
					end)
				end
			end

			Teleport()
			wait(4)
		end
	end
end

spawn(function()
    while wait() do
        CheckQuest()
        if AutoFarmLevel then
            if _G.HaveYama == false and _G.FruitFullAwake == true and game.Players.LocalPlayer.Data.Level.Value == 2300 and AutoYama then
				doyama()
			elseif _G.FruitFullAwake == false and game.Players.LocalPlayer.Data.Level.Value == 2300 and AutoAwakeken then
				AutoAwakekens()
			else
				AutoFarm()
			end
        end
    end
end)


AutoFarmTab:Button("Redeem All Code",function()
    function UseCode(Text)
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
    end
    UseCode("SUB2GAMERROBOT_EXP1")
    UseCode("StrawHatMaine")
    UseCode("Sub2OfficialNoobie")
    UseCode("FUDD10")
    UseCode("BIGNEWS")
    UseCode("THEGREATACE")
    UseCode("SUB2NOOBMASTER123")
    UseCode("Sub2Daigrock")
    UseCode("Axiore")
    UseCode("TantaiGaming")
    UseCode("STRAWHATMAINE")
end)





local Tab1 = window:CreateTab("Shop")
local ShopTab = Tab1:CreatePage("Shop")

ShopTab:Label("Abilities",true)
ShopTab:Button("Skyjump [ $10,000 Beli ]",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Geppo"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:Button("Buso Haki [ $25,000 Beli ]",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Buso"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:Button("Observation haki [ $750,000 Beli ]",function()
    local args = {
        [1] = "KenTalk",
        [2] = "Buy"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:Button("Soru [ $100,000 Beli ]",function()
    local args = {
        [1] = "BuyHaki",
        [2] = "Soru"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
ShopTab:Button("Buy Random Devil Fruit",function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end)



local Tab1 = window:CreateTab("Teleport")
local Teleport = Tab1:CreatePage("Teleport")


Plr = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Plr,v.Name) 
end
local Dropdown = Teleport:Dropdown("Select Player!", Plr,"0", function(t)
   PlayerTP = t
end)

Teleport:Button("Click To TP", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[PlayerTP].Character.HumanoidRootPart.CFrame
end)
Teleport:Toggle("Auto Tp", function(t)
_G.TPPlayer = t
while _G.TPPlayer do wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[PlayerTP].Character.HumanoidRootPart.CFrame
end
end)

Teleport:Button("Refresh Dropdown", function()
    Dropdown:Refresh(Plr)
end)
-----------------------


local Tab1 = window:CreateTab("Misc")
local Misc = Tab1:CreatePage("Misc")

Misc:Button("Server Hop",function()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end)

Misc:Button("Teleport To Sea 1" ,function()
    local args = {
        [1] = "TravelMain" -- OLD WORLD to NEW WORLD
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)
Misc:Button("Teleport To Sea 2" ,function()
    local args = {
        [1] = "TravelDressrosa" -- NEW WORLD to OLD WORLD
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

Misc:Button("Teleport To Sea 3" ,function()
    local args = {
        [1] = "TravelZou" -- OLD WORLD to NEW WORLD
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)