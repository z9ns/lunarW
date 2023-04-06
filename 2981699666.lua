local speed = 50 -- This is the fly speed. Change it to whatever you like. The variable can be changed while running
local c
local h
local bv
local bav
local cam
local flying
local p = game.Players.LocalPlayer
local buttons = {W = false, S = false, A = false, D = false, Moving = false}
local startFly = function() -- Call this function to begin flying 
    if not p.Character or not p.Character.Head or flying then return end
    c = p.Character
    h = c.Humanoid
    h.PlatformStand = true
    cam = workspace:WaitForChild('Camera')
    bv = Instance.new("BodyVelocity")
    bav = Instance.new("BodyAngularVelocity")
    bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
    bv.Parent = c.Head
    bav.Parent = c.Head
    flying = true
    h.Died:connect(function() flying = false end)
end
 
local endFly = function () -- Call this function to stop flying
    if not p.Character or not flying then return end
    h.PlatformStand = false
    bv:Destroy()
    bav:Destroy()
    flying = false
end
 

-- SETUP [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()
local player = game.Players.LocalPlayer
local character = workspace:FindFirstChild(player.Name)
local humanoid = character.Humanoid



local watermark = library:Watermark("lunar.will the best")
watermark:Hide() -- toggles watermark


local main = library:Load{
    Name = "lunar.xyz",
    SizeX = 500,
    SizeY = 600,
    Theme = "Midnight",
    Extension = "json", -- config file extension
    Folder = "lunarWll" -- config folder name
}

local generalTab = main:Tab("general")

local general = generalTab:Section{
Name = "",
Side = "Left"
}



-- MAIN SHIT [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  
local seperator = general:Seperator("     main     ")
local label = general:Label("hello, @"..player.Name..".")
local seperator = general:Seperator("misc")


general:Button{Name = "die", Callback = function()
	humanoid:TakeDamage(100)
end}




general:Label("name box")
local box = general:Box{
    Name = "name box",
    Default = ""..tostring(player.Name),
    Placeholder = "enter name",
    Flag = "nameBox",
    Callback = function(text)
        print("Box 1 is now " .. text)
		game:GetService("ReplicatedStorage"):WaitForChild("RPNE"):FireServer(tostring(text))
    end
}

general:Button{Name = "get tools", Callback = function()
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("MenuBar"):WaitForChild("EquipmentButton"):WaitForChild("ServerGui"):WaitForChild("FaceEvent"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("ExplosionTool"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("Injuries"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("Lightspeed"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("Notepad"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("Book"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("Flashlight"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("Cup"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("Equipment"):WaitForChild("WeaponEnergy"):WaitForChild("Script"):WaitForChild("Event"):FireServer()
wait(.01)
game:GetService("Players"):WaitForChild(player.Name):WaitForChild("PlayerGui"):WaitForChild("LWMenu"):WaitForChild("MenuBar"):WaitForChild("EquipmentButton"):WaitForChild("ServerGui"):WaitForChild("FaceEvent"):FireServer()
wait(.01)
end}

local seperator = general:Seperator("fly / noclip")

local toggle = general:Toggle{Name = "fly", Flag = "flyToggle", Default = false, Callback = function(state)
	if state == true then
		startFly()
		elseif state == false then
		endFly()
	end
end}	


general:Slider{
    Text = "[value] fly speed",
    Default = 50,
    Min = 16,
    Max = 900,
    Float = 5,
    Flag = "flySpeed",
    Callback = function(value)
        print("Toggle 3 Slider 1 is now " .. value)
		speed = value
    end
}

local seperator = general:Seperator("teleport stuff")


local placeDropdown = general:Dropdown{
    Name = "teleport to",
    --Default = "Option 1",
	Scrollable = true,
	ScrollingMax = 5,
    Content = {
        "Asgard",
        "Underworld",
        "Destroyed City",
        "-----------------",
		"Bridge",
		"Orange Apartment",
		"Blue Apartment",
		"L.A.B",
		"Asgard High",
		"Spawn",
    },
    Flag = "dropPlace",
    Callback = function(option)
        print("Dropdown 1 is now " .. tostring(option))
		if option == "Asgard" then
			workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(171.111, 514.221, -110.348)
			elseif option == "Underworld" then
				workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(168.025, 92, 50.166)
				elseif option == "Destroyed City" then
					workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(-366.7, 553.957, -7498.6)
						elseif option == "Bridge" then
						workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(171.968, 516.877, 42.0939)
						elseif option == "Orange Apartment" then
						workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(75.2548, 507.8, 567.257)
							elseif option == "Blue Apartment" then
						workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(4.66507, 507.8, 569.435)
							elseif option == "L.A.B" then
						workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(97.9818, 511.87, -361.942)
							elseif option == "Asgard High" then
						workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(4.0104, 507.805, -301.343)
					elseif option == "Spawn" then
						workspace:FindFirstChild(player.Name).HumanoidRootPart.CFrame = CFrame.new(-14101.3, 74.65, -1667.56)
		end
    end
}











-- HANDLERS [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  -- [+] --  






game:GetService("UserInputService").InputBegan:connect(function (input, GPE) 
    if GPE then return end
    for i, e in pairs(buttons) do
        if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
            buttons[i] = true
            buttons.Moving = true
        end
    end
end)
 
game:GetService("UserInputService").InputEnded:connect(function (input, GPE) 
    if GPE then return end
    local a = false
    for i, e in pairs(buttons) do
        if i ~= "Moving" then
            if input.KeyCode == Enum.KeyCode[i] then
                buttons[i] = false
            end
            if buttons[i] then a = true end
        end
    end
    buttons.Moving = a
end)
 
local setVec = function (vec)
    return vec * (speed / vec.Magnitude)
end
 
game:GetService("RunService").Heartbeat:connect(function (step) -- The actual fly function, called every frame
    if flying and c and c.PrimaryPart then
        local p = c.PrimaryPart.Position
        local cf = cam.CFrame
        local ax, ay, az = cf:toEulerAnglesXYZ()
        c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
        if buttons.Moving then
            local t = Vector3.new()
            if buttons.W then t = t + (setVec(cf.lookVector)) end
            if buttons.S then t = t - (setVec(cf.lookVector)) end
            if buttons.A then t = t - (setVec(cf.rightVector)) end
            if buttons.D then t = t + (setVec(cf.rightVector)) end
            c:TranslateBy(t * step)
        end
    end
end)

