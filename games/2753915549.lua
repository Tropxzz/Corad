-- blox fruits c.1 
repeat
    task.wait()
until game:IsLoaded()

_G.AutoFarm = false
 ArrayField = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Corad/main/Uilibrary"))()
 -- QuestData = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Corad/main/QuestData", true))()
 lplr = game.Players.LocalPlayer
 SelectedQuest = {Quest = "", Enabled = false, AutoSelect = false, FirstSea = "", SecondSea = ""}

--[[
    function StartQuest(Enemy)
    Quest_Person, Quest_Data = QuestData.getQuest(Enemy)
    
    for i,v in pairs(Quest_Data) do
        if i == "CFramePos" then
            CFramePos = v
        elseif typeof(v) == "CFrame" then
            CFramePos = v
        end
    end

    if (Vector3.new(CFramePos.X, CFramePos.Y, CFramePos.Z) - lplr.Character.HumanoidRootPart.Position).Magnitude >= 10000 and Quest_Data.Entrance then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Quest_Data.Entrance)
        task.wait(0.4)
     else
        task.wait(1)
        WalkTween(lplr.Character.HumanoidRootPart, CFramePos, 300)
        task.wait(0.4)
        if (Vector3.new(CFramePos.X, CFramePos.Y, CFramePos.Z) - lplr.Character.HumanoidRootPart.Position).Magnitude <= 20 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", Quest_Data.QuestName, Quest_Data.LevelQuest)
            task.wait(0.5)
        end
    end
end

function Attack(Enemy)
    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name:find(Enemy) then
                repeat task.wait()
                    if (v.HumanoidRootPart.Position - lplr.Character.PrimaryPart.Position).Magnitude <= 54 then
                        CombatFramework.activeController.hitboxMagnitude = 54
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1000, 1000))
                    end
                    WalkTween(lplr.Character.HumanoidRootPart, CFrame.new(v.HumanoidRootPart.Position.X, v.HumanoidRootPart.Position.Y + 50, v.HumanoidRootPart.Position.Z), 400)
                until not v.Parent or v.Humanoid.Health <= 0
            else
                for i,v in pairs(game.Workspace._WorldOrigin.EnemySpawns:GetChildren()) do
                    if v.Name:find(Enemy) then
                        WalkTween(lplr.Character.HumanoidRootPart, v.CFrame, 300) break
                    end
                end
            end
        end
    else
        StartQuest(Enemy)
    end
end

table.insert(QuestData.FirstSea, "First Sea")
]]

local Window = ArrayField:CreateWindow({
    Name = "< Tabs; Corad - Bloxfruits - Chapter 1",
    LoadingTitle = "Corad",
    LoadingSubtitle = "by Tropxz",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Corad", -- Create a custom folder for your hub/game
        FileName = "Config"
    },
    Discord = {
        Enabled = true,
        Invite = "uJrWwXBgwM", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
        RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
        Title = "Key",
        Subtitle = "",
        Note = "The key is in the discord",
        FileName = "StupidShitSuckmydickScript_Called_Corad", -- It is recommended to use something unique as other scripts using ArrayField may overwrite your key file
        SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
        GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
        Actions = {
            [1] = {
                Text = "Click here to copy the key link <--",
                OnPress = function()
                    toclipboard("https://discord.gg/uJrWwXBgwM")

                    ArrayField:Notify({
                        Title = "Copied",
                        Content = "The link has been copied, If you didn't get it, https://discord.gg/uJrWwXBgwM",
                        Duration = 5,
                        Image = 4483362458,
                        Actions = {
                            -- Notification Buttons
                            Ignore = {
                                Name = "Okay!",
                                Callback = function()
                                    print("The user tapped Okay!")
                                end
                            }
                        }
                    })
                end
            }
        },
        Key = {"ThisKeyIsForCorad!!"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local function CheckQuest()
    local Lv = game.Players.LocalPlayer.Data.Level.Value
    if Lv == 0 or Lv <= 10 then
        Ms = "Bandit [Lv. 5]"
        NM = "Bandit"
        LQ = 1
        NQ = "BanditQuest1"
        CQ = CFrame.new(1062.64697265625, 16.516624450683594, 1546.55224609375)
    end
end

spawn(function()
    while true do
        if _G.AutoFarm then
            CheckQuest()
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                TP(CQ)
                task.wait(0.9)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NQ, LQ)
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == Ms then
                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    end
                end
            end
        end
        task.wait()
    end
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.AutoFarm then
            pcall(function()
                game:GetService('VirtualUser'):CaptureController()
                game:GetService('VirtualUser'):Button1Down(Vector2.new(0, 1), workspace.CurrentCamera.CFrame)
            end)
        end
    end)
end)

local Home = Window:CreateTab("Home", "11433532654") -- Title, Image

Home:CreateLabel("Welcome " .. tostring(game.Players.LocalPlayer))

local tools = {} -- List of tools in the backpack

local Dropdown = Home:CreateDropdown({
    Name = "Choose your weapon",
    Options = tools,
    CurrentOption = "",
    MultiSelection = true,
    Flag = "Dropdown1",
    Callback = function(Option)
    end,
})

game.Players.LocalPlayer.Backpack.DescendantAdded:Connect(function(tool)
    local toolName = tool.Name
    if tool:IsA("Tool") then
        table.insert(tools, toolName)
        Dropdown:Refresh(tools)
    end
end)

game.Players.LocalPlayer.Backpack.DescendantRemoving:Connect(function(tool)
    local toolName = tool.Name
    if tool:IsA("Tool") then
        for i,v in pairs(tools) do
            if v == toolName then
                table.remove(tools, i)
            end
        end
    end
    Dropdown:Refresh(tools)
end)

local M = Window:CreateTab("Main", "11422917864") -- Title, Image

M:CreateToggle({
    Name = "Auto farm toggle",
    CurrentValue = false,
    Flag = "AFT", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(v)
        if v then
        _G.AutoFarm = true
    else
        _G.AutoFarm = false
    end
    end,
 })

 M:CreateInput({
    Name = "Fake bail",
    PlaceholderText = "Number",
    NumbersOnly = true, -- If the user can only type numbers. Remove or set to false if none.
    OnEnter = true,
    RemoveTextAfterFocusLost = false, -- Speaks for itself.
    Callback = function(v)            
        game.Players.LocalPlayer.Data.Level.Value = v
    end,
 })

local APGoeshardlmafo = Window:CreateTab("Auto Buy", 11963373658) -- Title, Image

 APGoeshardlmafo:CreateToggle({
    Name = "Melee | Auto stats",
    CurrentValue = false,
    Flag = "Flag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            spawn(function()
                while true do
                    local args = {
                        [1] = "AddPoint",
                        [2] = "Melee",
                        [3] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    task.wait(30)
                end
            end)
        else
            print("Toggle Off")
        end
    end
})

APGoeshardlmafo:CreateButton({
        Name = "Cousin",
    Interact = 'Click',
    Callback = function()
        local args = {
            [1] = "Cousin",
            [2] = "Buy"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        
    end,
 })


APGoeshardlmafo:CreateToggle({Name  = "Sword | Auto Stats"; CurrentValue = false; Flag = "Flag1"; Callback = function(v)
    if v then
        _G.autoSword = true
        while _G.autoSword == true do
local args = {
[1] = "AddPoint",
[2] = "Sword",
[3] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            task.wait(30)
        end
    else
        print("Toggle Off")
    end
end
})

APGoeshardlmafo:CreateToggle({Name  = "Gun | Auto Stats"; CurrentValue = false; Flag = "Flag2"; Callback = function(v)
        if v then
            _G.autoGun = true
            while _G.autoGun == true do
local args = {
[1] = "AddPoint",
[2] = "Gun",
[3] = 1
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                task.wait(30)
            end
        else
            print("Toggle Off")
        end
end
})

local Teleport = Window:CreateTab("Teleport", 12967525853) -- Title, Image

Teleport:CreateButton({
    Name = "Teleport | Mid town",
    Interact = 'Click',
    Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(5, Enum.EasingStyle.Linear)
        tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-705.99755859375, 7.852255344390869, 1547.5216064453125)}):Play()
    end,
 })

 Teleport:CreateButton({
    Name = "Teleport | Prison",
    Interact = 'Click',
    Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(25, Enum.EasingStyle.Linear)
        tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(4841.84423828125, 5.651970863342285, 741.329833984375)}):Play()
    end,
 })


M:CreateToggle({Name = "Autofarm"; CurrentValue = false; Flag = "flag312"; Callback = function(state)
             if state then
                _G.AutoFarm = true
            else
                _G.AutoFarm = false
            end
end
})

M:CreateToggle(
    {
        Name = "Fly (By my friend Ace)",
        CurrentValue = false,
        Flag = "Fly",
        Callback = function(Value)
            if Value then
                localplayer = game.Players.LocalPlayer
                animation2 = Instance.new("Animation")
                animation = Instance.new("Animation")
                animation3 = Instance.new("Animation")
                animation4 = Instance.new("Animation")
                hover = "rbxassetid://"
                plr = game.Players.LocalPlayer
                fly = "rbxassetid://"
                r = "rbxassetid://"
                l = "rbxassetid://"
                character = plr.Character
                animation.AnimationId = fly
                animation2.AnimationId = hover
                animation3.AnimationId = r
                animation4.AnimationId = l
                loader = character:WaitForChild("Humanoid"):LoadAnimation(animation)
                loader2 = character:WaitForChild("Humanoid"):LoadAnimation(animation2)
                loader3 = character:WaitForChild("Humanoid"):LoadAnimation(animation3)
                loader4 = character:WaitForChild("Humanoid"):LoadAnimation(animation4)
                L_143_ = game.Players.LocalPlayer
                L_144_ = L_143_:GetMouse()
                localplayer = L_143_
                if workspace:FindFirstChild("Core") then
                    workspace.Core:Destroy()
                end
                local L_145_ = Instance.new("Part")
                L_145_.Name = "Core"
                L_145_.Size = Vector3.new(0.05, 0.05, 0.05)
                spawn(
                    function()
                        L_145_.Parent = workspace
                        local L_152_ = Instance.new("Weld", L_145_)
                        L_152_.Part0 = L_145_
                        L_152_.Part1 = localplayer.Character.LowerTorso
                        L_152_.C0 = CFrame.new(0, 0, 0)
                    end
                )
                workspace:WaitForChild("Core")
                local L_146_ = workspace.Core
                flying = true
                L_147_ = 10
                L_148_ = {
                    a = false,
                    d = false,
                    w = false,
                    s = false
                }

                L_149_ =
                    L_144_.KeyDown:connect(
                    function(L_156_arg0)
                        if not L_146_ or not L_146_.Parent then
                            flying = false
                            L_149_:disconnect()
                            L_150_:disconnect()
                            return
                        end
                        if L_156_arg0 == "x" then
                            if flying == true then
                                flying = false
                                loader:Play()
                                loader:Stop()
                                -- hover
                                loader2:Play()
                                loader2:Stop()
                            else
                                flying = true
                                local animation3 = Instance.new("Animation")
                                local r = "rbxassetid://9798901178"
                                animation3.AnimationId = r
                                local loader3111 = character:WaitForChild("Humanoid"):LoadAnimation(animation3)
                                loader3111:Play()
                                wait(3)
                                loader:Play()
                                loader:Stop()
                                -- hover
                                loader2:Play()
                                L_151_func()
                            end
                        elseif L_156_arg0 == "w" then
                            if flying == true then
                                L_148_.w = true
                                loader2:Play()
                                loader2:Stop()
                                loader:Play()
                                loader2:Play()
                                -- fly
                                loader2:Stop()
                            end
                        elseif L_156_arg0 == "s" then
                            L_148_.s = true
                            if flying == true then
                                loader2:Play()
                                loader2:Stop()
                                loader:Play()
                                loader2:Play()
                                loader2:Stop()
                            end
                        elseif L_156_arg0 == "a" then
                            L_148_.a = true
                            if flying == true then
                                loader:Play()
                                loader:Stop()
                                loader2:Play()
                                loader2:Stop()
                                loader3:Play()
                                loader4:Play()
                                loader4:Stop()
                            end
                        elseif L_156_arg0 == "d" then
                            L_148_.d = true
                            if flying == true then
                                loader:Play()
                                loader:Stop()
                                loader2:Play()
                                loader2:Stop()
                                loader3:Play()
                                loader3:Stop()
                                loader4:Play()
                            end
                        end
                    end
                )

                L_150_ =
                    L_144_.KeyUp:connect(
                    function(L_157_arg0)
                        if L_157_arg0 == "w" then
                            L_148_.w = false
                            wait()
                            if flying == true then
                                loader:Play()
                                --]]
                                loader:Stop()
                                -- hover
                                loader3:Play()
                                loader3:Stop()
                                loader4:Play()
                                loader4:Stop()
                                loader2:Play()
                            end
                        elseif L_157_arg0 == "s" then
                            L_148_.s = false
                            if flying == true then
                                loader:Play()
                                loader:Stop()
                                -- hover
                                loader2:Play()
                                loader3:Play()
                                loader3:Stop()
                                loader4:Play()
                                loader4:Stop()
                            end
                        elseif L_157_arg0 == "a" then
                            L_148_.a = false
                            if flying == true then
                                loader:Play()
                                loader:Stop()
                                loader2:Play()
                                loader3:Play()
                                loader3:Stop()
                                loader4:Play()
                                loader4:Stop()
                            end
                        elseif L_157_arg0 == "d" then
                            L_148_.d = false
                            if flying == true then
                                loader:Play()
                                loader:Stop()
                                loader2:Play()
                                loader3:Play()
                                loader3:Stop()
                                loader4:Play()
                                loader4:Stop()
                            end
                        end
                    end
                )

                local function L_151_func()
                    local L_153_ = Instance.new("BodyPosition", L_146_)
                    local L_154_ = Instance.new("BodyGyro", L_146_)
                    L_153_.Name = "EPIXPOS"
                    L_153_.maxForce = Vector3.new(math.huge, math.huge, math.huge)
                    L_153_.position = L_146_.Position
                    L_154_.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    L_154_.cframe = L_146_.CFrame
                    repeat
                        wait()
                        localplayer.Character.Humanoid.PlatformStand = true
                        local L_155_ = L_154_.cframe - L_154_.cframe.p + L_153_.position
                        if not L_148_.w and not L_148_.s and not L_148_.a and not L_148_.d then
                            L_147_ = 10
                        end
                        if L_148_.w then
                            L_155_ = L_155_ + workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
                            L_147_ = L_147_ + 0
                        end
                        if L_148_.s then
                            L_155_ = L_155_ - workspace.CurrentCamera.CoordinateFrame.lookVector * L_147_
                            L_147_ = L_147_ + 0
                        end
                        if L_148_.d then
                            L_155_ = L_155_ * CFrame.new(L_147_, 0, 0)
                            L_147_ = L_147_ + 0
                        end
                        if L_148_.a then
                            L_155_ = L_155_ * CFrame.new(-L_147_, 0, 0)
                            L_147_ = L_147_ + 0
                        end
                        if L_147_ > 10 then
                            L_147_ = 10
                        end
                        L_153_.position = L_155_.p
                        if L_148_.w then
                            L_154_.cframe =
                                workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(L_147_ * 0), 0, 0)
                        elseif L_148_.s then
                            L_154_.cframe =
                                workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(L_147_ * 0), 0, 0)
                        else
                            L_154_.cframe = workspace.CurrentCamera.CoordinateFrame
                        end
                    until flying == false
                    if L_154_ then
                        L_154_:Destroy()
                    end
                    if L_153_ then
                        L_153_:Destroy()
                    end
                    flying = false
                    localplayer.Character.Humanoid.PlatformStand = false
                    L_147_ = 25
                end

                L_151_func()
            else
                -- Stop flying and clean up if the toggle is turned off
                flying = false
                L_149_:Disconnect()
                L_150_:Disconnect()
                localplayer.Character.Humanoid.PlatformStand = false
                if workspace:FindFirstChild("Core") then
                    workspace.Core:Destroy()
                end
                -- Additional cleanup code...
                if loader then
                    loader:Stop()
                    loader:Destroy()
                end
                if loader2 then
                    loader2:Stop()
                    loader2:Destroy()
                end
                if loader3 then
                    loader3:Stop()
                    loader3:Destroy()
                end
                if loader4 then
                    loader4:Stop()
                    loader4:Destroy()
                end
                if character then
                    character.Humanoid.PlatformStand = false
                end
                if workspace:FindFirstChild("Core") then
                    workspace.Core:Destroy()
                end
            end
        end
    }
)
