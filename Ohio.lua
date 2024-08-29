repeat
    task.wait()
until game:IsLoaded()
local REN = {}
local REN = {
    ["限免"] = false,
    ["lp"] = game.Players.LocalPlayer,
    ["游戏名"] = tostring(game.Players.LocalPlayer.Character),
    ["游戏名2"] = game.Players.LocalPlayer.Name,

    ["拓展表"] = {
        ["传送到玩家身边"] = {
            playernamedied = nil,
            dropdown = {}
        }
    },
    ["白名单"] = {
        ["开发者白名单"] = {
            ["状态"] = false,
            ["用户名"] = {"cn_yinchaoji001"}
        },
        ["普通白名单"] = {
            ["状态"] = false,
            ["用户名"] = {"cn_yinchaoji001"}
        }
    }
};

if REN["游戏名"] == REN["游戏名2"] then
else
    game.Players.LocalPlayer:Kick("请到834451572获取最新脚本")
end

table.foreach(REN["白名单"]["开发者白名单"]["用户名"], function(i, name)
    if name == REN["游戏名"] then
        REN["白名单"]["开发者白名单"]["状态"] = false
    end
end)

table.foreach(REN["白名单"]["普通白名单"]["用户名"], function(i, name)
    if name == REN["游戏名"] then
        REN["白名单"]["普通白名单"]["状态"] = false
    end
end)

notify = function(...)
    local Args = {...}
    local CoreGui = game:GetService("StarterGui")
    CoreGui:SetCore("SendNotification", {
        Title = "" .. Args[1] .. "",
        Text = "" .. Args[2] .. "",
        Duration = "" .. Args[3] .. ""
    })
end
local Signals = require(game:GetService("ReplicatedStorage")["devv"].client.Helpers.remotes.Signal)
local Remotes = debug.getupvalue(Signals.FireServer, 1)
function scripts()
    local LBLG = Instance.new("ScreenGui", getParent)
    local LBL = Instance.new("TextLabel", getParent)
    local player = game.Players.LocalPlayer
    LBLG.Name = "LBLG"
    LBLG.Parent = game.CoreGui
    LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    LBLG.Enabled = true
    LBL.Name = "LBL"
    LBL.Parent = LBLG
    LBL.BackgroundColor3 = Color3.new(1, 1, 1)
    LBL.BackgroundTransparency = 1
    LBL.BorderColor3 = Color3.new(0, 0, 0)
    LBL.Position = UDim2.new(0.75, 0, 0.010, 0)
    LBL.Size = UDim2.new(0, 133, 0, 30)
    LBL.Font = Enum.Font.GothamSemibold
    LBL.Text = "TextLabel"
    LBL.TextColor3 = Color3.new(1, 1, 1)
    LBL.TextScaled = true
    LBL.TextSize = 14
    LBL.TextWrapped = true
    LBL.Visible = true
    local FpsLabel = LBL
    local Heartbeat = game:GetService("RunService").Heartbeat
    local LastIteration, Start
    local FrameUpdateTable = {}
    local function HeartbeatUpdate()
        LastIteration = tick()
        for Index = #FrameUpdateTable, 1, -1 do
            FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or
                                              nil
        end
        FrameUpdateTable[1] = LastIteration
        local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
        CurrentFPS = CurrentFPS - CurrentFPS % 1
        FpsLabel.Text = ("当前时间:" .. os.date("%H") .. "时" .. os.date("%M") .. "分" .. os.date("%S"))
    end
    Start = tick()
    Heartbeat:Connect(HeartbeatUpdate)
    local library = loadstring(game:HttpGet("https://pastebin.com/raw/S3mZSc6J", true))()
    local window = library:new("星云V2")
    local main = window:Tab("公告", "17261153594")
    local GG = main:section("公告内容", true)
    GG:Label("注入器:" .. identifyexecutor())
    GG:Label("服务器ID:" .. game.GameId .. " ")
    GG:Label("用户名:" .. game.Players.LocalPlayer.Name .. " ")
    GG:Label("作者：斩星")
    local main = window:Tab("玩家", "17261153594")
    local Player = main:section("玩家", false)
    function tp(p)
        game.Players.LocalPlayer.Character:PivotTo(p)
    end
    function shuaxinlb(zji)
        REN["拓展表"]["传送到玩家身边"].dropdown = {}
        if zji == true then
            for p, I in next, game.Players:GetChildren() do
                table.insert(REN["拓展表"]["传送到玩家身边"].dropdown, I.Name)
            end
        else
            for p, I in next, game.Players:GetChildren() do
                if I ~= lp then
                    table.insert(REN["拓展表"]["传送到玩家身边"].dropdown, I.Name)
                end
            end
        end
    end
    shuaxinlb(true)
    local dropdown = Player:Dropdown("选择玩家名称", 'Dropdown',
        REN["拓展表"]["传送到玩家身边"].dropdown, function(v)
            REN["拓展表"]["传送到玩家身边"].playernamedied = v
        end)
    Player:Button("刷新列表", function()
        while true do
            wait(1)

            shuaxinlb(true)
            dropdown:SetOptions(REN["拓展表"]["传送到玩家身边"].dropdown)

        end
    end)
    Player:Button("传送该玩家", function()
        tp(game:GetService("Players")[REN["拓展表"]["传送到玩家身边"].playernamedied].Character
               .HumanoidRootPart.CFrame + Vector3.new(0, 3, 0))
    end)
    Player:Toggle("持续追踪该玩家", "", false, function(v)
        zhuizong = v
        if zhuizong then
            pcall(function()
                while true do
                    wait(0.1)
                    tp(game:GetService("Players")[REN["拓展表"]["传送到玩家身边"].playernamedied].Character
                           .HumanoidRootPart.CFrame + Vector3.new(0, 0, 2))
                end
            end)
        end
    end)
    Player:Slider('设置速度', 'Sliderflag', 16, 16, 200, false, function(Value)
        local plr = game['Players ']
        local lp = plr.LocalPlayer
        local cha = lp.Character
        local hum = cha.Humanoid
        spawn(function()
            while task.wait() do
                hum.WalkSpeed = Value
            end
        end)
    end)
    Player:Slider('缩放距离', 'ZOOOOOM OUT!',  128, 128, 200000,false, function(value)
    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = value
    end)
    Player:Slider('设置重力（正常196.2）', 'Sliderflag', 196.2, 0.1, 1000,false, function(Value)
    game.Workspace.Gravity = Value
    end)
    Player:Slider('视界（正常70）', 'Sliderflag', 70, 0.1, 250, false, function(v)
        game.Workspace.CurrentCamera.FieldOfView = v
    end)
    Player:Toggle("连跳", "", false, function(Value)
        Jump = Value
        game.UserInputService.JumpRequest:Connect(function()
            if Jump then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
            end
        end)
    end)
    Player:Toggle("穿墙", "", false, function(Value)
        if Value then
            Noclip = true
            Stepped = game.RunService.Stepped:Connect(function()
                if Noclip == true then
                    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                else
                    Stepped:Disconnect()
                end
            end)
        else
            Noclip = false
        end
    end)
    Player:Button("调用", function()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F9", false, game)
    end)
    Player:Button("小范围", function()
        _G.HeadSize = 20
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
            if _G.Disabled then
                for i, v in next, game:GetService('Players'):GetPlayers() do
                    if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                        pcall(function()
                            v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            v.Character.HumanoidRootPart.Transparency = 0.7
                            v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really Greed")
                            v.Character.HumanoidRootPart.Material = "Neon"
                            v.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    end)
    Player:Button(
    "旋转(会封)",
    function()
    local speed = 50

local plr = game:GetService("Players").LocalPlayer
repeat task.wait() until plr.Character
local humRoot = plr.Character:WaitForChild("HumanoidRootPart")
plr.Character:WaitForChild("Humanoid").AutoRotate = false
local velocity = Instance.new("AngularVelocity")
velocity.Attachment0 = humRoot:WaitForChild("RootAttachment")
velocity.MaxTorque = math.huge
velocity.AngularVelocity = Vector3.new(0, speed, 0)
velocity.Parent = humRoot
velocity.Name = "Spinbot"
    end)
    Player:Button(
    "飞行脚本可隐藏(会封)",
    function()
        local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163, 255, 137)
Frame.BorderColor3 = Color3.fromRGB(103, 221, 213)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 190, 0, 57)
Frame.BackgroundTransparency = 0.5  -- 设置透明度

up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79, 255, 152)
up.Size = UDim2.new(0, 44, 0, 28)
up.Font = Enum.Font.SourceSans
up.Text = "⬆️"
up.TextColor3 = Color3.fromRGB(0, 0, 0)
up.TextSize = 14.000
up.BackgroundTransparency = 0.5  -- 设置透明度

down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215, 255, 121)
down.Position = UDim2.new(0, 0, 0.491228074, 0)
down.Size = UDim2.new(0, 44, 0, 28)
down.Font = Enum.Font.SourceSans
down.Text = "⬇️"
down.TextColor3 = Color3.fromRGB(0, 0, 0)
down.TextSize = 14.000
down.BackgroundTransparency = 0.5  -- 设置透明度

onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255, 249, 74)
onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)
onof.Size = UDim2.new(0, 56, 0, 28)
onof.Font = Enum.Font.SourceSans
onof.Text = "飞行"
onof.TextColor3 = Color3.fromRGB(0, 0, 0)
onof.TextSize = 14.000
onof.BackgroundTransparency = 0.5  -- 设置透明度

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242, 60, 255)
TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 100, 0, 28)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "飞行_XY"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.BackgroundTransparency = 0.5  -- 设置透明度

plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133, 145, 255)
plus.Position = UDim2.new(0.231578946, 0, 0, 0)
plus.Size = UDim2.new(0, 45, 0, 28)
plus.Font = Enum.Font.SourceSans
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(0, 0, 0)
plus.TextScaled = true
plus.TextSize = 14.000
plus.TextWrapped = true
plus.BackgroundTransparency = 0.5  -- 设置透明度

speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255, 85, 0)
speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)
speed.Size = UDim2.new(0, 44, 0, 28)
speed.Font = Enum.Font.SourceSans
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(0, 0, 0)
speed.TextScaled = true
speed.TextSize = 14.000
speed.TextWrapped = true
speed.BackgroundTransparency = 0.5  -- 设置透明度

mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123, 255, 247)
mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)
mine.Size = UDim2.new(0, 45, 0, 29)
mine.Font = Enum.Font.SourceSans
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(0, 0, 0)
mine.TextScaled = true
mine.TextSize = 14.000
mine.TextWrapped = true
mine.BackgroundTransparency = 0.5  -- 设置透明度

closebutton.Name = "Close"
closebutton.Parent = main.Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225, 25, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, -1, 27)
closebutton.BackgroundTransparency = 0.5  -- 设置透明度

mini.Name = "minimize"
mini.Parent = main.Frame
mini.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini.Font = "SourceSans"
mini.Size = UDim2.new(0, 45, 0, 28)
mini.Text = "-"
mini.TextSize = 40
mini.Position = UDim2.new(0, 44, -1, 27)
mini.BackgroundTransparency = 0.5  -- 设置透明度

mini2.Name = "minimize2"
mini2.Parent = main.Frame
mini2.BackgroundColor3 = Color3.fromRGB(192, 150, 230)
mini2.Font = "SourceSans"
mini2.Size = UDim2.new(0, 45, 0, 28)
mini2.Text = "+"
mini2.TextSize = 40
mini2.Position = UDim2.new(0, 44, -1, 57)
mini2.Visible = false
mini2.BackgroundTransparency = 0.5  -- 设置透明度

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false

game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "飞行";
	Text = "XY";
	Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})
Duration = 5;

Frame.Active = true -- main = gui
Frame.Draggable = true

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true

		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = '不能小于1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible = false
	down.Visible = false
	onof.Visible = false
	plus.Visible = false
	speed.Visible = false
	mine.Visible = false
	mini.Visible = false
	mini2.Visible = true
	main.Frame.BackgroundTransparency = 0.5
	closebutton.Position =  UDim2.new(0, 0, -1, 57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible = true
	down.Visible = true
	onof.Visible = true
	plus.Visible = true
	speed.Visible = true
	mine.Visible = true
	mini.Visible = true
	mini2.Visible = false
	main.Frame.BackgroundTransparency = 0 
	closebutton.Position =  UDim2.new(0, 0, -1, 27)
end)
    end
)
wait(1)
Player:Button(
    "中级范围",
    function()
        _G.HeadSize = 100
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
    end
)
Player:Button(
    "高级范围",
    function()
        _G.HeadSize = 500
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
    end
)
Player:Toggle('上帝模式', 'No Description', false, function(Value)
        if Value then
            local LP = game:GetService"Players".LocalPlayer
            local HRP = LP.Character.HumanoidRootPart
            local Clone = HRP:Clone()
            Clone.Parent = LP.Character
        else
            game.Players.LocalPlayer.Character.Head:Destroy()
        end
    end)

Player:Button(
    "自杀",
    function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
)
Player:Button(
    "工具包",
    function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
)
Player:Button(
    "F3X",
    function()
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
    end)
Player:Button(
    "键盘⌨️",
    function()
        loadstring(
            game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true)
        )()
    end
)



Player:Toggle(
    "夜视",
    "text",
    false,
    function(Value)
        if Value then
            game.Lighting.Ambient = Color3.new(1, 1, 1)
        else
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
)
    
    local main = window:Tab("俄亥俄州", "17261153594")
    local ehez = main:section("俄亥俄州", false)
    ehez:Label("功能全部有效 不会封禁物品栏功能")
    ehez:Toggle("自动捡现金(服务器刷新现金自动传送拾取)", "", false, function(v)
        ItemFarm = v
        if ItemFarm then
            pcall(function()
                local plr = game['Players ']
                local lp = plr.LocalPlayer
                local cha = lp.Character
                local hum = cha.Humanoid
                local humd = cha.HumanoidRootPart
                local function tp(pos)
                    humd.CFrame = pos
                end
                local function getprandde(newpart)
                    local part, del
                    for i, v in next, newpart:GetDescendants() do
                        if v.ClassName == 'ClickDetector' then
                            del = v
                        elseif v.ClassName == 'Part' then
                            part = v
                        end
                    end
                    return part, del
                end
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                wait(1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
                local function getitem(item)
                    local part, delic = getprandde(item)
                    if part then
                        local count = 0
                        tp(part.CFrame + Vector3.new(0, 5, 0))
                        repeat
                            task.wait(.2)
                            count = count + 1
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                            wait(1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                        until item.Parent == nil or count > 1
                        task.wait()
                    end
                end
                while true do
                    wait(0.3)
                    for i, v in next, workspace.Game.Entities.CashBundle:GetChildren() do
                        if v:FindFirstChildOfClass('Part', true).Size == Vector3.new(2, 0.2499999850988388, 1) then
                            getitem(v)
                            task.wait()
                        end
                    end
                end
            end)
        end
    end)
    ehez:Toggle("自动抢银行(服务器刷新银行自动传送)", "", false, function(v)
        cailiao = v
        if cailiao then
            local gem = Game.Workspace.GemRobbery:FindFirstChild("Rubble") -- 查找
            if gem == false then

            else
                game.Workspace.BankRobbery.VaultDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                local epoh4 = CFrame.new(1075.6588, 8.2661, -344.9450)
                local epoh5 = game:GetService("Players")
                local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
                epoh6.CFrame = epoh4
                wait(1)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                wait(3)
                game.Workspace.BankRobbery.VaultDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
                local epoh4 = CFrame.new(1058, 8.76, -343)
                local epoh5 = game:GetService("Players")
                local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
                epoh6.CFrame = epoh4
                wait(0.5)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            end
        end
        isVisible = not isVisible
    end)
    ehez:Toggle("远程黑市", "", false, function(v)
        game.Workspace.BlackMarket.Dealer.Dealer.ProximityPrompt.HoldDuration = 0
        heishi = v
        if heishi then
            game.Workspace.BlackMarket.Dealer.Dealer.ProximityPrompt.MaxActivationDistance = 10000
        else
            game.Workspace.BlackMarket.Dealer.Dealer.ProximityPrompt.MaxActivationDistance = 20
        end
        isVisible = not isVisible
    end)
    ehez:Toggle("自动寻找ATM", "", false, function(v)
        ATMD = v
        if ATMD then
            pcall(function()
                while true do
                    wait(1)
                    local VirtualInputManager = game:GetService('VirtualInputManager')
                    local vi = game:service 'VirtualInputManager'
                    for i, v in pairs(game:GetService("Workspace").Game.Props.ATM:GetChildren()) do
                        if v:IsA("Model") and v.Name == "ATM" and v:GetAttribute("state") ~= "destroyed" then
                            task.spawn(function()
                                while v:GetAttribute("state") ~= "destroyed" do
                                    task.wait()
                                    pcall(function()
                                        for i, v in pairs(
                                            game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
                                            local mp = v:FindFirstChildOfClass("Part")
                                            local distance =
                                                (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                                    mp.Position).magnitude

                                            if distance <= 15 then
                                                fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
                                            end
                                        end
                                    end)
                                end
                            end)

                            repeat
                                task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame *
                                                                                                 CFrame.new(0, -3, -1) *
                                                                                                 CFrame.Angles(
                                        math.rad(90), 0, 0)
                                vi:SendMouseButtonEvent(500, 500, 0, true, game, 1)
                                task.wait()
                                vi:SendMouseButtonEvent(500, 500, 0, false, game, 1)
                            until v:GetAttribute("state") == "destroyed" or AutoRobATM == false

                            pcall(function()
                                for i, v in pairs(game:GetService("Workspace").Game.Entities.CashBundle:GetChildren()) do
                                    local mp = v:FindFirstChildOfClass("Part")
                                    local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position -
                                                         mp.Position).magnitude

                                    if distance <= 15 then
                                        fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
                                    end
                                end
                            end)
                            task.wait()
                        end
                    end
                end
            end)
        else
            fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
        end
    end)

    ehez:Toggle("自动收集材料(服务器刷新材料自动传送拾取)", "", false, function(v)
        cailiao = v
        if cailiao then
            local plr = game['Players ']
            local lp = plr.LocalPlayer
            local cha = lp.Character
            local hum = cha.Humanoid
            local humd = cha.HumanoidRootPart
            local function tp(pos)
                humd.CFrame = pos
            end
            local function getprandde(newpart)
                local part, del
                for i, v in next, newpart:GetDescendants() do
                    if v.ClassName == 'ClickDetector' then
                        del = v
                    elseif v.ClassName == 'Part' then
                        part = v
                    end
                end
                return part, del
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            local function getitem(item)
                local part, delic = getprandde(item)
                if part then
                    local count = 0
                    tp(part.CFrame + Vector3.new(0, 5, 0))
                    repeat
                        task.wait(.2)
                        count = count + 1
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    until item.Parent == nil or count > 10
                    task.wait()
                end
            end
            while true do
                wait(0.3)
                for i, v in next, workspace.Game.Entities.ItemPickup:GetChildren() do
                    if v:FindFirstChildOfClass('Part', true).Size ==
                        Vector3.new(1.6915349960327148, 1.2492635250091553, 1.6076074838638306) then
                        getitem(v)
                        task.wait()
                    end
                end
            end
        end
        isVisible = not isVisible
    end)
    ehez:Toggle("范围杀人", "", false, function(state)
        spawn(function(...)
            while task.wait() do
                if not state then
                    break
                end
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= game:GetService('Players').LocalPlayer and v.Character and
                        v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") then
                        pcall(function()
                            if game:GetService('Players').LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart
                                                                                                .Position) < 50 then -- 距离这个数字
                                local Hit = {
                                    ["meleeType"] = "meleemegapunch",
                                    ["hitPlayerId"] = v.UserId
                                }
                                Remotes["meleeItemHit"]:FireServer("player", Hit)
                            end
                        end)

                    end
                end
            end
        end)

    end)
    ehez:Toggle("范围踩人", "", false, function(state)
        spawn(function(...)
            while task.wait() do
                if not state then
                    break
                end
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    pcall(function(...)
                        if v ~= game:GetService('Players').LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid").Health <= 35 then
                            if game:GetService('Players').LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart
                                                                                                .Position) < 50 then
                                local args = {
                                    [1] = v
                                }

                                Remotes['stomp']:FireServer(unpack(args))
                            end

                        end
                    end)

                end
            end
        end)

    end)
    ehez:Toggle("自动收集红卡(服务器刷新红卡自动传送拾取)", "", false, function(v)
        hongka = v
        if hongka then
            local plr = game['Players ']
            local lp = plr.LocalPlayer
            local cha = lp.Character
            local hum = cha.Humanoid
            local humd = cha.HumanoidRootPart
            local function tp(pos)
                humd.CFrame = pos
            end
            local function getprandde(newpart)
                local part, del
                for i, v in next, newpart:GetDescendants() do
                    if v.ClassName == 'ClickDetector' then
                        del = v
                    elseif v.ClassName == 'Part' then
                        part = v
                    end
                end
                return part, del
            end
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
            wait(1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
            local function getitem(item)
                local part, delic = getprandde(item)
                if part then
                    local count = 0
                    tp(part.CFrame + Vector3.new(0, 5, 0))
                    repeat
                        task.wait(.2)
                        count = count + 1
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    until item.Parent == nil or count > 10
                    task.wait()
                end
            end
            while true do
                wait(0.3)
                for i, v in next, workspace.Game.Entities.ItemPickup:GetChildren() do
                    if v:FindFirstChildOfClass('Part', true).Size ==
                        Vector3.new(1.107336401939392, 0.6025508642196655, 0.05000000074505806) then
                        getitem(v)
                        task.wait()
                    end
                end
            end
        end
        isVisible = not isVisible
    end)
    ehez:Toggle("自动收集印钞机(服务器刷新印钞机自动传送拾取)", "", false, function(v)
        yinchao = v
        if yinchao then
            local LBLG = Instance.new("ScreenGui", getParent)
            local LBL = Instance.new("TextLabel", getParent)
            local player = game.Players.LocalPlayer
            LBLG.Name = "LBLG"
            LBLG.Parent = game.CoreGui
            LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            LBLG.Enabled = true
            LBL.Name = "LBL"
            LBL.Parent = LBLG
            LBL.BackgroundColor3 = Color3.new(1, 1, 1)
            LBL.BackgroundTransparency = 1
            LBL.BorderColor3 = Color3.new(0, 0, 0)
            LBL.Position = UDim2.new(1, 0, 1, 0)
            LBL.Size = UDim2.new(0, 200, 0, 50)
            LBL.Font = Enum.Font.GothamSemibold
            LBL.Text = "TextLabel"
            LBL.TextColor3 = Color3.new(1, 1, 1)
            LBL.TextScaled = true
            LBL.TextSize = 14
            LBL.TextWrapped = true
            LBL.Visible = true
            local FpsLabel = LBL
            local Heartbeat = game:GetService("RunService").Heartbeat
            local LastIteration, Start
            local FrameUpdateTable = {}
            local function HeartbeatUpdate()
                LastIteration = tick()
                for Index = #FrameUpdateTable, 1, -1 do
                    FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and
                                                      FrameUpdateTable[Index] or nil
                end
                FrameUpdateTable[1] = LastIteration
                local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
                CurrentFPS = CurrentFPS - CurrentFPS % 1
                FpsLabel.Text = ("咸鱼_XY捡印钞机 水印 防倒卖")
            end
            Start = tick()
            Heartbeat:Connect(HeartbeatUpdate)
            local plr = game['Players ']
            local lp = plr.LocalPlayer
            local cha = lp.Character
            local hum = cha.Humanoid
            local humd = cha.HumanoidRootPart
            local function tp(pos)
                humd.CFrame = pos
            end
            local function getprandde(newpart)
                local part, del
                for i, v in next, newpart:GetDescendants() do
                    if v.ClassName == 'ClickDetector' then
                        del = v
                    elseif v.ClassName == 'Part' then
                        part = v
                    end
                end
                return part, del
            end
            local function getitem(item)
                local part, delic = getprandde(item)
                if part then
                    local count = 0
                    tp(part.CFrame + Vector3.new(0, 2, 0))
                    repeat
                        task.wait(.2)
                        count = count + 1
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    until item.Parent == nil or count > 10
                    task.wait()
                end
            end
            for i, v in next, workspace.Game.Entities.ItemPickup:GetChildren() do
                if v:FindFirstChildOfClass('Part', true).Size ==
                    Vector3.new(2.684725046157837, 2.196493148803711, 2.5559489727020264) then
                    getitem(v)
                    task.wait()
                end
            end
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "咸鱼_XY",
                Text = "自动更换服务器需购买咸鱼高级版",
                Duration = math.huge

            })
        end
        isVisible = not isVisible
    end)
    ehez:Button("秒开空投", function()
        local safe = game.workspace.Game.Airdrops.Airdrop
        safe.Airdrop.ProximityPrompt.HoldDuration = 0
    end)
    ehez:Button("远程保险", function()
        game:GetService("Players").LocalPlayer.PlayerGui.Backpack.Holder.Locker.Visible = true
    end)
    ehez:Button("预判自瞄(因为不可抗拒因素 部分注入器范围全覆盖例如：FL)", function()
        local CheckIfJumped = true
        if CheckIfJumped == true then
            if AimlockTarget and AimlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().AimPart = "HumanoidRootPart"
            else
                getgenv().AimPart = getgenv().OldAimPart
            end
        end
        local CheckIfJumped = true
        local fov = 100
        local smoothness = 2
        local crosshairDistance = 1
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Players = game:GetService("Players")
        local Cam = game.Workspace.CurrentCamera
        local FOVring = Drawing.new("Circle")
        FOVring.Visible = true
        FOVring.Thickness = 2
        FOVring.Color = Color3.fromRGB()
        FOVring.Filled = false
        FOVring.Radius = fov
        FOVring.Position = Cam.ViewportSize / 2
        local Player = Players.LocalPlayer
        local PlayerGui = Player:WaitForChild("PlayerGui")
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "FovAdjustGui"
        ScreenGui.Parent = PlayerGui
        local Frame = Instance.new("Frame")
        Frame.Name = "MainFrame"
        Frame.BackgroundColor3 = Color3.fromRGB(180, 128, 64)
        Frame.BorderColor3 = Color3.fromRGB(66, 185, 131)
        Frame.BorderSizePixel = 2
        Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
        Frame.Size = UDim2.new(0.4, 0, 0.4, 0)
        Frame.Active = true
        Frame.Draggable = true
        Frame.Parent = ScreenGui
        local MinimizeButton = Instance.new("TextButton")
        MinimizeButton.Name = "MinimizeButton"
        MinimizeButton.Text = "缩小"
        MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(180, 128, 64)
        MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
        MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
        MinimizeButton.Parent = Frame
        local isMinimized = false
        MinimizeButton.MouseButton1Click:Connect(function()
            isMinimized = not isMinimized
            if isMinimized then
                Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
                MinimizeButton.Text = "放大"
            else
                Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
                MinimizeButton.Text = "缩小"
            end
        end)
        local FovLabel = Instance.new("TextLabel")
        FovLabel.Name = "FovLabel"
        FovLabel.Text = "范围"
        FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        FovLabel.BackgroundTransparency = 1
        FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
        FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
        FovLabel.Parent = Frame
        local FovSlider = Instance.new("TextBox")
        FovSlider.Name = "FovSlider"
        FovSlider.Text = tostring(fov)
        FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        FovSlider.BackgroundColor3 = Color3.fromRGB(180, 128, 64)
        FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
        FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
        FovSlider.Parent = Frame
        local SmoothnessLabel = Instance.new("TextLabel")
        SmoothnessLabel.Name = "SmoothnessLabel"
        SmoothnessLabel.Text = "平滑度"
        SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        SmoothnessLabel.BackgroundTransparency = 1
        SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
        SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
        SmoothnessLabel.Parent = Frame
        local SmoothnessSlider = Instance.new("TextBox")
        SmoothnessSlider.Name = "SmoothnessSlider"
        SmoothnessSlider.Text = tostring(smoothness)
        SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(180, 128, 64)
        SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0)
        SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
        SmoothnessSlider.Parent = Frame
        local CrosshairDistanceLabel = Instance.new("TextLabel")
        CrosshairDistanceLabel.Name = "CrosshairDistanceLabel"
        CrosshairDistanceLabel.Text = "预判距离"
        CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        CrosshairDistanceLabel.BackgroundTransparency = 1
        CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
        CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
        CrosshairDistanceLabel.Parent = Frame
        local CrosshairDistanceSlider = Instance.new("TextBox")
        CrosshairDistanceSlider.Name = "CrosshairDistanceSlider"
        CrosshairDistanceSlider.Text = tostring(crosshairDistance)
        CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
        CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(180, 128, 64)
        CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0)
        CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
        CrosshairDistanceSlider.Parent = Frame
        local targetCFrame = Cam.CFrame
        local function updateDrawings()
            local camViewportSize = Cam.ViewportSize
            FOVring.Position = camViewportSize / 2
            FOVring.Radius = fov
        end
        local function onKeyDown(input)
            if input.KeyCode == Enum.KeyCode.Delete then
                RunService:UnbindFromRenderStep("FOVUpdate")
                FOVring:Remove()
            end
        end
        UserInputService.InputBegan:Connect(onKeyDown)
        local function getClosestPlayerInFOV(trg_part)
            local nearest = nil
            local last = math.huge
            local playerMousePos = Cam.ViewportSize / 2
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer then
                    local part = player.Character and player.Character:FindFirstChild(trg_part)
                    if part then
                        local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                        local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
                        if distance < last and isVisible and distance < fov then
                            last = distance
                            nearest = player
                        end
                    end
                end
            end
            return nearest
        end
        RunService.RenderStepped:Connect(function()
            updateDrawings()
            local closest = getClosestPlayerInFOV("Head")
            if closest and closest.Character:FindFirstChild("Head") then
                local targetCharacter = closest.Character
                local targetHead = targetCharacter.Head
                local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
                local isMoving = targetRootPart.Velocity.Magnitude > 0.1
                local targetPosition
                if isMoving then
                    targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance)
                else
                    targetPosition = targetHead.Position
                end
                targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
            else
                targetCFrame = Cam.CFrame
            end
            Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness)
        end)
        FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
            if enterPressed then
                local newFov = tonumber(FovSlider.Text)
                if newFov then
                    fov = newFov
                else
                    FovSlider.Text = tostring(fov)
                end
            end
        end)
        SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
            if enterPressed then
                local newSmoothness = tonumber(SmoothnessSlider.Text)
                if newSmoothness then
                    smoothness = newSmoothness
                else
                    SmoothnessSlider.Text = tostring(smoothness)
                end
            end
        end)
        CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
            if enterPressed then
                local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text)
                if newCrosshairDistance then
                    crosshairDistance = newCrosshairDistance
                else
                    CrosshairDistanceSlider.Text = tostring(crosshairDistance)
                end
            end
        end)

    end)
    ehez:Button("保险秒开(待修复)", function()
        local jmk = game.workspace.Game.Entities.GoldJewelSafe.GoldJewelSafe
        jmk.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
        local hmk = game.workspace.Game.Entities.JewelSafe.JewelSafe
        hmk.Door["Meshes/LargeSafe_Cube.002_Cube.003_None (1)"].Attachment.ProximityPrompt.HoldDuration = 0
    end)
    ehez:Button("秒填弹药箱", function()
        for i = 1, 50 do
            local ammobx = game.workspace.Game.Local.droppables["Ammo Box"]
            ammobx.Handle.ProximityPrompt.HoldDuration = 0
            ammobx.Name = "ammoopen"
        end
    end)
    ehez:Button("珠宝秒拿", function()
        local rocks = game.workspace.GemRobbery.JewelryCases.HighYieldSpawns
        for _, obj in pairs(rocks:GetChildren()) do
            if obj.ClassName == "Model" then
                for _, innerObj in pairs(obj:GetChildren()) do
                    if innerObj.ClassName == "Model" then
                        if innerObj.Name == "Case" then
                            -- 什么也不做
                        elseif innerObj.Name == "Emerald" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Sapphire" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Amethyst" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Topaz" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Diamond" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Gold Bar" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Ruby" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        else
                            if innerObj:FindFirstChild("Box") and innerObj.Box:FindFirstChild("ProximityPrompt") then
                                innerObj.Box.ProximityPrompt.HoldDuration = 0
                            end
                        end
                    end
                end
            end
        end

        local rocks2 = game.workspace.GemRobbery.JewelryCases.LowYieldSpawns
        for _, obj in pairs(rocks2:GetChildren()) do
            if obj.ClassName == "Model" then
                for _, innerObj in pairs(obj:GetChildren()) do
                    if innerObj.ClassName == "Model" then
                        if innerObj.Name == "Case" then
                            -- 什么也不做
                        elseif innerObj.Name == "Emerald" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Sapphire" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Amethyst" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Topaz" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Diamond" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Gold Bar" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        elseif innerObj.Name == "Ruby" then
                            if innerObj:FindFirstChild("Handle") and innerObj.Handle:FindFirstChild("ProximityPrompt") then
                                innerObj.Handle.ProximityPrompt.HoldDuration = 0
                            end
                        else
                            if innerObj:FindFirstChild("Box") and innerObj.Box:FindFirstChild("ProximityPrompt") then
                                innerObj.Box.ProximityPrompt.HoldDuration = 0
                            end
                        end
                    end
                end
            end
        end
    end)
    ehez:Button("秒开银行", function()
        game.Workspace.BankRobbery.VaultDoor.Door.Attachment.ProximityPrompt.HoldDuration = 0
    end)
    ehez:Button("传送银行", function()
        local epoh4 = CFrame.new(1053, 10, -338)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehez:Button("传送珠宝店", function()
        local epoh4 = CFrame.new(1719.02637, 14.2831011, -714.293091)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehez:Button("银行刷新提醒", function()
        while true do
            wait(0.1) -- 防止卡，不能删！！！
            local bank = game.workspace.BankRobbery.BankCash.Cash:FindFirstChild("Bundle") -- 查找
            if bank then -- 判断
                wait(1) -- 冷却时间
                game:GetService("StarterGui"):SetCore("SendNotification", { -- 提示
                    Title = "BY.咸鱼_XY",
                    Text = "银行已刷新",
                    Duration = math.huge,
                    Button1 = "确定"

                })
                wait(1) -- 冷却时间
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "BY.咸鱼_XY",
                    Text = "脚本加载完成",
                    Duration = math.huge

                })
            end
        end
    end)
    ehez:Button("珠宝店刷新提醒", function()
        while true do
            wait(0.1) -- 防止卡，不能删！！！
            local gem = Game.Workspace.GemRobbery:FindFirstChild("Rubble") -- 查找
            if gem then -- 判断
                wait(1) -- 冷却时间
                game:GetService("StarterGui"):SetCore("SendNotification", { -- 提示
                    Title = "BY.咸鱼_XY",
                    Text = "珠宝店已刷新",
                    Duration = math.huge,
                    Button1 = "确定"

                })
                wait(1) -- 冷却时间
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "BY.咸鱼_XY",
                    Text = "脚本加载完成",
                    Duration = math.huge

                })
            end
        end
    end)
    ehez:Button("双倍资金", function()
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container.premium.Visible = true
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container.premium.TextLabel.Text = "BY.咸鱼_XY"
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container["2x cash"].Visible = true
        game:GetService("Players").LocalPlayer.PlayerGui.Money.Container["2x cash"].TextLabel.Text = "Ohio双倍资金"
    end)
    local ehezcs = main:section("传送界面", false)
    ehezcs:Label("食品类")
    ehezcs:Button("大咖啡厅", function()
        local epoh4 = CFrame.new(1358.65, 8.496, -326.6818)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("小咖啡厅", function()
        local epoh4 = CFrame.new(1116.8702, 6.5637, -743.9596)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("八月楼绷带", function()
        local epoh4 = CFrame.new(1193.4033, 44.4927, -748.6199)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("医院绷带", function()
        local epoh4 = CFrame.new(1166, 26, -972)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Label("枪械类")
    ehezcs:Button("AS瓦尔", function()
        local epoh4 = CFrame.new(674, -16, -99)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("伤疤", function()
        local epoh4 = CFrame.new(792, 81, -1207)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("巴雷特", function()
        local epoh4 = CFrame.new(595, 41, -694)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("RPG", function()
        local epoh4 = CFrame.new(691, 6.5, -675)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("M249锯子", function()
        local epoh4 = CFrame.new(654, 25, -1455)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("八月", function()
        local epoh4 = CFrame.new(1170, 44, -772)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("M4A1", function()
        local epoh4 = CFrame.new(603, 28, -921)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("AK47", function()
        local epoh4 = CFrame.new(671, 6.5, -718)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("伤害7", function()
        local epoh4 = CFrame.new(622, 41, -687)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("双筒", function()
        local epoh4 = CFrame.new(1318.9725, 8.5385, -162.7393)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Label("近战武器类")
    ehezcs:Button("镰刀", function()
        local epoh4 = CFrame.new(1399, 0.5, 30)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("武士刀", function()
        local epoh4 = CFrame.new(175.191, 13.937, -132.69)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Label("杂物类")
    ehezcs:Button("购物车", function()
        local epoh4 = CFrame.new(1101.54529, 10, -708.226379)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("军甲", function()
        local epoh4 = CFrame.new(563, 25, -1472)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("重甲", function()
        local epoh4 = CFrame.new(613, 28, -921)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("八月楼弹药箱", function()
        local epoh4 = CFrame.new(1180, 44, -774)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
    ehezcs:Button("撬锁", function()
        local epoh4 = CFrame.new(660, 6.5, -716)
        local epoh5 = game:GetService("Players")
        local epoh6 = epoh5.LocalPlayer.Character.HumanoidRootPart
        epoh6.CFrame = epoh4
    end)
end

if REN["白名单"]["开发者白名单"]["状态"] == false then
    notify(" 星云V2 ", "永久免费", 3)
    wait(1)
    notify(" 星云V2 ", "正在启动脚本....", 5)
    wait(3)
    scripts()
else
    if REN["限免"] == true then
        notify(" 星云V2 ", "永久免费", 3)
        wait(1)
        notify(" 星云V2 ", "正在启动脚本....", 5)
        wait(3)
        scripts()
    else
        if R == "Q群834451572" then
            notify(" 星云V2 ", "保护函数正确", 3)

        end
        if REN["白名单"]["普通白名单"]["状态"] == false then
            notify(" 星云V2 ", "白名单验证成功", 3)
            notify(" 星云V2 ", "正在启动脚本中....", 5)
            scripts()
        else
            setclipboard("834451572")
            game.Players.LocalPlayer:Kick(REN["游戏名"] .. "错误\n")
        end
    end
end
