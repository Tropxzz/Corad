repeat
    task.wait()
until game:IsLoaded()
function getRoot(char)
    local rootPart =
        char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
    return rootPart
end

local Mouse = game.Players.LocalPlayer:GetMouse()
local speaker = game.Players.LocalPlayer
local injected = true
local teleportedS = false
local cam = workspace.CurrentCamera
local PS = game.Players
local inputs = game:GetService("UserInputService")
local Character = game.Players.LocalPlayer.Character
local character = game.Players.LocalPlayer.Character
local localplayer = game.Players.LocalPlayer
local Animate = game.Players.LocalPlayer.Character.Animate
local Players = game.Players
local RunService = game.RunService
game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
flinging = false

local startmsg = {
    "Hello, ",
    "Hi, ",
    "How are you, ",
    "IM HAPPY, ",
    "Tropxz productions is fire! ",
    "Nice to meet you, ",
    "Greetings, ",
    "Hey there, ",
    "What's up, ",
    "Feeling good, ",
    "Hey, ",
    "Good day, ",
    "Hola, ",
    "Heyyy, ",
    "What's happening, ",
    "Yo, ",
    "Heyo, ",
    "Hey friend, ",
    "Heya, ",
    "Howdy, ",
    "Sup, ",
    "Hey, how's it going, ",
    "Greetings and salutations, ",
    "Hey, what's new, ",
    "Hola amigo, ",
    "Hey there, how have you been, ",
    "Good to see you, ",
    "Heyyy, long time no see, ",
    "What's cracking, ",
    "Hey, how's your day, ",
    "Greetings, my friend, ",
    "Hey, nice to see you again, ",
    "How's everything, ",
    "Hey, how's life treating you, ",
    "Long time, no chat, ",
    "Hey, what's the word, ",
    "Hey, are you ready to chat, ",
    "Greetings and blessings, ",
    "Hey, how's the weather, ",
    "Hey, how's your week going, ",
    "Hey, got any exciting plans, ",
    "Hey, ready to have some fun, ",
    "Hey, how's your family doing, ",
    "Hey, any big news, ",
    "Hey, what's the latest buzz, ",
    "Hey, got a minute to talk, ",
    "Hey, how's your day treating you, ",
    "Hey, what's cooking, ",
    "Hey, how's the world treating you, ",
    "Hey, how's your mood today, ",
    "Hey, any good movies you've seen, ",
    "Hey, how's the weekend treating you, ",
    "Hey, any interesting stories to share, ",
    "Hey, how's your journey so far, ",
    "Hey, how's your energy level, ",
    "Hey, any cool new music you've discovered, ",
    "Hey, what's the plan for today, ",
    "Hey, how's your adventure going, ",
    "Hey, any new hobbies you've picked up, ",
    "Hey, how's your coffee, ",
    "Hey, any plans for the evening, ",
    "Goodbye, ",
    "Farewell, ",
    "Take care, ",
    "Goodbye and have a great day, ",
    "See you later, ",
    "Until next time, ",
    "Adios, ",
    "Bye for now, ",
    "Catch you later, ",
    "Goodbye, my friend, ",
    "Stay safe, ",
    "Wishing you all the best, ",
    "Take it easy, ",
    "Bye bye, ",
    "Until we meet again, ",
    "Have a great day, ",
    "So long, ",
    "Goodbye, take care of yourself, ",
    "Until next time, my friend, ",
    "May the force be with you, ",
    "Bye, have a wonderful time, ",
    "Wishing you farewell, ",
    "Goodbye, stay awesome, ",
    "Bye, take care and be well, ",
    "Farewell, my friend, ",
    "Goodbye, keep shining, ",
    "Take care, my friend, ",
    "Bye bye, stay in touch, ",
    "Until we meet again, take care, ",
    "Goodbye, wishing you happiness, ",
    "Bye for now, see you soon, ",
    "Hey, ready to code some Lua, ",
    "Greetings, Lua enthusiast, ",
    "Hey, let's dive into Lua programming, ",
    "Hey, Lua is a powerful language, ",
    "Hey, Lua is the language of choice, ",
    "Greetings, fellow Lua developer, ",
    "Hey, ready to unleash the power of Lua, ",
    "Hey, let's conquer Lua programming, ",
    "Hey, Lua scripting is awesome, ",
    "Greetings, Lua mastermind, "
}

function randomString()
    local length = math.random(10, 20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

function r15(plr)
    if plr.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 then
        return true
    end
end

function onlyIncludeInTable(tab, matches)
    local matchTable = {}
    local resultTable = {}
    for i, v in pairs(matches) do
        matchTable[v.Name] = true
    end
    for i, v in pairs(tab) do
        if matchTable[v.Name] then
            table.insert(resultTable, v)
        end
    end
    return resultTable
end

function toTokens(str)
    local tokens = {}
    for op, name in string.gmatch(str, "([+-])([^+-]+)") do
        table.insert(tokens, {Operator = op, Name = name})
    end
    return tokens
end

function splitString(str, delim)
    local broken = {}
    if delim == nil then
        delim = ","
    end
    for w in string.gmatch(str, "[^" .. delim .. "]+") do
        table.insert(broken, w)
    end
    return broken
end

local WorldToScreen = function(Object)
    local ObjectVector = workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local MousePositionToVector2 = function()
    return Vector2.new(Mouse.X, Mouse.Y)
end

local GetClosestPlayerFromCursor = function()
    local found = nil
    local ClosestDistance = math.huge
    for i, v in pairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
            for k, x in pairs(v.Character:GetChildren()) do
                if string.find(x.Name, "Torso") then
                    local Distance = (WorldToScreen(x) - MousePositionToVector2()).Magnitude
                    if Distance < ClosestDistance then
                        ClosestDistance = Distance
                        found = v
                    end
                end
            end
        end
    end
    return found
end

function getTorso(x)
    x = x or Players.LocalPlayer.Character
    return x:FindFirstChild("Torso") or x:FindFirstChild("UpperTorso") or x:FindFirstChild("LowerTorso") or
        x:FindFirstChild("HumanoidRootPart")
end

SpecialPlayerCases = {
    ["all"] = function(speaker)
        return Players:GetPlayers()
    end,
    ["others"] = function(speaker)
        local plrs = {}
        for i, v in pairs(Players:GetPlayers()) do
            if v ~= speaker then
                table.insert(plrs, v)
            end
        end
        return plrs
    end,
    ["me"] = function(speaker)
        return {speaker}
    end,
    ["#(%d+)"] = function(speaker, args, currentList)
        local returns = {}
        local randAmount = tonumber(args[1])
        local players = {unpack(currentList)}
        for i = 1, randAmount do
            if #players == 0 then
                break
            end
            local randIndex = math.random(1, #players)
            table.insert(returns, players[randIndex])
            table.remove(players, randIndex)
        end
        return returns
    end,
    ["random"] = function(speaker, args, currentList)
        local players = Players:GetPlayers()
        local localplayer = Players.LocalPlayer
        table.remove(players, table.find(players, localplayer))
        return {players[math.random(1, #players)]}
    end,
    ["%%(.+)"] = function(speaker, args)
        local returns = {}
        local team = args[1]
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Team and string.sub(string.lower(plr.Team.Name), 1, #team) == string.lower(team) then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["allies"] = function(speaker)
        local returns = {}
        local team = speaker.Team
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Team == team then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["enemies"] = function(speaker)
        local returns = {}
        local team = speaker.Team
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Team ~= team then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["team"] = function(speaker)
        local returns = {}
        local team = speaker.Team
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Team == team then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["nonteam"] = function(speaker)
        local returns = {}
        local team = speaker.Team
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Team ~= team then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["friends"] = function(speaker, args)
        local returns = {}
        for _, plr in pairs(Players:GetPlayers()) do
            if plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["nonfriends"] = function(speaker, args)
        local returns = {}
        for _, plr in pairs(Players:GetPlayers()) do
            if not plr:IsFriendsWith(speaker.UserId) and plr ~= speaker then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["guests"] = function(speaker, args)
        local returns = {}
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Guest then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["bacons"] = function(speaker, args)
        local returns = {}
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character:FindFirstChild("Pal Hair") or plr.Character:FindFirstChild("Kate Hair") then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["age(%d+)"] = function(speaker, args)
        local returns = {}
        local age = tonumber(args[1])
        if not age == nil then
            return
        end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.AccountAge <= age then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["nearest"] = function(speaker, args, currentList)
        local speakerChar = speaker.Character
        if not speakerChar or not getRoot(speakerChar) then
            return
        end
        local lowest = math.huge
        local NearestPlayer = nil
        for _, plr in pairs(currentList) do
            if plr ~= speaker and plr.Character then
                local distance = plr:DistanceFromCharacter(getRoot(speakerChar).Position)
                if distance < lowest then
                    lowest = distance
                    NearestPlayer = {plr}
                end
            end
        end
        return NearestPlayer
    end,
    ["farthest"] = function(speaker, args, currentList)
        local speakerChar = speaker.Character
        if not speakerChar or not getRoot(speakerChar) then
            return
        end
        local highest = 0
        local Farthest = nil
        for _, plr in pairs(currentList) do
            if plr ~= speaker and plr.Character then
                local distance = plr:DistanceFromCharacter(getRoot(speakerChar).Position)
                if distance > highest then
                    highest = distance
                    Farthest = {plr}
                end
            end
        end
        return Farthest
    end,
    ["group(%d+)"] = function(speaker, args)
        local returns = {}
        local groupID = tonumber(args[1])
        for _, plr in pairs(Players:GetPlayers()) do
            if plr:IsInGroup(groupID) then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["alive"] = function(speaker, args)
        local returns = {}
        for _, plr in pairs(Players:GetPlayers()) do
            if
                plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and
                    plr.Character:FindFirstChildOfClass("Humanoid").Health > 0
             then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["dead"] = function(speaker, args)
        local returns = {}
        for _, plr in pairs(Players:GetPlayers()) do
            if
                (not plr.Character or not plr.Character:FindFirstChildOfClass("Humanoid")) or
                    plr.Character:FindFirstChildOfClass("Humanoid").Health <= 0
             then
                table.insert(returns, plr)
            end
        end
        return returns
    end,
    ["rad(%d+)"] = function(speaker, args)
        local returns = {}
        local radius = tonumber(args[1])
        local speakerChar = speaker.Character
        if not speakerChar or not getRoot(speakerChar) then
            return
        end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character and getRoot(plr.Character) then
                local magnitude = (getRoot(plr.Character).Position - getRoot(speakerChar).Position).magnitude
                if magnitude <= radius then
                    table.insert(returns, plr)
                end
            end
        end
        return returns
    end,
    ["cursor"] = function(speaker)
        local plrs = {}
        local v = GetClosestPlayerFromCursor()
        if v ~= nil then
            table.insert(plrs, v)
        end
        return plrs
    end,
    ["npcs"] = function(speaker, args)
        local returns = {}
        for _, v in pairs(workspace:GetDescendants()) do
            if
                v:IsA("Model") and getRoot(v) and v:FindFirstChildWhichIsA("Humanoid") and
                    Players:GetPlayerFromCharacter(v) == nil
             then
                local clone = Instance.new("Player")
                clone.Name = v.Name .. " - " .. v:FindFirstChildWhichIsA("Humanoid").DisplayName
                clone.Character = v
                table.insert(returns, clone)
            end
        end
        return returns
    end
}

function getPlayersByName(Name)
    local Name, Len, Found = string.lower(Name), #Name, {}
    for _, v in pairs(Players:GetPlayers()) do
        if Name:sub(0, 1) == "@" then
            if string.sub(string.lower(v.Name), 1, Len - 1) == Name:sub(2) then
                table.insert(Found, v)
            end
        else
            if
                string.sub(string.lower(v.Name), 1, Len) == Name or
                    string.sub(string.lower(v.DisplayName), 1, Len) == Name
             then
                table.insert(Found, v)
            end
        end
    end
    return Found
end

function removeTableMatches(tab, matches)
    local matchTable = {}
    local resultTable = {}
    for i, v in pairs(matches) do
        matchTable[v.Name] = true
    end
    for i, v in pairs(tab) do
        if not matchTable[v.Name] then
            table.insert(resultTable, v)
        end
    end
    return resultTable
end

function getPlayer(list, speaker)
    if list == nil then
        return {speaker.Name}
    end
    local nameList = splitString(list, ",")

    local foundList = {}

    for _, name in pairs(nameList) do
        if string.sub(name, 1, 1) ~= "+" and string.sub(name, 1, 1) ~= "-" then
            name = "+" .. name
        end
        local tokens = toTokens(name)
        local initialPlayers = Players:GetPlayers()

        for i, v in pairs(tokens) do
            if v.Operator == "+" then
                local tokenContent = v.Name
                local foundCase = false
                for regex, case in pairs(SpecialPlayerCases) do
                    local matches = {string.match(tokenContent, "^" .. regex .. "$")}
                    if #matches > 0 then
                        foundCase = true
                        initialPlayers = onlyIncludeInTable(initialPlayers, case(speaker, matches, initialPlayers))
                    end
                end
                if not foundCase then
                    initialPlayers = onlyIncludeInTable(initialPlayers, getPlayersByName(tokenContent))
                end
            else
                local tokenContent = v.Name
                local foundCase = false
                for regex, case in pairs(SpecialPlayerCases) do
                    local matches = {string.match(tokenContent, "^" .. regex .. "$")}
                    if #matches > 0 then
                        foundCase = true
                        initialPlayers = removeTableMatches(initialPlayers, case(speaker, matches, initialPlayers))
                    end
                end
                if not foundCase then
                    initialPlayers = removeTableMatches(initialPlayers, getPlayersByName(tokenContent))
                end
            end
        end

        for i, v in pairs(initialPlayers) do
            table.insert(foundList, v)
        end
    end

    local foundNames = {}
    for i, v in pairs(foundList) do
        table.insert(foundNames, v.Name)
    end

    return foundNames
end

local Ids = {
    315453,
    998050,
    296529,
    171405,
    640907,
    73145,
    846434,
    193852,
    101167,
    113227,
    474836,
    474835,
    474834,
    181526230,
    181526229,
    181526228,
    181526227,
    181526226,
    181526225,
    188632011,
    188632010,
    18863209,
    180426354,
    125749145,
    129423131,
    129423130,
    125750800,
    147604027,
    125749145,
    125749145,
    128777973,
    129423131,
    129423030,
    128853357,
    125750702,
    125750800,
    125750618,
    125750544,
    125750759,
    147541880,
    147604027,
    146908722,
    146330398,
    144462739,
    144465399,
    144396364,
    144431365,
    144466905,
    148186686,
    147569414,
    144466905,
    144465399,
    144429224,
    28090085,
    146330398,
    144427269,
    144396364,
    144429719,
    144431365,
    144514206,
    93693205,
    90825039,
    90828653,
    87986341,
    33169596,
    35154961,
    45504977,
    33686061,
    32729592,
    33169583,
    31617132,
    30196114,
    28604759,
    28159255,
    28160593,
    147519638,
    121572214,
    146908722,
    144462739,
    148175580,
    147527133,
    147842537,
    27319342,
    147659445,
    148246688,
    147878673,
    147541880,
    147604027,
    146908722,
    146330398,
    144462739,
    144465399,
    144396364,
    144431365,
    144466905,
    144505104,
    144429719,
    144429224,
    144514206,
    146498853,
    146498184,
    147527133,
    147842537,
    147659445,
    148186686,
    147569414,
    144466905,
    144465399,
    144429224,
    28090085,
    146330398,
    144427269,
    144396364,
    144429719,
    144431365,
    144514206,
    93693205,
    90825039,
    90828653,
    87986341,
    33169596,
    35154961,
    45504977,
    33686061,
    32729592,
    33169583,
    31617132,
    30196114,
    28604759,
    28159255,
    28160593,
    147519638,
    121572214,
    146908722,
    144462739,
    148175580,
    147527133,
    147842537,
    27319342,
    147659445,
    148246688,
    147878673,
    148186686,
    147604027,
    146908722,
    146330398,
    144462739,
    144465399,
    144396364,
    144431365,
    144466905,
    144505104,
    144429719,
    144429224,
    144514206,
    146498853,
    146498184,
    147527133,
    147842537,
    147659445,
    144427269,
    148232683,
    147523286,
    148175580,
    147648892,
    149062704,
    149056458,
    148798307,
    148939100,
    148529127,
    148539095,
    148541449,
    148847130,
    148934067,
    148940417,
    148944935,
    148945823,
    149019533,
    147659445,
    147690759,
    147878673,
    148186686,
    147569414,
    125750544,
    125750618,
    125750800,
    125750800,
    125750702,
    125749145,
    128777973,
    128853357,
    130018893,
    132546839,
    132546884,
    129423131,
    129423030,
    146330398,
    144429719,
    144427269,
    147692745,
    147690759,
    147527133,
    147795898,
    148186686,
    144429719,
    148246688,
    144466905,
    149062704,
    144505104,
    144429719,
    144429224,
    144514206,
    146498853,
    146498184,
    144396364,
    144462739,
    148539095,
    148541449,
    148984323,
    148983310,
    148882950,
    148939100,
    47277200,
    46196309,
    48975505,
    48972923,
    45080940,
    27763939,
    71379944,
    71012326,
    57720291,
    55902220,
    148940417,
    148944935,
    148945823,
    149091294,
    149177711,
    149112669,
    149143977,
    147654458,
    147657600,
    147648892,
    147780719,
    147780449,
    147777149,
    148246499,
    148386452,
    148466590,
    148477107,
    148480425,
    148520267,
    149105580,
    149106372,
    149178756,
    149178321,
    144466905,
    144465399,
    144429224,
    28090085,
    146330398,
    144427269,
    144396364,
    144429719,
    144431365,
    144514206,
    93693205,
    90825039,
    90828653,
    87986341,
    33169596,
    35154961,
    45504977,
    33686061,
    32729592,
    33169583,
    31617132,
    30196114,
    28604759,
    28159255,
    28160593,
    147519638,
    121572214,
    146908722,
    144462739,
    148175580,
    147527133,
    147842537,
    27319342
}

local localplayer
local animation2
local animation
local animation3
local animation4
local hover = "rbxassetid://"
local plr = game.Players.LocalPlayer
local fly = "rbxassetid://"
local r = "rbxassetid://"
local l = "rbxassetid://"
local character
local loader
local loader2
local loader3
local loader4
local L_143_
local L_144_
local flying
local L_147_
local L_148_
local L_149_
local L_150_
_G.SC = false

local Corad_Notification = Instance.new("ScreenGui")
local queueonteleport = syn and syn.queue_on_teleport or queue_on_teleport or function()
    end
local isfile =
    isfile or
    function(file)
        local suc, res =
            pcall(
            function()
                return readfile(file)
            end
        )
        return suc and res ~= nil
    end
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local function EN(t)
    local Frame = Instance.new("Frame")
    local ImageLabel = Instance.new("ImageLabel")
    local Frame_2 = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")

    Corad_Notification.Name = "Corad_Notification"
    Corad_Notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Corad_Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = Corad_Notification
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.0155102042, 0, 0.804008901, 0)
    Frame.Size = UDim2.new(0, 282, 0, 146)

    ImageLabel.Parent = Frame
    ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageLabel.BackgroundTransparency = 1.000
    ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageLabel.BorderSizePixel = 0
    ImageLabel.Position = UDim2.new(0.496453881, 0, 0, 0)
    ImageLabel.Size = UDim2.new(0, 38, 0, 38)
    ImageLabel.Image = "rbxassetid://11419713314"

    Frame_2.Parent = Frame
    Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame_2.BorderSizePixel = 0
    Frame_2.Position = UDim2.new(0, 0, 0.253424644, 0)
    Frame_2.Size = UDim2.new(0, 282, 0, 1)

    TextLabel.Parent = Frame
    TextLabel.Text = t
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0, 0, -0.2, 0) --
    TextLabel.Size = UDim2.new(0, 282, 0, 107)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 30.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextYAlignment = Enum.TextYAlignment.Top

    Frame:TweenPosition(Udim2.new(0, 0, 0.260273963, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 1, false)
    wait(1)
    Frame:TweenPosition(Udim2.new(0, 0, -0.2, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 1, false)
    Frame:Destroy()
end

-- stolen also

-- stolen from vape v4 lol
if inputs:GetPlatform() ~= Enum.Platform.Windows then
    getgenv().getsynasset = nil
    getgenv().getcustomasset = nil
    getsynasset = nil
    getcustomasset = nil
end

-- stolen from inf yield
local transparent = false
function x(v)
    if v then
        for _, i in pairs(workspace:GetDescendants()) do
            if
                i:IsA("BasePart") and not i.Parent:FindFirstChildOfClass("Humanoid") and
                    not i.Parent.Parent:FindFirstChildOfClass("Humanoid")
             then
                i.LocalTransparencyModifier = 0.5 -- tf is a local transparency modifier
            end
        end
    else
        for _, i in pairs(workspace:GetDescendants()) do
            if
                i:IsA("BasePart") and not i.Parent:FindFirstChildOfClass("Humanoid") and
                    not i.Parent.Parent:FindFirstChildOfClass("Humanoid")
             then
                i.LocalTransparencyModifier = 0
            end
        end
    end
end

local ArrayField =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua"))()

local Window =
    ArrayField:CreateWindow(
    {
        Name = "< Tabs; Corad - " .. GameName,
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

                        ArrayField:Notify(
                            {
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
                            }
                        )
                    end
                }
            },
            Key = {"ThisKeyIsForCorad!!"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
        }
    }
)

local Home = Window:CreateTab("Home", 11433532654) -- Title, Image
local Player = Window:CreateTab("Player", 11422917864) -- Title, Image
local T = Window:CreateTab("Trollful", 12974399858) -- Title, Image
-- Home
Home:CreateLabel("Welcome " .. tostring(game.Players.LocalPlayer))
Home:CreateInput(
    {
        Name = "How do u feel",
        PlaceholderText = "",
        RemoveTextAfterFocusLost = false,
        Callback = function(Text)
            EN("You are " .. tostring(Text))
        end
    }
)

-- Player
Player:CreateToggle(
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
local speed =
    Player:CreateSlider(
    {
        Name = "Speed",
        Range = {16, 1000},
        Increment = 1,
        Suffix = "",
        CurrentValue = 16,
        Flag = "JumpPower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    }
)

local jp =
    Player:CreateSlider(
    {
        Name = "JumpPower",
        Range = {50, 1000},
        Increment = 1,
        Suffix = "",
        CurrentValue = 50,
        Flag = "JumpPower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    }
)

Player:CreateButton(
    {
        Name = "Default Speed",
        Interact = "Click",
        Callback = function()
            speed:Set(16)
        end
    }
)

Player:CreateButton(
    {
        Name = "Default JumpPower",
        Interact = "Click",
        Callback = function()
            jp:Set(50)
        end
    }
)

Player:CreateToggle(
    {
        Name = "Xray",
        Default = false,
        Callback = function(v)
            if v then
                transparent = true
                x(transparent)
            else
                transparent = false
                x(transparent)
            end
        end
    }
)

Player:CreateButton(
    {
        Name = "Reset",
        Interact = "Click",
        Callback = function()
            if game.Players.LocalPlayer.Character then
                if game.Players.LocalPlayer.Character.Health ~= 0 then
                    game.Players.LocalPlayer.Character.Humanoid.Health = 0
                else
                    print("Humanoid's health is 0")
                end
            else
                print("No character")
            end
        end
    }
)

Player:CreateButton(
    {
        Name = "ThirdPerson",
        Interact = "Click",
        Callback = function()
            speaker.CameraMode = "Classic"
        end
    }
)

Player:CreateButton(
    {
        Name = "Fling",
        Interact = "Click",
        Callback = function()
            local power = 1000 -- adjust this value to change the fling power
            local char = game.Players.LocalPlayer.Character

            local function fling()
                local bv = Instance.new("BodyVelocity")
                bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                local xOffset = math.random(-10, 10) -- adjust the range of the random offsets as needed
                local yOffset = math.random(-10, 10)
                local zOffset = math.random(-10, 10)
                bv.Velocity = (char.PrimaryPart.CFrame.LookVector + Vector3.new(xOffset, yOffset, zOffset)).unit * power
                bv.Parent = char.PrimaryPart
                wait(0.1)
                bv:Destroy()
            end

            local function rotate()
                while true do
                    local x, y, z = math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)
                    local rotation = CFrame.Angles(math.rad(x), math.rad(y), math.rad(z))
                    char:SetPrimaryPartCFrame(char.PrimaryPart.CFrame * rotation)
                    wait(0.1)
                end
            end

            spawn(fling)
            spawn(rotate)
        end
    }
)

Player:CreateButton(
    {
        Name = "FirstPerson",
        Interact = "Click",
        Callback = function()
            speaker.CameraMode = "LockFirstPerson"
        end
    }
)

Player:CreateButton(
    {
        Name = "Netless",
        Interact = "Click",
        Callback = function()
            for i, v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
                if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                    game:GetService("RunService").Heartbeat:connect(
                        function()
                            v.Velocity = Vector3.new(-30, 0, 0)
                        end
                    )
                end
            end

            game:GetService("StarterGui"):SetCore(
                "SendNotification",
                {
                    Title = "Coard",
                    Text = "Netless Ran, ReExecute when reset.",
                    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
                }
            )
            Duration = 16
        end
    }
)

Player:CreateSection("Animations", true)

Player:CreateButton(
    {
        Name = "Ninja",
        Interact = "Click",
        Callback = function()
            Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
            Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
            Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
            Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
            Animate.jump.jump.AnimationId = "http://www.roblox.com/asset/?id=656117878"
            Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
            Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
        end
    }
)

Player:CreateButton(
    {
        Name = "Mage",
        Interact = "Click",
        Callback = function()
            Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
            Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
            Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
            Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
            Animate.jump.jump.AnimationId = "http://www.roblox.com/asset/?id=707853694"
            Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
            Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
        end
    }
)

Player:CreateButton(
    {
        Name = "Pirate",
        Interact = "Click",
        Callback = function()
            Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
            Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
            Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
            Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
            Animate.jump.jump.AnimationId = "http://www.roblox.com/asset/?id=750782230"
            Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
            Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
        end
    }
)

Window:Prompt(
    {
        Title = "Welcome",
        SubTitle = "Hello, " .. game.Players.LocalPlayer.Name,
        Content = "Hello Corad has offically loaded this GUI is made by Tropxz. Please .",
        Actions = {
            Accept = {
                Name = "Accept",
                Callback = function()
                    print("Pressed")
                end
            }
        }
    }
)
-- Trollful

T:CreateToggle(
    {
        Name = "Spamming console",
        CurrentValue = false,
        Flag = "ConsoleSpam",
        Callback = function(Value)
            _G.SC = Value
        end
    }
)

local flinging = false
T:CreateToggle(
    {
        Name = "Spin Fling",
        CurrentValue = false,
        Flag = "Spin",
        Callback = function(v)
            if v then
                flinging = false
                for _, child in pairs(speaker.Character:GetDescendants()) do
                    if child:IsA("BasePart") then
                        child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
                    end
                end
                wait(0.1)
                local bambam = Instance.new("BodyAngularVelocity")
                bambam.Name = randomString()
                bambam.Parent = getRoot(speaker.Character)
                bambam.AngularVelocity = Vector3.new(0, 99999, 0)
                bambam.MaxTorque = Vector3.new(0, math.huge, 0)
                bambam.P = math.huge
                local Char = speaker.Character:GetChildren()
                for i, v in next, Char do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                        v.Massless = true
                        v.Velocity = Vector3.new(0, 0, 0)
                    end
                end
                flinging = true
                local function flingDiedF()
                    flinging = false
                    wait(0.1)
                    local speakerChar = speaker.Character
                    if not speakerChar or not getRoot(speakerChar) then
                        return
                    end
                    for i, v in pairs(getRoot(speakerChar):GetChildren()) do
                        if v.ClassName == "BodyAngularVelocity" then
                            v:Destroy()
                        end
                    end
                    for _, child in pairs(speakerChar:GetDescendants()) do
                        if child.ClassName == "Part" or child.ClassName == "MeshPart" then
                            child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
                        end
                    end
                end
                flingDied = speaker.Character:FindFirstChildOfClass("Humanoid").Died:Connect(flingDiedF)
                repeat
                    bambam.AngularVelocity = Vector3.new(0, 99999, 0)
                    wait(0.2)
                    bambam.AngularVelocity = Vector3.new(0, 0, 0)
                    wait(0.1)
                until flinging == false
            else
                flinging = false
                wait(0.1)
                local speakerChar = speaker.Character
                if not speakerChar or not getRoot(speakerChar) then
                    return
                end
                for i, v in pairs(getRoot(speakerChar):GetChildren()) do
                    if v.ClassName == "BodyAngularVelocity" then
                        v:Destroy()
                    end
                end
                for _, child in pairs(speakerChar:GetDescendants()) do
                    if child.ClassName == "Part" or child.ClassName == "MeshPart" then
                        child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
                    end
                end
            end
        end
    }
)

local function choose1(tab)
    return tab[math.random(1, #tab)] -- Select a random element from the table
end

T:CreateInput(
    {
        Name = "Spam console text (For everyone lol)",
        PlaceholderText = "Text",
        NumbersOnly = false,
        CharacterLimit = false,
        OnEnter = true,
        RemoveTextAfterFocusLost = false,
        Callback = function(v)
            if not _G.SC then
                return
            end
            if _G.SC and (v ~= "" and v ~= " ") then
                while _G.SC do
                    local anim = Instance.new("Animation")
                    anim.AnimationId = "rbxassetid://" .. choose1(Ids) .. " " .. tostring(v)
                    local animPlay = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
                    animPlay:Play()
                    wait(0.001)
                end
            end
        end
    }
)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local TextChannels = TextChatService:WaitForChild("TextChannels")
local RBXGeneral = TextChannels:WaitForChild("RBXGeneral")
local ReplicatedStorage = game.ReplicatedStorage or game:GetService("ReplicatedStorage")

local Message = function(Message, Location)
    if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Message, Location)
    else
        Location = "All"
        RBXGeneral:SendAsync(Message)
    end
end

T:CreateInput(
    {
        Name = "System chat (Beta Chat)",
        PlaceholderText = "Text",
        NumbersOnly = false,
        CharacterLimit = false,
        OnEnter = true,
        RemoveTextAfterFocusLost = false,
        Callback = function(v)
            local text = v
            Message(
                choose1(startmsg) ..
                    "                                                                                                                                {System}: " ..
                        tostring(text)
            )
        end
    }
)


local bangspeed = 3

T:CreateInput(
    {
        Name = "Bang",
        PlaceholderText = "Player name",
        OnEnter = true,
        RemoveTextAfterFocusLost = false,
        Callback = function(v1)
            wait()
            local players = getPlayer(v1, speaker)
            for _, v in pairs(players) do
                bangAnim = Instance.new("Animation")
                if not r15(speaker) then
                    bangAnim.AnimationId = "rbxassetid://148840371"
                else
                    bangAnim.AnimationId = "rbxassetid://5918726674"
                end
                bang = speaker.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(bangAnim)
                bang:Play(.1, 1, 1)
                bang:AdjustSpeed(tonumber(bangspeed))
            end
            local bangplr = Players:FindFirstChild(v1)
            if bangplr then
                local displayName = bangplr.DisplayName
                bangDied =
                    speaker.Character:FindFirstChildOfClass "Humanoid".Died:Connect(
                    function()
                        bangLoop:Disconnect()
                        bang:Stop()
                        bangAnim:Destroy()
                        bangDied:Disconnect()
                    end
                )
                local bangOffset = CFrame.new(0, 0, 1.1)
                bangLoop =
                    RunService.Stepped:Connect(
                    function()
                        pcall(
                            function()
                                local otherRoot = getTorso(bangplr.Character)
                                if otherRoot then
                                    getRoot(Players.LocalPlayer.Character).CFrame = otherRoot.CFrame * bangOffset
                                end
                            end
                        )
                    end
                )
            end
        end
    }
)



T:CreateButton(
    {
        Name = "Unbang",
        Interact = "Click",
        Callback = function()
            if bangLoop then
                bangLoop = bangLoop:Disconnect()
                bangDied:Disconnect()
                bang:Stop()
                bangAnim:Destroy()
            end
        end
    }
)

T:CreateInput(
    {
        Name = "Bang speed",
        PlaceholderText = "Text",
        NumbersOnly = true,
        CharacterLimit = false,
        OnEnter = true,
        RemoveTextAfterFocusLost = false,
        Callback = function(v)
            bangspeed = v
        end
    }
)

T:CreateInput(
    {
        Name = "Infect (Must have no accessorys on)",
        PlaceholderText = "Player name",
        NumbersOnly = false,
        CharacterLimit = false,
        OnEnter = true,
        RemoveTextAfterFocusLost = false,
        Callback = function(v)
            speaker.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
            if speaker.Character then
                for _,v in pairs(speaker.Character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
                    v.Parent = workspace
                end
            end
            speaker.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
            speaker.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
        end
    }
)



T:CreateInput(
    {
        Name = "Send a single message through the console",
        PlaceholderText = "Text",
        NumbersOnly = false,
        CharacterLimit = false,
        OnEnter = true,
        RemoveTextAfterFocusLost = false,
        Callback = function(v)
            if v ~= "" and v ~= " " then
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://" .. choose1(Ids) .. " " .. tostring(v)
                local animPlay = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim)
                animPlay:Play()
            end
        end
    }
)

T:CreateButton(
    {
        Name = "Adoptmesextoys",
        Interact = "Click",
        Callback = function()
            Message("adoptmesextoys")
        end
    }
)

T:CreateButton(
    {
        Name = "Adoptmesextape",
        Interact = "Click",
        Callback = function()
            Message("adoptmesextape")
        end
    }
)
toclipboard("https://discord.gg/kyGYj5brxN")
