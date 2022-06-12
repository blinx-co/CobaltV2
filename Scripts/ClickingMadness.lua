local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/blinx-co/CobaltV2/main/Library.lua', true))()

local win = lib.CreateWindow("ClickingMadness", Color3.fromRGB(25,65,188))
local p = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices

getgenv().autofarm = false;
getgenv().autorebirth = false;
getgenv().buyEgg = false;


function doTap()
    spawn(function()
        while getgenv().autofarm == true do 
            local a = {[1]=1}
            p.ClickService.Click:FireServer(unpack(a))
            wait()
        end    
    end)    
end

function doRebirth(amount) 
    spawn(function()
        while autoRebirth == true do
            local args = {
                [1] = amount
            }
            p.RebirthService.BuyRebirths:FireServer(unpack(args))
            wait()
        end
    end) 
end

function doEgg(type)
    spawn(function()
    while wait() do
        if not buyEgg then
            break
        end
        ars.EggService.Purchase:FireServer(type)
    end
end)

win.CreateButton("Destroy GUI", function()
    win.DestroyGui()    
end)

win.CreateToggle("Auto Tap", function(bool)
    getgenv().autofarm = bool
    if bool then 
        doTap()    
    end
end)

win.CreateToggle("Auto Rebirth", function(bool)
    getgenv().autofarm = bool
    if bool then 
        doRebirth(1000)   
    end
end)

win.CreateButton("Rage", function()
    game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.BeastModeService.Begin:FireServer()
end)

win.CreateToggle("Auto Hatch", function(bool)
    getgenv().buyEgg = bool
    if bool then
        doEgg('basic')
    end
end)

function teleportTo(a)
    local plr = game.Players.LocalPlayer;
    if plr.Character then
        plr.Character.HumanoidRootPart.CFrame = a;
    end
end

function teleportToWorld(args)
    if game:GetService("Workspace").Worlds:FindFirstChild(worldName) then
        teleportTo(game:GetService("Workspace").Worlds[worldName].Teleport.CFrame)
    end
end

local selectedWorld;

win.CreateDropdown("Worlds", {"Lava","Desert","Ocean","Winter","Toxic","Candy","Forst","Storm","Blocks","Space","Dominus","Infinity","Future","City","Moon","Fire"},function(value)
    local plr = game.Players.LocalPlayer
    plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds[value].Teleport.CFrame
end)
