local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/blinx-co/CobaltV2/main/Library.lua', true))()

local win = lib.CreateWindow("GymTraining", "Synapse")
local vu = game:GetService("VirtualUser")

getgenv().energy = false

function runEnergy()
    spawn(function()
        while wait() do
            if not energy then break end
            vu:ClickButton1(Vector2.new(0,0),game:GetService("Workspace").CurrentCamera.CFrame)
            wait()    
        end    
    end) 
end

win.CreateToggle("Auto Energy", function(v)
    getgenv().energy = v
    if v then 
        runEnergy()
    end
end)

win.CreateButton("Quit", function()
    win.DestroyGui()    
end)
