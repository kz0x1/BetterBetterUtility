-- Local Remote Viewer v1.0.2
-- kz: fixed spelling mistakes and fake loading
assert(BetterUtility, "BetterBetterUtility is not loaded as a table or string, please load it.")

-- why was this here
-- .
loadstring(game:HttpGet("https://raw.githubusercontent.com/kz0x1/BetterBetterUtility/main/Utility.lua"))()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "_xpluv's rviewer", HidePremium = false, SaveConfig = false, ConfigFolder = "bbu-rspy"})

local Tab = Window:MakeTab({
	Name = "BBU - Remote Viewer",
	Icon = "rbxassetid://10851817259",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Remotes"
})

-- scan everything (ez just added to Utility)
-- SOMEONE added a fake loading...
print("[BBU] Scanning for remotes...")
scanall(game.ReplicatedStorage)

--wait(2)

print("[BBU] Got all Remotes.")

-- remote sigma

for i = 1, #_G.Remotes do
    Tab:AddButton({
	    Name = _G.Remotes[i].Name,
	    Callback = function()
      		spy = function()
      		    notification("Spying on remotes like a spy!",1)
      		    hook(_G.Remotes[i], function(args) print(args) notification("Check console for ".._G.Remotes[i].Name.."'s response.",2) end)
      		end
      		
      		unspy = function()
      		    notification("No longer spying remotes.",1)
      		    unhook(_G.Remotes[i])
      		end
      		
      		prompt("Spy on this RemoteEvent?", "No", "Hell Yeah!", unspy, spy)
  	    end    
    })
end
