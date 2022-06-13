local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/blinx-co/CobaltV2/main/Library.lua', true))()

local win = lib.CreateWindow("ClickingMadness","Synapse")
local p = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices

getgenv().tap = false
getgenv().rebirth = false
getgenv().egg = false

getgenv().eggType = nil

win.GuiKeybind(Enum.KeyCode.RightShift)

function doTap()
    spawn(function()
        while getgenv().tap == true do
            local a = {
                [1] = 1
            }
            p.ClickService.Click:FireServer(unpack(a))
            wait()
        end
    end)
end

function doRebirth(amount)
    spawn(function()
        while rebirth == true do
            p.RebirthService.BuyRebirths:FireServer(amount)
            wait()
        end
    end)
end

function doEgg(eType)
    spawn(function()
        while wait() do
            if not egg then break end
            p.EggService.Purchase:FireServer(eType)
        end
    end)
end

win.CreateButton("Destroy GUI", function()
    win.DestroyGui()
end)

win.CreateToggle("Auto Tap", function(bool)
    getgenv().tap = bool
    if bool then
        doTap()
    end
end)

local rValue = 1000

win.CreateToggle("Auto Rebirth", function(bool)
    getgenv().rebirth = bool
    if bool then
        doRebirth(rValue)
    end
end)

win.CreateTextBox("Rebirth Amount", function(b)
    rValue = b
end)

win.CreateToggle("Auto Hatch", function(bool)
    getgenv().egg = bool
    if bool then 
        doEgg(getgenv().eggType)
    end
end)

win.CreateTextBox("Egg Type", function(v)
    getgenv().eggType = v
end)

function teleportTo(a)
    local plr = game.Players.LocalPlayer;
    if plr.Character then
        plr.Character.HumanoidRootPart.CFrame = a;
    end
end

function teleportToWorld(worldName)
    if game:GetService("Workspace").Worlds:FindFirstChild(worldName) then
        teleportTo(game:GetService("Workspace").Worlds[worldName].Teleport.CFrame)
    end
end

win.CreateDropdown("Worlds",
    {"Lava", "Desert", "Ocean", "Winter", "Toxic", "Candy", "Forst", "Storm", "Blocks", "Space", "Dominus", "Infinity",
     "Future", "City", "Moon", "Fire"}, function(value)
        local plr = game.Players.LocalPlayer
        plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds[value].Teleport.CFrame
end)
