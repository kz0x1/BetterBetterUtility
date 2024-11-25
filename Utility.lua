local startgetTime = os.clock() or tick()

getTime = function()
    local CurgetTime = os.date("!*t")
    local hour = CurgetTime.hour
    local minute = CurgetTime.min
    local second = CurgetTime.sec
    return "["..hour..":"..minute..":"..second.."]"
end

assert(identifyexecutor, "Executor name not found!")
 
originalidentifyexecutor = identifyexecutor()

 assert(true, warn("Running BetterUtility v3.0.4, Executor: "..identifyexecutor()))
 identifyexecutor = newcclosure(function()
		return "BetterUtility", "3.0.0"
end)

local BetterUtility = {}
BetAPI = BetterUtility
BetterUtility.WalkSpeed = function(speed)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = speed
    end
end

BetterUtility.HttpPost = game.HttpPostAsync
BetterUtility.HttpGet = game.HttpGetAsync

BetterUtility.Speed = BetterUtility.WalkSpeed
BetterUtility.SetSpeed = BetterUtility.WalkSpeed
BetterUtility.speed = BetterUtility.WalkSpeed

BetterUtility.LoadDecompiler = function() -- thank you konstant
    assert(getscriptbytecode, "Exploit not supported.") -- needed

local API: string = "http://api.plusgiant5.com"

local last_call = 0
local function call(konstantType: string, scriptPath: Script | ModuleScript | LocalScript): string
    local success: boolean, bytecode: string = pcall(getscriptbytecode, scriptPath)

    if (not success) then
        return `-- Failed to get script bytecode, error:\n\n--[[\n{bytecode}\n--]]`
    end

    local time_elapsed = os.clock() - last_call
    if time_elapsed <= .5 then
        task.wait(.5 - time_elapsed)
    end
    local httpResult = request({
        Url = API .. konstantType,
        Body = bytecode,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "text/plain"
        },
    })
    last_call = os.clock()
    
    if (httpResult.StatusCode ~= 200) then
        return `-- Error occured while requesting the API, error:\n\n--[[\n{httpResult.Body}\n--]]`
    else
        return httpResult.Body
    end
end

local function decompile(scriptPath: Script | ModuleScript | LocalScript): string
    return call("/konstant/decompile", scriptPath)
end

local function disassemble(scriptPath: Script | ModuleScript | LocalScript): string
    return call("/konstant/disassemble", scriptPath)
end

getgenv().decompile = decompile
getgenv().disassemble = disassemble

-- by lovrewe
end


 function LoadIndependencies() -- Will be needed.

local printEnabled = true
local executorname = identifyexecutor() -- alright so we'll first begin by putting more aliases
 Identifyexecutor = identifyexecutor
 whatexecutoristhis = identifyexecutor
 executorName = identifyexecutor
 Executorname = identifyexecutor

 end 

 LoadIndependencies()

-- Usual init

local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local Workspace = game:FindService("Workspace") or game.Workspace
local RobloxWorkspace = game:FindService("Workspace") or game.Workspace
local Players = game:FindService("Players") or game.Players
local RobloxPlayers = game:FindService("Players") or game.Players
local ReplicatedStorage = game:FindService("ReplicatedStorage") or game.ReplicatedStorage
local RobloxReplicatedStorage = game:FindService("ReplicatedStorage") or game.ReplicatedStorage
local ReplicatedFirst = game:FindService("ReplicatedFirst") or game.ReplicatedFirst
local Lighting = game:FindService("Lighting") or game.Lighting
local RobloxLighting = game:FindService("Lighting") or game.Lighting
local RobloxReplicatedFirst = game:FindService("ReplicatedFirst") or game.ReplicatedFirst
local CoreGui = game:FindService("CoreGui") or game.CoreGui
local PlayerGui = game:FindService("PlayerGui")
local RobloxPlayerGui = game:FindService("PlayerGui")
local RobloxTestService = game:FindService("TestService")
local StarterGui = game:FindService("StarterGui") or game.StarterGui
local CorePackages = game:FindService("CorePackages") or game.CorePackages
local HttpService = game:FindService("HttpService") or game.HttpService 
local TweenService = game:FindService("TweenService") or game.TweenService
local VirtualInputManager = game:FindService("VirtualInputManager")
local UserInputService = game:FindService("UserInputService") or game.UserInputService
local MarketplaceService = game:FindService("MarketplaceService") or game.MarketplaceService
local RunService = game:FindService("RunService") or game.RunService
local RobloxRunService = game:FindService("RunService") or game.RunService
local LogService = game:FindService("LogService") or game.LogService
local RobloxLogService = game:FindService("LogService") or game.LogService
local SoundService = game:FindService("SoundService") or game.SoundService
local LocalPlayer = Players.LocalPlayer
local RobloxTestService = cloneref(game:FindService("TestService") or game.TestService)

LocalPlayer.CharacterAdded:Connect(function(char : Model)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
end)

local executorName = identifyexecutor()
assert(executorName, "Executor not found!")


dbgprint = function(message1)
    assert(true, print("(BetterUtility): "..message1))
end

dbgwarn = function(message2)
    assert(true, warn("(BetterUtility): "..message2))
end

getfunctionaddress = function(func)
    if type(func) == "function" then
        local address = tostring(func):gsub("function: 0x", "")
            dbgprint("[GET_FUNCTION_ADDRESS]: Address: " .. address)
    else
        dbgprint("[GET_FUNCTION_ADDRESS]: Function does not exist")
    end
end

do -- Print Utility Information
    local Contributors = {
        "Trax (traxxy123)",
        "RazAPIx64.dll (razzoni)", -- that's me by the way yes the Mr RazAPI guy
        "xyzkade (xyzkade)",
        "Sashaa169 (centerepic)"
    }

    local Version = "v3.0.4"

    local changeLog = {

        ["v3.0.4"] = {
            "Added a Decompiler using Konstant (BetAPI.LoadDecompiler, BetterUtility.LoadDecompiler)",
            "Added BetAPI.WalkSpeed for more aliases, and also added a startup to get all services in the init."
        },

        ["v3.0.3"] = {
              "Minor Spelling Mistake Fixes", 
              "Added a function to load independencies automatically."
        },

		["v3.0.2"]  = {
			"Code Cleanup",
			 "I am now in charge of Utility thanks to liablelua",
			 "Added identifyexecutor and a shitty hookfunction"
		},

	    ["v3.0.1"] = {
		   "Minor update to hooks."
	    },
            ["v3.0.0"] = {
	          "Code cleanup",
		      "A lot of shit, look up the YT release announcement."
            },
	    ["v2.2.0"] = {
		    "Cleaned up and refactored code.",
		    "Increased integrity of utility, should be less error prone now."
	    },
        ["v2.1.1"] = {
            "Optimizations and more stuff by xyzkade!",
            "Character functions! (swim, speed, jump, sit)",
            "UNC test! (unc)"
        }
    }

    local changeLogString = ""

    for version, changes in next, changeLog do

        changeLogString = changeLogString .. "Changelog for " .. version .. ":\n"
        for _, change in next, changes do
            changeLogString = changeLogString .. " - " .. change .. "\n"
        end

    end

    dbgprint(
        "BetterUtility Stable " .. Version .. "\n",
        "Contact razzoni for any bugs or issues\n",
        "Contributors:\n",
        table.concat(Contributors, "\n"),
        "\n" .. changeLogString
    )
end

-- Removed useless celery patch


-- Synapse Save Instance boogaloo

local Params = {
    RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
    SSI = "saveinstance"
}

local synsaveinstance = loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()

do -- Save Instance Patch
    if saveinstance == nil then
        saveinstance = function(Options : Table)
            synsaveinstance(Options)
        end
    end
end


dbgprint("🛠️ Running Roblox Version: v" .. version())

DisableUtility = function()
    getgenv().Hooks = nil
    getgenv().Remotes = nil
     task.wait(0.4)
    getgenv().Remotes = {}
    getTime = nil
    hook = nil
    unhook = nil
    antiskid = nil
    remotescan = nil
    key = nil
    prompt = nil
    notification = nil
    uload = nil
    headshot = nil
    logs = nil
    test = nil
end

getTime = function()
    local CurgetTime = os.date("!*t")
    local hour = CurgetTime.hour
    local minute = CurgetTime.min
    local second = CurgetTime.sec
    return "["..hour..":"..minute..":"..second.."]"
end

-- Don't mind "getTime" it's used for logging certain things and whatnot.
 DisableUtility() -- Uncomment if your testing Utility Source


local utilityVersion = "stable-dc333e86145678994120-661_HASH"
local update = string.gsub(game:HttpGet("https://raw.githubusercontent.com/RazAPI/BetterUtility/main/version_update.txt"), "^%s*(.-)%s*$", "%1")


if update ~= utilityVersion then
    table.insert(getgenv().BetterUtilityStorage, getTime() .. ": Utility has a new update (" .. update .. ") and needs to be downloaded soon.")
end

getgenv().BetterUtilityStorage = getgenv().BetterUtilityStorage or {}

getgenv().BetterUtilityLoaded = "boolean"

    local AntiTamper = {}
    getgenv().BetterUtilityLoaded = false
    getgenv().BetterUtilityStorage = getgenv().BetterUtilityStorage or {}

    getgenv().Hooks = {}
    getgenv().Remotes = {}
    


    hook = function(rem, func)
        if getgenv().Hooks[rem.Name] == nil then
            table.insert(getgenv().BetterUtilityStorage, getTime()..": Used hook on "..rem.Name..".")
            local success, connection = pcall(function()
                return rem.OnClientEvent:Connect(func)
            end)
            if success then
                getgenv().Hooks[rem.Name] = connection
            else
                warn("Failed to hook "..rem.Name..": "..connection)
            end
        end
    end

    unhook = function(rem)
        if getgenv().Hooks[rem.Name] then
            table.insert(getgenv().BetterUtilityStorage, getTime()..": Removed hook on "..rem.Name..".")
            getgenv().Hooks[rem.Name]:Disconnect()
            getgenv().Hooks[rem.Name] = nil
        end
    end

    remotescan = function(scan : Instance, deep : boolean)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Used Remote Scan on "..scan.Name..".")
        local Children = scan:GetChildren()

        for _, b : Instance in next, Children do
            table.insert(getgenv().BetterUtilityStorage, getTime() .. ": Scanned: " ..b.Name.. ".")
            dbgprint(b.Name .. " | " .. b.ClassName)
            if deep ~= nil then
                if typeof(deep) == "boolean" then
                    for _, d in b:GetChildren() do
                        table.insert(getgenv().BetterUtilityStorage, getTime()..": Scanned: "..d.Name..".")
                        dbgprint(d.Name .. " | " .. d.ClassName)
                    end
                else
                    break
                end
            end
        end
    end


hookfunction = newcclosure(function(a, b) -- C Closures are the best
		b = a -- Shittiest, Delectablest, fucking method to use
end)
   
    
    scanall = function(f : Instance)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Scanning, "..f.Name..".")

        for _, v : Instance in next, f:GetDescendants() do
            if v:IsA("RemoteEvent") and v.Parent:IsA("Folder") then
                table.insert(getgenv().Remotes, v)
            end
        end

    end
    
    key = function(keyInput, keyWeb)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Key system loaded.")

        local theKey = string.gsub(game:HttpGet(keyWeb), "^%s*(.-)%s*$", "%1")

        if theKey == keyInput then
            return true
        else
            return false
        end
    end
    
    prompt = function(promptText : string, cancelText : string, acceptText : string, cancelFunction : any, acceptFunction : any)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Prompt loaded.")

        local CancelButton = Instance.new("TextButton")
        local AcceptButton = Instance.new("TextButton")

        do -- UI Initialization

            local prompt = Instance.new("ScreenGui")
            local Frame = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Frame_2 = Instance.new("Frame")
            local TextLabel = Instance.new("TextLabel")
            local TextLabel2 = Instance.new("TextLabel")
            
            local UICorner_2 = Instance.new("UICorner")

            local UICorner_3 = Instance.new("UICorner")
            local UISizeConstraint = Instance.new("UISizeConstraint")

            prompt.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            Frame.AnchorPoint = Vector2.new(0.5, 0.5)
            Frame.BackgroundColor3 = Color3.new(0.227451, 0.227451, 0.227451)
            Frame.BackgroundTransparency = 0.5
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
            Frame.Size = UDim2.new(0.300000012, 0, 0.300000012, 0)

            Frame_2.BackgroundColor3 = Color3.new(0.513726, 0.513726, 0.513726)
            Frame_2.BackgroundTransparency = 0.5
            Frame_2.BorderSizePixel = 0
            Frame_2.Position = UDim2.new(0, 0, 0.200000003, 0)
            Frame_2.Size = UDim2.new(1, 0, 0, 2)
            Frame_2.ZIndex = 2

            TextLabel.BackgroundTransparency = 1
            TextLabel.Position = UDim2.new(0, 0, 8.70190391e-08, 0)
            TextLabel.Size = UDim2.new(0, 350, 0, 35)
            TextLabel.Font = Enum.Font.BuilderSans
            TextLabel.Text = "Prompt"
            TextLabel.TextColor3 = Color3.new(1, 1, 1)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14
            TextLabel.TextWrapped = true

            TextLabel2.BackgroundTransparency = 1
            TextLabel2.Position = UDim2.new(8.70190391e-08, 0, 0.24522391, 0)
            TextLabel2.Size = UDim2.new(0, 350, 0, 74)
            TextLabel2.Font = Enum.Font.BuilderSans
            TextLabel2.Text = promptText
            TextLabel2.TextColor3 = Color3.new(1, 1, 1)
            TextLabel2.TextSize = 14
            TextLabel2.TextWrapped = true

            CancelButton.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.141176)
            CancelButton.BackgroundTransparency = 0.5
            CancelButton.BorderSizePixel = 0
            CancelButton.Position = UDim2.new(0.0251197852, 0, 0.666999996, 0)
            CancelButton.Size = UDim2.new(0.449999988, 0, 0.300000012, 0)
            CancelButton.Font = Enum.Font.BuilderSansExtraBold
            CancelButton.Text = cancelText
            CancelButton.TextColor3 = Color3.new(1, 1, 1)
            CancelButton.TextSize = 14

            AcceptButton.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.141176)
            AcceptButton.BackgroundTransparency = 0.5
            AcceptButton.BorderSizePixel = 0
            AcceptButton.Position = UDim2.new(0.520727217, 0, 0.666999996, 0)
            AcceptButton.Size = UDim2.new(0.449999988, 0, 0.300000012, 0)
            AcceptButton.Font = Enum.Font.BuilderSansExtraBold
            AcceptButton.Text = acceptText
            AcceptButton.TextColor3 = Color3.new(1, 1, 1)
            AcceptButton.TextSize = 14

            UISizeConstraint.MaxSize = Vector2.new(350, 175)
            UISizeConstraint.MinSize = Vector2.new(350, 175)

            UICorner_2.Parent = AcceptButton
            UISizeConstraint.Parent = Frame
            UICorner_3.Parent = AcceptButton
            AcceptButton.Parent = Frame
            AcceptButton.Parent = Frame
            TextLabel2.Parent = Frame
            TextLabel.Parent = Frame
            Frame_2.Parent = Frame
            UICorner.Parent = Frame
            Frame.Parent = prompt
            prompt.Parent = CoreGui

        end
        
        CancelButton.MouseButton1Down:Once(function()
            prompt:Destroy()
            cancelFunction()
        end)
        
        AcceptButton.MouseButton1Down:Connect(function()
            prompt:Destroy()
            acceptFunction()
        end)
    end
    
    notification = function(text : string, notificationTime : number)
        table.insert(getgenv().BetterUtilityStorage, getTime() .. ": Notification loaded.")

		local Notification = Instance.new("ScreenGui")
		
        do -- UI Initialization
            local Frame2 = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local Frame = Instance.new("Frame")
            local TextLabel = Instance.new("TextLabel")
            local TextLabel2 = Instance.new("TextLabel")
            local UISizeConstraint = Instance.new("UISizeConstraint")
            
            Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            Frame2.Parent = Notification
            Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
            Frame2.BackgroundColor3 = Color3.new(0.227451, 0.227451, 0.227451)
            Frame2.BackgroundTransparency = 0.5
            Frame2.BorderSizePixel = 0
            Frame2.Position = UDim2.new(0.5, 0, 0.150000006, 0)
            Frame2.Size = UDim2.new(0.300000012, 0, 0.185211286, 0)
            
            Frame.BackgroundColor3 = Color3.new(0.513726, 0.513726, 0.513726)
            Frame.BackgroundTransparency = 0.5
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(0, 0, 0.200000003, 0)
            Frame.Size = UDim2.new(1, 0, 0, 1)
            
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.Position = UDim2.new(8.70190391e-08, 0, 9.78964181e-08, 0)
            TextLabel.Size = UDim2.new(0, 350, 0, 24)
            TextLabel.Font = Enum.Font.BuilderSans
            TextLabel.Text = "Notification"
            TextLabel.TextColor3 = Color3.new(1, 1, 1)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14
            TextLabel.TextWrapped = true
            
            TextLabel2.BackgroundTransparency = 1
            TextLabel2.Position = UDim2.new(8.70190391e-08, 0, 0.24522391, 0)
            TextLabel2.Size = UDim2.new(0, 350, 0, 74)
            TextLabel2.Font = Enum.Font.BuilderSans
            TextLabel2.Text = text
            TextLabel2.TextColor3 = Color3.new(1, 1, 1)
            TextLabel2.TextSize = 14
            TextLabel2.TextWrapped = true
            
            UISizeConstraint.MaxSize = Vector2.new(350, 116)
            UISizeConstraint.MinSize = Vector2.new(350, 116)
            
            UISizeConstraint.Parent = Frame2
            TextLabel2.Parent = Frame2
            TextLabel.Parent = Frame2
            UICorner.Parent = Frame2
            Frame.Parent = Frame2
            Notification.Parent = CoreGui
        end

        task.delay(notificationTime, function()
            Notification:Destroy()
        end)
    end

    registerTampers = function(variables)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Registered tamper variables.")
        for i, v in variables do
            AntiTamper[i] = v
        end
    end

    updateTamper = function(var,upd)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Updated tamper variables.")
        AntiTamper[var] = upd
    end

    checkTamper = function(vars)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Tamper check started.")
        local Tampered = false
        for i, v in vars do
            if not (AntiTamper[i] == v and v == vars[i]) then
                table.insert(getgenv().BetterUtilityStorage, getTime()..": The variables were tampered with.")
                Tampered = true
            end
        end
        return Tampered
    end
    
    uload =  function(x)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": uload used for link: "..x..".")
        return loadstring(readfile(x))
    end
    
    headshot = function(id) 
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Headshot used for UID: "..tostring(id)..".")
        local HeadShot = Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        return HeadShot
    end

    logs = function(ret)

        if ret ~= nil then
            if ret then
                return getgenv().BetterUtilityStorage
            end
        end

        for i,v in next, getgenv().BetterUtilityStorage do
            dbgprint(v)
        end

    end

    antiskid = function(scOwner,scValue)
        table.insert(getgenv().BetterUtilityStorage, getTime()..": Anti-Skid Protection Ran.")

        if scValue ~= scOwner then

            task.spawn(function()
                while task.wait() do
                    DisableUtility()
                end
            end)

            task.wait(2)

            LocalPlayer:Kick("Player tampered with script [Kicked by BetterUtility Anti-Skid]")

        end
    end

    speed = function(val : number)

        if Humanoid then
            Humanoid.WalkSpeed = val
        end

    end

    jump = function(val)
        
        if Humanoid then
            Humanoid.JumpPower = val
        end

    end

    sit = function()

        if Humanoid then
            Humanoid.Sit = not Humanoid.Sit
        end
        
    end

    swim = function()

        if Humanoid then
            if Humanoid:GetState() ~= Enum.HumanoidStateType.Swimming then
                Humanoid:SetStateEnabled("GettingUp", false)
                Humanoid:ChangeState("Swimming")
            else
                Humanoid:SetStateEnabled("GettingUp", true)
            end
        end

    end

    unc = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/unified-naming-convention/NamingStandard/main/UNCCheckEnv.lua"))()
    end

	unctest = unc -- Adding aliases

    iy = function()
        task.spawn(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end)
    end

	infyield = iy

    fromhex = function(str : string)
        return str:gsub('..', function(cc) return string.char(tonumber(cc, 16)) end)
    end

    tohex = function(str : string)
        return str:gsub('.', function(c) return string.format('%02X', string.byte(c)) end)
    end
    
    runtests = function()
        dbgprint("")
        

        if antiskid ~= nil then dbgprint("✅ antiskid function") else dbgprint("⛔ antiskid function") 
            task.spawn(function()  
                while task.wait(1) do
                    DisableUtility()
                end
            end)
            task.wait(2)
            LocalPlayer:Kick("Attempted to bypass a Anti-Skid method-check.")
        end

        if DisableUtility() ~= nil then dbgprint("✅ DisableUtility function") else dbgprint("❎ DisableUtility() function") 
            task.spawn(function()  
                while task.wait(1) do
                    DisableUtility()
                end
            end)
            task.wait(2)
            LocalPlayer:Kick("Attempted to bypass a Anti-Skid method check.")
        end

        if checkTamper ~= nil and updateTamper ~= nil and registerTampers ~= nil then dbgprint("✅ Tamper functions") else dbgprint("❎ Tamper functions") 
            task.spawn(function()  
                while task.wait(1) do
                    DisableUtility()
                end
            end)
            task.wait(2)
            LocalPlayer:Kick("Attempted to bypass a Anti-Skid method check.")
        end
         getgenv().BetterUtilityStorage = true

        dbgprint" Finished compatibility test."
    end

    getgenv().BetterUtilityStorage = true
    
-- Removed anti-skid measures which actually bugged out

    runtests()

    getgenv().BetterUtilityLoaded = true
