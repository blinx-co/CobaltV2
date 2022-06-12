local lib = {}

lib["CreateWindow"] = function(title, accent)
	local cobalt = Instance.new("ScreenGui")
	local main = Instance.new("Frame")
	local mainLayout = Instance.new("UIListLayout")
	local mainTitle = Instance.new("TextLabel")
	local mainAccent = Instance.new("Frame")
	local mainStatus = Instance.new("TextLabel")
	local mainStatusPadding = Instance.new("UIPadding")
	local mainStatusButton = Instance.new("TextButton")
	
	local MainSize = 0
	
	local function resize(val)
		MainSize = MainSize + val
	end
	
	resize(32)
	
	cName = title or "Library"
	
	cobalt.Name = cName
	cobalt.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	cobalt.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	
	for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == cName then
            	print(cname.." Loaded!")
            end
	end

	main.Name = "main"
	main.Parent = cobalt
	main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	main.BorderSizePixel = 0
	main.Position = UDim2.new(0.437946707, 0, 0.355828226, 0)
	main.Size = UDim2.new(0, 190, 0, 50)
	main.ClipsDescendants = true
	main.Active = true
	main.Draggable = true

	mainLayout.Name = "mainLayout"
	mainLayout.Parent = main
	mainLayout.SortOrder = Enum.SortOrder.LayoutOrder
	mainLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

	mainTitle.Name = "mainTitle"
	mainTitle.Parent = main
	mainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	mainTitle.BackgroundTransparency = 1.000
	mainTitle.Size = UDim2.new(0, 190, 0, 32)
	mainTitle.Font = Enum.Font.Code
	mainTitle.LineHeight = 0.900
	mainTitle.Text = cName
	mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	mainTitle.TextSize = 20.000

	mainAccent.Name = "mainAccent"
	mainAccent.Parent = mainTitle
	mainAccent.BackgroundColor3 = accent
	mainAccent.BorderSizePixel = 0
	mainAccent.Position = UDim2.new(0, 0, 0.9375, 0)
	mainAccent.Size = UDim2.new(0, 190, 0, 2)
	
	local state = false
	local function miniClose()
		if state == false then
			state = true
			mainStatus.Text = "+"
			game:GetService("TweenService"):Create(main, TweenInfo.new(.1), {Size = UDim2.new(0,190,0,MainSize)}):Play()
		elseif state == true then
			state = false
			mainStatus.Text = "-"
			game:GetService("TweenService"):Create(main, TweenInfo.new(.1), {Size = UDim2.new(0,190,0,32)}):Play()
		end
	end
	
	mainStatus.Name = "mainStatus"
	mainStatus.Parent = mainTitle
	mainStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	mainStatus.BackgroundTransparency = 1.000
	mainStatus.Size = UDim2.new(0, 190, 0, 32)
	mainStatus.Font = Enum.Font.Code
	mainStatus.LineHeight = 0.900
	mainStatus.Text = "-"
	mainStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
	mainStatus.TextSize = 20.000
	mainStatus.TextXAlignment = Enum.TextXAlignment.Right

	mainStatusPadding.Name = "mainStatusPadding"
	mainStatusPadding.Parent = mainStatus
	mainStatusPadding.PaddingRight = UDim.new(0, 14)

	mainStatusButton.Name = "mainStatusButton"
	mainStatusButton.Parent = mainStatus
	mainStatusButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	mainStatusButton.BackgroundTransparency = 1.000
	mainStatusButton.Position = UDim2.new(0.931818187, 0, 0.25, 0)
	mainStatusButton.Size = UDim2.new(0, 16, 0, 16)
	mainStatusButton.Font = Enum.Font.SourceSans
	mainStatusButton.Text = ""
	mainStatusButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	mainStatusButton.TextSize = 14.000
	mainStatusButton.MouseButton1Click:Connect(miniClose)
	
	main.Size = UDim2.new(0, 190, 0, MainSize)
	
	local control = {}
	
	control["DestroyGui"] = function()
		warn("Destroying Gui...")
		wait(.1)
		main:Destroy()
	end
	
	control["CreateButton"] = function(text, callback)
		local callback = callback or function() end
		local button = Instance.new("Frame")
		local buttonBox = Instance.new("Frame")
		local buttonBoxActivator = Instance.new("TextButton")
		local buttonText = Instance.new("TextLabel")
		local atoggleTextPadding_2 = Instance.new("UIPadding")
		local buttonLayout = Instance.new("UIListLayout")
		
		resize(29)
		
		button.Name = "button"
		button.Parent = main
		button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		button.BackgroundTransparency = 1.000
		button.Position = UDim2.new(0, 0, 0.29756099, 0)
		button.Size = UDim2.new(0, 190, 0, 29)

		buttonBox.Name = "buttonBox"
		buttonBox.Parent = button
		buttonBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		buttonBox.BorderColor3 = Color3.fromRGB(56, 56, 56)
		buttonBox.Position = UDim2.new(0.018421052, 0, 0.155172408, 0)
		buttonBox.Size = UDim2.new(0, 179, 0, 20)

		buttonBoxActivator.Name = "buttonBoxActivator"
		buttonBoxActivator.Parent = buttonBox
		buttonBoxActivator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonBoxActivator.BackgroundTransparency = 1.000
		buttonBoxActivator.Size = UDim2.new(1, 0, 1, 0)
		buttonBoxActivator.Font = Enum.Font.SourceSans
		buttonBoxActivator.Text = ""
		buttonBoxActivator.TextColor3 = Color3.fromRGB(0, 0, 0)
		buttonBoxActivator.TextSize = 14.000
		buttonBoxActivator.MouseButton1Click:Connect(function()
			pcall(callback)
		end)

		buttonText.Name = "buttonText"
		buttonText.Parent = buttonBox
		buttonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonText.BackgroundTransparency = 1.000
		buttonText.Position = UDim2.new(0, 0, -0.0375000015, 0)
		buttonText.Size = UDim2.new(0, 179, 0, 23)
		buttonText.Font = Enum.Font.Roboto
		buttonText.Text = text or "Example Button"
		buttonText.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttonText.TextSize = 15.000

		atoggleTextPadding_2.Name = "atoggleTextPadding"
		atoggleTextPadding_2.Parent = buttonText
		atoggleTextPadding_2.PaddingLeft = UDim.new(0, 10)

		buttonLayout.Name = "buttonLayout"
		buttonLayout.Parent = button
		buttonLayout.FillDirection = Enum.FillDirection.Horizontal
		buttonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		buttonLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	end
	
	control["CreateToggle"] = function(text, callback)
		local actions = {}
		local callback = callback or function() end
		local toggle = Instance.new("Frame")
		local toggleBox = Instance.new("Frame")
		local toggleBoxActivator = Instance.new("TextButton")
		local toggleBoxState = Instance.new("TextLabel")
		local toggleLayout = Instance.new("UIListLayout")
		local atoggleText = Instance.new("TextLabel")
		local atoggleTextPadding = Instance.new("UIPadding")
		
		resize(29)
		
		local enabled = false
		
		toggle.Name = "toggle"
		toggle.Parent = main
		toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		toggle.BackgroundTransparency = 1.000
		toggle.Position = UDim2.new(0, 0, 0.156097561, 0)
		toggle.Size = UDim2.new(0, 190, 0, 29)

		toggleBox.Name = "toggleBox"
		toggleBox.Parent = toggle
		toggleBox.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
		toggleBox.BorderColor3 = Color3.fromRGB(56, 56, 56)
		toggleBox.Position = UDim2.new(0.810526311, 0, 0.21875, 0)
		toggleBox.Size = UDim2.new(0, 20, 0, 20)

		toggleBoxActivator.Name = "toggleBoxActivator"
		toggleBoxActivator.Parent = toggleBox
		toggleBoxActivator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		toggleBoxActivator.BackgroundTransparency = 1.000
		toggleBoxActivator.Size = UDim2.new(1, 0, 1, 0)
		toggleBoxActivator.Font = Enum.Font.SourceSans
		toggleBoxActivator.Text = ""
		toggleBoxActivator.TextColor3 = Color3.fromRGB(0, 0, 0)
		toggleBoxActivator.TextSize = 14.000

		toggleBoxState.Name = "toggleBoxState"
		toggleBoxState.Parent = toggleBox
		toggleBoxState.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		toggleBoxState.BackgroundTransparency = 1.000
		toggleBoxState.Size = UDim2.new(1, 0, 1, 0)
		toggleBoxState.Font = Enum.Font.SourceSans
		toggleBoxState.Text = ""
		toggleBoxState.TextColor3 = Color3.fromRGB(255, 255, 255)
		toggleBoxState.TextSize = 15.000

		toggleLayout.Name = "toggleLayout"
		toggleLayout.Parent = toggle
		toggleLayout.FillDirection = Enum.FillDirection.Horizontal
		toggleLayout.VerticalAlignment = Enum.VerticalAlignment.Center

		atoggleText.Name = "atoggleText"
		atoggleText.Parent = toggle
		atoggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		atoggleText.BackgroundTransparency = 1.000
		atoggleText.Position = UDim2.new(0, 0, 0.5625, 0)
		atoggleText.Size = UDim2.new(0, 163, 0, 23)
		atoggleText.Font = Enum.Font.Roboto
		atoggleText.Text = text or "Example Toggle"
		atoggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
		atoggleText.TextSize = 15.000
		atoggleText.TextXAlignment = Enum.TextXAlignment.Left

		atoggleTextPadding.Name = "atoggleTextPadding"
		atoggleTextPadding.Parent = atoggleText
		atoggleTextPadding.PaddingLeft = UDim.new(0, 10)
		
		local function fire()
			enabled = not enabled
			toggleBoxState.Text = enabled and utf8.char(10003) or ""
			pcall(callback, enabled)
		end
		
		toggleBoxActivator.MouseButton1Click:Connect(fire)
	end
	
	control["CreateDropdown"] = function(text, list, callback)
		callback = callback or function() end
		list = list or {}
		text = text or ""
		
		resize(30)
		
		local dropYSize = 0
		local isDropped = false
		
		local dropdown = Instance.new("Frame")
		local dropdownState = Instance.new("TextLabel")
		local dropdownStatePadding = Instance.new("UIPadding")
		local dropdownButton = Instance.new("TextButton")
		local dropdownDefault = Instance.new("TextLabel")
		local dropdownLayout = Instance.new("UIListLayout")
		
		dropdown.Name = "dropdown"
		dropdown.Parent = main
		dropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		dropdown.BorderColor3 = Color3.fromRGB(56, 56, 56)
		dropdown.Position = UDim2.new(0.0289473683, 0, 0.439024389, 0)
		dropdown.Size = UDim2.new(0, 179, 0, 20)
		dropdown.ClipsDescendants = true
		dropdown.ZIndex = 5555555

		dropdownState.Name = "dropdownState"
		dropdownState.Parent = dropdown
		dropdownState.AnchorPoint = Vector2.new(0.5, 0.5)
		dropdownState.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdownState.BackgroundTransparency = 1.000
		dropdownState.Position = UDim2.new(0.5, 0, 0.5, 0)
		dropdownState.Size = UDim2.new(1, 0, 1, 0)
		dropdownState.Font = Enum.Font.Roboto
		dropdownState.Text = "v"
		dropdownState.TextColor3 = Color3.fromRGB(255, 255, 255)
		dropdownState.TextSize = 14.000
		dropdownState.TextXAlignment = Enum.TextXAlignment.Right

		dropdownStatePadding.Name = "dropdownStatePadding"
		dropdownStatePadding.Parent = dropdownState
		dropdownStatePadding.PaddingRight = UDim.new(0, 3)

		dropdownButton.Name = "dropdownButton"
		dropdownButton.Parent = dropdownState
		dropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdownButton.BackgroundTransparency = 1.000
		dropdownButton.Position = UDim2.new(-0.0105263162, 0, 0.137931034, 0)
		dropdownButton.Size = UDim2.new(1, 0, 1, 0)
		dropdownButton.Font = Enum.Font.SourceSans
		dropdownButton.Text = ""
		dropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		dropdownButton.TextSize = 14.000

		dropdownDefault.Name = "dropdownDefault"
		dropdownDefault.Parent = dropdownState
		dropdownDefault.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdownDefault.BackgroundTransparency = 1.000
		dropdownDefault.Size = UDim2.new(1.03468204, 0, 1, 0)
		dropdownDefault.Font = Enum.Font.Roboto
		dropdownDefault.Text = text
		dropdownDefault.TextColor3 = Color3.fromRGB(255, 255, 255)
		dropdownDefault.TextSize = 14.000

		dropdownLayout.Name = "dropdownLayout"
		dropdownLayout.Parent = dropdown
		dropdownLayout.SortOrder = Enum.SortOrder.LayoutOrder
		
		local function close(state)
			state = false
			main.ClipsDescendants = true
			dropdown.Size = UDim2.new(0,179,0,20)
			dropdownState.Text = "^"
		end
		
		local function open(state)
			state = true
			main.ClipsDescendants = false
			dropdown.Size = UDim2.new(0,179,0, dropYSize)
			dropdownState.Text = "v"
		end
		
		dropdownButton.MouseButton1Click:Connect(function()
			if isDropped then
				isDropped = false
				main.ClipsDescendants = true
				dropdown.Size = UDim2.new(0,179,0,20)
				dropdownState.Text = "^"
			else
				isDropped = true
				main.ClipsDescendants = false
				dropdown.Size = UDim2.new(0,179,0, dropYSize)
				dropdownState.Text = "v"
			end
		end)

		dropdownState.Name = "dropdownState"
		dropdownState.Parent = dropdown
		dropdownState.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdownState.BackgroundTransparency = 1.000
		dropdownState.Position = UDim2.new(0.0289473683, 0, 0.155172408, 0)
		dropdownState.Size = UDim2.new(0, 179, 0, 22)
		dropdownState.Font = Enum.Font.Roboto
		dropdownState.Text = "v"
		dropdownState.TextColor3 = Color3.fromRGB(255, 255, 255)
		dropdownState.TextSize = 14.000
		dropdownState.TextXAlignment = Enum.TextXAlignment.Right

		dropdownStatePadding.Name = "dropdownStatePadding"
		dropdownStatePadding.Parent = dropdownState
		dropdownStatePadding.PaddingRight = UDim.new(0, 6)
		
		for i, v in next, list do
			local option = Instance.new("TextLabel")
			local optionButton = Instance.new("TextButton")

			option.Name = "option"
			option.Parent = dropdown
			option.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
			option.BorderColor3 = Color3.fromRGB(56, 56, 56)
			option.Position = UDim2.new(0, 0, 1, 0)
			option.Size = UDim2.new(0, 179, 0, 20)
			option.Font = Enum.Font.SourceSans
			option.Text = v
			option.TextColor3 = Color3.fromRGB(200, 200, 200)
			option.TextSize = 14.000

			optionButton.Name = "optionButton"
			optionButton.Parent = option
			optionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			optionButton.BackgroundTransparency = 1.000
			optionButton.Size = UDim2.new(1, 0, 1, 0)
			optionButton.Font = Enum.Font.Roboto
			optionButton.Text = ""
			optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			optionButton.TextSize = 14.000
			
			dropYSize = dropYSize + 20
			
			optionButton.MouseButton1Click:Connect(function()
				dropdownDefault.Text = v
				callback(v)
			end)
		end
	end

	return control
end

return lib
