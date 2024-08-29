local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 20)
FrameCorner.Parent = Frame

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(150, 150, 150)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
   ScreenGui:Destroy()
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Text = "⭐星云卡密系统☁"
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(1, 0, 0, 30)
Instructions.Position = UDim2.new(0, 0, 0.2, 0)
Instructions.Text = "星云Q群834451572\n卡密在群公告获取"
Instructions.TextSize = 13
Instructions.TextColor3 = Color3.fromRGB(150, 150, 150)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0.2, -10)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.PlaceholderText = "请输入你的卡密"
TextBox.Text = ""
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = Frame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 10)
TextBoxCorner.Parent = TextBox

local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.6, 0, 0.15, 0)
GetKey.Position = UDim2.new(0.2, 0, 0.7, 0)
GetKey.BackgroundColor3 = Color3.fromRGB(54, 181, 0)
GetKey.Text = "检查卡密"
GetKey.TextSize = 18
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.Parent = Frame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 10)
GetKeyCorner.Parent = GetKey

GetKey.MouseButton1Click:Connect(function()
    if TextBox.Text=="XYXV2" then
    ScreenGui:Destroy()
    game.StarterGui:SetCore("SendNotification",{Title="卡密系统",Text="卡密校验成功",Icon="rbxassetid://15512382151"})
    game.StarterGui:SetCore("SendNotification",{Title="卡密系统",Text="正在初始",Icon="rbxassetid://15512382151"})
        game.StarterGui:SetCore("SendNotification",{Title="卡密系统",Text="正在为您加载星云脚本V2",Icon="rbxassetid://15512382151"})

msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-欢迎使用星云脚本V2-"
wait(2)
msg:remove()
wait(2)

msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-永久免费，持续更新-"
wait(5)
msg:remove()
wait(5)

------
if game.PlaceId == 6516141723 then --doors
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开DOORS-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://rentry.co/XY_DOORS/raw"))()
------
elseif game.PlaceId == 4618049391 then
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开河北唐县-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://rentry.co/XY_HBTX/raw"))()
------
elseif game.PlaceId == 7239319209 then
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开俄亥俄州-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://raw.githubusercontent.com/XYdss/OHIO/main/Ohio.lua"))()
------
elseif game.PlaceId == 13772394625 then
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开刀刃球-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://rentry.co/XY_DRQ/raw"))()
-----
elseif game.PlaceId == 5256165620 then
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开火箭发射模拟器-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://rentry.co/XY_HJ/raw"))()
-----
elseif game.PlaceId == 3623096087 then
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开力量传奇-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://rentry.co/XY_LL/raw"))()
-----
elseif game.PlaceId == 13822889 then
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开伐木大亨-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://rentry.co/XY_FM2/raw"))()
-----
else---通用
msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "-正在打开通用功能-"
wait(2)
msg:remove()
wait(2)
loadstring(game:HttpGet("https://rentry.co/XY_player/raw"))()
end
    else
    game.StarterGui:SetCore("SendNotification",{Title="卡密系统",Text="卡密错误",Icon="rbxassetid://15512382151"})
        --错误
    end
end)