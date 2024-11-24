local startgetTime = os.clock() or tick()

 identifyexecutor = newcclosure(function()
		return "BetterUtility", "3.0.2"
end)

assert(identifyexecutor, "Executor name not found!") -- Or we can instead just make it ourselves?

 function LoadIndependencies() -- Will be needed.

local printEnabled = true
local executorname = identifyexecutor() -- alright so we'll first begin by putting more aliases
 Identifyexecutor = identifyexecutor
 whatexecutoristhis = identifyexecutor
 executorName = identifyexecutor
 Executorname = identifyexecutor

 end 

 LoadIndependencies()


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui, PlayerGui = game:FindService("CoreGui"), LocalPlayer.PlayerGui
local Character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

LocalPlayer.CharacterAdded:Connect(function(char : Model)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
end)

assert(executorName, "Executor not found!")

local function dbgprint(message)
    assert(true, print("(Utility) [PRINT]: "..message))
end

local function dbgwarn(message)
    assert(true, warn("(Utility) [WARNING]: "..message))
end

do -- Print Utility Information
    local Contributors = {
        "Trax (traxxy123)",
        "RazAPIx64.dll (razzoni)", -- that's me by the way yes the Mr RazAPI guy
        "xyzkade (xyzkade)",
        "Sashaa169 (centerepic)"
    }

    local Version = "v3.0.3"

    local changeLog = {

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
        "Utility Stable " .. Version .. "\n",
        "Contact razzoni for any bugs or issues\n",
        "Contributors:\n",
        table.concat(Contributors, "\n"),
        "\n" .. changeLogString
    )
end

-- Removed useless celery patch

end

-- Synapse Save Instance boogaloo

local Params = {
    RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
    SSI = "saveinstance",
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

NukeUtility = function()
    getgenv().UtilityLoaded = nil
    getgenv().UtilityStorage = nil
    getgenv().Hooks = nil
    table.clear(getgenv().Remotes)
    getgenv().Remotes = {}
    getTime = nil
    hook = nil
    unhook = nil
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
-- NukeUtility() -- Uncomment if your testing Utility Source

local utilityVersion = "stable-dc772e43300b07754f4739b746938a15"
local update = string.gsub(game:HttpGet("https://raw.githubusercontent.com/liablelua/Utility/main/version_update.txt"), "^%s*(.-)%s*$", "%1")

if update ~= utilityVersion then
    table.insert(getgenv().UtilityStorage, getTime() .. ": Utility has a new update (" .. update .. ") and needs to be downloaded soon.")
end

if getgenv().UtilityLoaded ~= nil then

    if typeof(getgenv().UtilityLoaded) == "boolean" then
        if getgenv().UtilityLoaded then
            table.insert(getgenv().UtilityStorage, getTime()..": Utility has already been loaded, don't execute again.")
        else
            table.insert(getgenv().UtilityStorage, getTime()..": Utility is loading, don't execute again.")
        end
    else
        table.insert(getgenv().UtilityStorage, getTime()..": Utility has failed to load.")
    end

else
    local AntiTamper = {}
    getgenv().UtilityLoaded = false
    getgenv().UtilityStorage = {}
    getgenv().Hooks = {}
    getgenv().Remotes = {}
    
    table.insert(getgenv().UtilityStorage, getTime()..": Utility started.")

    hook = function(rem, func)
        if getgenv().Hooks[rem.Name] == nil then
            table.insert(getgenv().UtilityStorage, getTime()..": Used hook on "..rem.Name..".")
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
            table.insert(getgenv().UtilityStorage, getTime()..": Removed hook on "..rem.Name..".")
            getgenv().Hooks[rem.Name]:Disconnect()
            getgenv().Hooks[rem.Name] = nil
        end
    end

    remotescan = function(scan : Instance, deep : boolean)
        table.insert(getgenv().UtilityStorage, getTime()..": Used Remote Scan on "..scan.Name..".")
        local Children = scan:GetChildren()

        for _, b : Instance in next, Children do
            table.insert(getgenv().UtilityStorage, getTime() .. ": Scanned: " ..b.Name.. ".")
            dbgprint(b.Name .. " | " .. b.ClassName)
            if deep ~= nil then
                if typeof(deep) == "boolean" then
                    for _, d in b:GetChildren() do
                        table.insert(getgenv().UtilityStorage, getTime()..": Scanned: "..d.Name..".")
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
        table.insert(getgenv().UtilityStorage, getTime()..": Scanning, "..f.Name..".")

        for _, v : Instance in next, f:GetDescendants() do
            if v:IsA("RemoteEvent") and v.Parent:IsA("Folder") then
                table.insert(getgenv().Remotes, v)
            end
        end

    end
    
    key = function(keyInput, keyWeb)
        table.insert(getgenv().UtilityStorage, getTime()..": Key system loaded.")

        local theKey = string.gsub(game:HttpGet(keyWeb), "^%s*(.-)%s*$", "%1")

        if theKey == keyInput then
            return true
        else
            return false
        end
    end
    
    prompt = function(promptText : string, cancelText : string, acceptText : string, cancelFunction : any, acceptFunction : any)
        table.insert(getgenv().UtilityStorage, getTime()..": Prompt loaded.")

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
        table.insert(getgenv().UtilityStorage, getTime() .. ": Notification loaded.")

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
        table.insert(getgenv().UtilityStorage, getTime()..": Registered tamper variables.")
        for i, v in variables do
            AntiTamper[i] = v
        end
    end

    updateTamper = function(var,upd)
        table.insert(getgenv().UtilityStorage, getTime()..": Updated tamper variables.")
        AntiTamper[var] = upd
    end

    checkTamper = function(vars)
        table.insert(getgenv().UtilityStorage, getTime()..": Tamper check started.")
        local Tampered = false
        for i, v in vars do
            if not (AntiTamper[i] == v and v == vars[i]) then
                table.insert(getgenv().UtilityStorage, getTime()..": The variables were tampered with.")
                Tampered = true
            end
        end
        return Tampered
    end
    
    uload =  function(x)
        table.insert(getgenv().UtilityStorage, getTime()..": uload used for link: "..x..".")
        return loadstring(readfile(x))
    end
    
    headshot = function(id) 
        table.insert(getgenv().UtilityStorage, getTime()..": Headshot used for UID: "..tostring(id)..".")
        local HeadShot = Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        return HeadShot
    end

    logs = function(ret)

        if ret ~= nil then
            if ret then
                return getgenv().UtilityStorage
            end
        end

        for i,v in next, getgenv().UtilityStorage do
            dbgprint(v)
        end

    end

    antiskid = function(scOwner,scValue)
        table.insert(getgenv().UtilityStorage, getTime()..": Anti-Skid Protection Ran.")

        if scValue ~= scOwner then

            task.spawn(function()
                while task.wait() do
                    NukeUtility()
                end
            end)

            task.wait(2)

            LocalPlayer:Kick("❎ THE OWNER OF THIS SCRIPT IS A SKID ❎ [Kicked by Utility Anti-Skid]")

        end
    end

    speed = function(val : number)

        if Humanoid then
            Humanoid.WalkSpeed = val
        end

    end

    jump = function(val : number)
        
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
        table.insert(getgenv().UtilityStorage, getTime()..": Started compatibility test.")

        local testfuncs = {
            {hook, "Local Hooking"},
            {unhook, "Local Unhooking"},
            {remotescan, "Remote Scanner"},
            {key, "Key System"},
            {prompt, "Prompt Library"},
            {notification, "Notification Library"},
            {headshot, "Player Headshots"},
            {logs, "Utility Logger"},
            {speed, "Humanoid Properties"},
            {jump, "Humanoid Properties x2"},
            {swim, "Humanoid Properties x3"}
            {unc, "UNC Tests"},
            {iy, "Infinite Yield"},
            {fromhex, "Hex Conversions"}
        }

        for _, v in next, testfuncs do
            if v[1] == nil then
                dbgprint("❎ "..v[2].." not found.")
            else
                dbgprint("✅ "..v[2].." found.")
            end
        end

        if antiskid ~= nil then dbgprint("✅ antiskid function") else dbgprint("❎ antiskid function") 
            task.spawn(function()  
                while task.wait(1) do
                    NukeUtility()
                end
            end)
            task.wait(2)
            LocalPlayer:Kick("⚠️ THIS SKID THOUGHT HE COULD BYPASS ANTISKID? ⚠️")
        end

        if NukeUtility ~= nil then dbgprint("✅ NukeUtility function") else dbgprint("❎ NukeUtility function") 
            task.spawn(function()  
                while task.wait(1) do
                    NukeUtility()
                end
            end)
            task.wait(2)
            LocalPlayer:Kick("⚠️ THIS SKID THOUGHT HE COULD BYPASS ANTISKID? ⚠️")
        end

        if checkTamper ~= nil and updateTamper ~= nil and registerTampers ~= nil then dbgprint("✅ Tamper functions") else dbgprint("❎ Tamper functions") 
            task.spawn(function()  
                while task.wait(1) do
                    NukeUtility()
                end
            end)
            task.wait(2)
            LocalPlayer:Kick("⚠️ THIS SKID THOUGHT HE COULD BYPASS ANTISKID? ⚠️")
        end

        table.insert(getgenv().UtilityStorage, getTime() .. ": Finished compatibility test.")
    end

    -- Final Anti-Skid measures (unbypassable?)

    task.spawn(function()
        while task.wait(10) do
            if antiskid == nil or NukeUtility == nil or test == nil or checkTamper == nil or updateTamper == nil or registerTampers == nil then
                getgenv().UtilityLoaded = nil
                getgenv().UtilityStorage = nil
                getgenv().Hooks = nil
                getgenv().Remotes = {}
                getTime = nil
                hook = nil
                unhook = nil
                remotescan = nil
                key = nil
                prompt = nil
                notification = nil
                uload = nil
                headshot = nil
                logs = nil
                test = nil
                task.wait(2)
                LocalPlayer:Kick("⚠️ THIS SKID THOUGHT HE COULD BYPASS ANTISKID? ⚠️")
            end
        end
    end)
    
    table.insert(getgenv().UtilityStorage, getTime()..": Utility loaded.")

    runtests()

    getgenv().UtilityLoaded = true
end
