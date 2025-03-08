--Mic Up Script

if game.PlaceId == 6884319169 or game.PlaceId == 15546218972 then
    print("executing")
    
    local success, vermLib = pcall(loadstring(game:HttpGet("https://pastebin.com/raw/2Azy6NsH")))
    if not success then
        warn("Failed to load vermLib: " .. tostring(vermLib))
        return
    end
    local window = vermLib:CreateWindow()
    local main = window:CreateTab("main", "Main", "") 
    local Player = window:CreateTab("Player", "LocalPlayer", "")
    local R15 = window:CreateTab("R15 Reanimate", "R15 Reanimate", "")
    local R6 = window:CreateTab("R6 Reanimate", "R6 Reanimate", "")
    local Target = window:CreateTab("Target", "Target", "")
    local Visuals = window:CreateTab("Visuals", "Visuals", "")
    local Animations = window:CreateTab("Animations", "Animations", "") 
    local Universal = window:CreateTab("Universal", "Universal", "")
    local Server = window:CreateTab("Server", "Server", "")
    local Credits = window:CreateTab("Credits", "Credits", "")
    local UserInputService = game:GetService("UserInputService")
    UserInputService = cloneref(game:GetService("UserInputService"))
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local plr = Players.LocalPlayer
    local workspace = game.Workspace
    local mouse = plr:GetMouse()
    local flying = false
    local ctrl = {f = 0, b = 0, l = 0, r = 0}
    local FlySpeed = 30  
    local currentAnim = nil
    local velocityHandlerName = "VelocityHandler"
    local gyroHandlerName = "GyroHandler"
    plr.CameraMaxZoomDistance = 800000
    local TweenService = game:GetService("TweenService")
    local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
    local walkSpeed, jumpPower = 16, 60
    local uis, mode = game:GetService("UserInputService"), ""
    local R15reanimated = false 
    local R6reanimated = false 
local HaxterFelix = {
        "", "Back Handstand", "Chest Lay", "Hugo Hilaire", "Corruption",  "Sit Jerk", 
        "Jerking Off", "Unknown", "S T A R", "Invisible", "Nazi Swastika"
    }

    local Shavine = {
        "", "Classic r6", "Shavine Script", "spaghetti",
        "Silly Dance", "No", "Yes", "Wave", "Point", "Scared", "AMOGUS", "wait🤚",
        "Chase", "Laugh", "CHAOS", "mayhem", "Tornado", "equinox", "ragdoll", "reverse ragdoll",
        "Pogo Stick", "fishy business", "siezrure funnier", "siezrure 2", "Sonic", "Creature", "ERRAH", 
        "Bacon God", "Dragged away"
    }

    local Random = {
        "","laying", 
        "sit", "rickroll", "wave", "dab", "blaze", "T", "float", "floss", "emote", 
        "pushups", "kazotsky", "L", "goofy trolus", "fe creepy crawler"
    }
    local TargetAnimation = {
        "", "Hawk Tuah", "Lap Dance", 
        "Thrust On Face", "Back Fuck"
    }
local selectedAnimationMode = ""

local AllBool = false
    local Targetnms = ""
    local OriginalCFrame 
    
    local GetPlayer = function(Name)
        Name = Name:lower()
        if Name == "all" or Name == "others" then
            AllBool = true
            return
        elseif Name == "random" then
            local GetPlayers = Players:GetPlayers()
            if table.find(GetPlayers, Player) then 
                table.remove(GetPlayers, table.find(GetPlayers, Player)) 
            end
            return GetPlayers[math.random(#GetPlayers)]
        else
            for _, x in next, Players:GetPlayers() do
                if x ~= Player then
                    if x.Name:lower():match("^" .. Name) or x.DisplayName:lower():match("^" .. Name) then
                        return x
                    end
                end
            end
        end
    end
    
    local function deepSearchAndProcess(parent)
        for _, child in ipairs(parent:GetChildren()) do
            
            if child:IsA("Script") and child.Name == "Kill" then
                
                local parentOfKill = child.Parent
                if parentOfKill then
                    parentOfKill:Destroy()
                end
                return  
            end
            
            
            if child:IsA("Texture") and child.Name == "Texture" then
                local parentOfTexture = child.Parent
                local grandparentOfTexture = parentOfTexture.Parent
                
                
                if grandparentOfTexture and grandparentOfTexture.Name == "Room" then
                    parentOfTexture.CanCollide = true
                end
                
                return  
            end
            
            deepSearchAndProcess(child)  
        end
    end
    
    
    deepSearchAndProcess(game:GetService("Workspace"))
    

    local function Message(title, text, duration)
        
        local notificationFrame = Instance.new("Frame")
        notificationFrame.Size = UDim2.new(0.150000006, 0, 0.0599999987, 0) 
        notificationFrame.Position = UDim2.new(0.370000005, 0, 0, -500) 
        notificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
        notificationFrame.BackgroundTransparency = 0
        notificationFrame.BorderSizePixel = 0
        notificationFrame.ClipsDescendants = true
        notificationFrame.Parent = ScreenGui
    
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 10) 
        corner.Parent = notificationFrame
    
        
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, 0, 0.5, 0) 
        titleLabel.Text = title
        titleLabel.TextColor3 = Color3.fromRGB(179, 0, 255) 
        titleLabel.BackgroundTransparency = 1 
        titleLabel.Parent = notificationFrame
        titleLabel.TextSize = 14
    
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 0.5, 0) 
        textLabel.Position = UDim2.new(0, 0, 0.5, 0) 
        textLabel.Text = text
        textLabel.TextColor3 = Color3.fromRGB(179, 0, 255) 
        textLabel.BackgroundTransparency = 1 
        textLabel.Parent = notificationFrame
        textLabel.TextSize = 14
        
        local tweenPosition = TweenService:Create(notificationFrame, TweenInfo.new(0.5), {
            Position = UDim2.new(0.430000007, 0, 0, 0) 
        })
    
        
        local fadeDuration = 0.6
        local tweenTransparencyFrame = TweenService:Create(notificationFrame, TweenInfo.new(fadeDuration), {
            BackgroundTransparency = 1
        })
        
        local tweenTransparencyTitle = TweenService:Create(titleLabel, TweenInfo.new(fadeDuration), {
            TextTransparency = 1
        })
    
        local tweenTransparencyText = TweenService:Create(textLabel, TweenInfo.new(fadeDuration), {
            TextTransparency = 1
        })
    
        
        tweenPosition:Play()
        tweenPosition.Completed:Wait() 
        wait(duration) 
    
        
        tweenTransparencyFrame:Play()
        tweenTransparencyTitle:Play()
        tweenTransparencyText:Play()
    
        
        tweenTransparencyFrame.Completed:Wait() 
    end
    
    
    local function removeBloxiliciousTool(player)
    
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        local tool = backpack:FindFirstChild("Bloxilicious")
        if tool then
            tool:Destroy() 
        end
    end

    
    local character = player.Character or player.CharacterAdded:Wait()
    if character then
        local tool = character:FindFirstChild("Bloxilicious")
        if tool then
            tool:Destroy() 
        end
    end
    end
    local function ToolEsp() 
        for _, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v ~= game:GetService("Players").LocalPlayer then
                local character = v.Character
                if character and character:FindFirstChild("Head") and character.Head:FindFirstChild("Name") == nil then
                    local head = character.Head
                    local a = Instance.new("BillboardGui", head)
                    a.Name = "Name"
                    a.AlwaysOnTop = true
                    a.Size = UDim2.new(8, 0, 1.5, 0)
                    a.StudsOffsetWorldSpace = Vector3.new(0, 2.635981321334839, 0)
                    local b = Instance.new("Frame", a)
                    b.Size = UDim2.new(1, 0, 1, 0)
                    b.BackgroundTransparency = 1
                    b.BorderSizePixel = 0
                    local c = Instance.new("TextLabel", b)
                    c.Text = v.Name
                    c.TextColor3 = Color3.fromRGB(125, 125, 125)
                    c.Size = UDim2.new(1, 0, 0.5, 0)
                    c.BackgroundTransparency = 1
                    c.BorderSizePixel = 0
                    c.TextSize = 12
                    c.TextStrokeTransparency = 0.7
                    c.TextScaled = true
                    c.RichText = true
                    c.TextWrapped = false
                end
            end
        end
    end
    local function ApplyESP() 
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if v ~= game:GetService("Players").LocalPlayer then
    local character = v.Character
    if character and character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart:FindFirstChild("Name") == nil then
        local HumanoidRootPart = character.HumanoidRootPart
        local a = Instance.new("BillboardGui", HumanoidRootPart)
        a.Name = "Name"
        a.AlwaysOnTop = true
        a.Size = UDim2.new(8, 0, 1.5, 0)
        a.StudsOffsetWorldSpace = Vector3.new(0, 2.635981321334839, 0)
        local b = Instance.new("Frame", a)
        b.Size = UDim2.new(1, 0, 1, 0)
        b.BackgroundTransparency = 1
        b.BorderSizePixel = 0
        local c = Instance.new("TextLabel", b)
        c.Text = v.Name
        c.TextColor3 = Color3.fromRGB(125, 125, 125)
        c.Size = UDim2.new(1, 0, 0.5, 0)
        c.BackgroundTransparency = 1
        c.BorderSizePixel = 0
        c.TextSize = 12
        c.TextStrokeTransparency = 0.7
        c.TextScaled = true
        c.RichText = true
        c.TextWrapped = false
    end
    end
    end
    end




    local function ApplyChams(player)
    if player.Character then
    if player.Character:FindFirstChild("Highlight") == nil then
    local char = player.Character
    local highlight = Instance.new("Highlight", char)
    highlight.FillTransparency = 0.9
    highlight.FillColor = Color3.fromRGB(110, 37, 135)
    highlight.OutlineTransparency = 0.6
    end
    end
end

main:CreateToggle("Avoid Tool Abusers (Lag)", function(AvoidLagTools)
    getgenv().AvoidLagToolss = AvoidLagTools
    while true do 
        wait(0)
        if not getgenv().AvoidLagToolss then
            return 
        end
        
        
        for _, player in ipairs(Players:GetPlayers()) do
            removeBloxiliciousTool(player)
        end
    end
end)
        
        main:CreateButton("Teleport To AvatarUI", function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            
            
            local Avatar_UI = game:GetService("Workspace"):FindFirstChild("AvatarUI")
            
            if Avatar_UI then
                
                local Dislike_Button = Avatar_UI:FindFirstChild("DislikeButton") or Avatar_UI:WaitForChild("DislikeButton")
                
                if Dislike_Button then
                    
                    local dislikePosition = Dislike_Button.Position
                    
                    
                    local teleportPosition = dislikePosition + Vector3.new(-5, 0, -2.5)  
                    
                    
                    local rayOrigin = teleportPosition + Vector3.new(0, 10, 0)  
                    local rayDirection = Vector3.new(0, -20, 0)  
                    local raycastResult = workspace:Raycast(rayOrigin, rayDirection)
            
                    if raycastResult then
                        
                        teleportPosition = raycastResult.Position
                    else
                        warn("No ground detected below the teleport position!")
                    end
                    
                    
                    local rotation = CFrame.Angles(0, math.rad(-90), 0)  
                    
                    
                    character:SetPrimaryPartCFrame(CFrame.new(teleportPosition) * rotation)
                    print("Teleported to AvatarUI, perfectly on the ground.")
                else
                    warn("DislikeButton not found in AvatarUI!")
                end
            else
                warn("AvatarUI not found in Workspace!")
            end
                                end)
        
                main:CreateToggle("Auto Dislike", function(Auto_Dislike)
                    getgenv().Auto_Dislikes = Auto_Dislike
                    while true do
                        if not getgenv().Auto_Dislikes then
                            return 
                        end
                        
                        local Avatar_UI = game:GetService("Workspace"):FindFirstChild("AvatarUI")
                        
                        if Avatar_UI then
                            local Dislike_Button = Avatar_UI:FindFirstChild("DislikeButton") or Avatar_UI:WaitForChild("DislikeButton")
                            local Click_Detector_Input = Dislike_Button:FindFirstChild("ClickDetector")
                            
                            if Click_Detector_Input then
                                fireclickdetector(Click_Detector_Input, 999)
                            else
                                warn("ClickDetector not found in DislikeButton!")
                            end
                        else
                            warn("AvatarUI not found in Workspace!")
                        end
                        
                        wait(8.1)
                    end
                end)

                main:CreateToggle("Auto Like", function(Auto_Like)
                    getgenv().Auto_Likes = Auto_Like
                    while true do
                        if not getgenv().Auto_Likes then
                            return 
                        end
                        
                        local Avatar_UI = game:GetService("Workspace"):FindFirstChild("AvatarUI")
                        
                        if Avatar_UI then
                            local Like_Button = Avatar_UI:FindFirstChild("LikeButton") or Avatar_UI:WaitForChild("LikeButton")
                            local Click_Detector_Input = Like_Button:FindFirstChild("ClickDetector")
                            
                            if Click_Detector_Input then
                                fireclickdetector(Click_Detector_Input, 999)
                            else
                                warn("ClickDetector not found in LikeButton!")
                            end
                        else
                            warn("AvatarUI not found in Workspace!")
                        end
                        
                        wait(8.1)
                    end
                end)
                
    
                
        Visuals:CreateToggle("Player ESP", function(PlayerESO)
            getgenv().PlayerESP = PlayerESO
            while true do
                if getgenv().PlayerESP then
                    ApplyESP()
                else
                    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
                        if v ~= game:GetService("Players").LocalPlayer then
                            local character = v.Character
                            if character and character:FindFirstChild("HumanoidRootPart") then
                                local HumanoidRootPart = character.HumanoidRootPart
                                local nameGui = HumanoidRootPart:FindFirstChild("Name")
                                if nameGui then
                                    nameGui:Destroy()
                                end
                            end
                        end
                    end
                end
                wait(1) 
            end
        end)
    
        Visuals:CreateToggle("Player Chams", function(PlayerChams)
            getgenv().PlayerChams = PlayerChams
        
            if PlayerChams then
                
                Players.PlayerAdded:Connect(function(player)
                    player.CharacterAdded:Connect(function(character)
                        ApplyChams(player)
                    end)
                end)
                
                
                for _, player in pairs(Players:GetPlayers()) do
                    player.CharacterAdded:Connect(function(character)
                        ApplyChams(player)
                    end)
                    
                    ApplyChams(player)
                end
            else
                
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= Players.LocalPlayer then
                        local highlight = v.Character and v.Character:FindFirstChild("Highlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end)
        
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    
    getgenv().AimAtHeadEnabled = false 
    Universal:CreateButton("Universal Emotes", function(state)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LmaoItsCrazyBro/qweytguqwebuqt/refs/heads/main/marked_esp_system_ai"))()
    end)
    Universal:CreateButton("Infinite Yield", function(state)
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end)
    local R6animationSpeed = 5
    local R15animationSpeed = 0.65 
    local tpwalking = false -- To control teleport walking
    local teleportWalkValue = 1 -- Base increment value for teleport walking
    local CurrentTeleportWalk = 0 -- Keeps track of the current teleport walk speed
    
    local plr = game.Players.LocalPlayer
    
    local function startTeleportWalking()
        tpwalking = true
        local chr = plr.Character
        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
        local hb = game:GetService("RunService").Heartbeat
    
        while tpwalking and chr and hum and hum.Parent do
            local delta = hb:Wait()
            if hum.MoveDirection.Magnitude > 0 then
                chr:TranslateBy(hum.MoveDirection * (teleportWalkValue + CurrentTeleportWalk) * delta)
            end
        end
    end
    
    local UserInputService = game:GetService("UserInputService")
    local isQPressed = false
    local isRPressed = false
    
    local function incrementTeleportWalk()
        while isQPressed do
            CurrentTeleportWalk = CurrentTeleportWalk + 1 -- Increment the current teleport walk speed
            wait(0.05) -- Wait for 0.3 seconds before the next increment
        end
    end
    local function adjustWalkSpeed()
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = math.max(1, walkSpeeder)
        end
    end
    
    local function holdKeyAdjustment(amount)
        while isQPressed or isRPressed do
            walkSpeeder = math.max(1, walkSpeeder + amount)
            adjustWalkSpeed()
            wait(0.05) -- Adjust the wait time as necessary
        end
    end
    UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
        if not gameProcessedEvent then
            if input.KeyCode == Enum.KeyCode.Q then
                if not isQPressed then
                    isQPressed = true
                    coroutine.wrap(incrementTeleportWalk)() -- Start incrementing teleport walk speed
                    startTeleportWalking() -- Start teleport walking when Q is pressed
                end
            elseif input.KeyCode == Enum.KeyCode.R then
                if not isRPressed then
                    isRPressed = true
                    tpwalking = false -- Stop teleport walking when "R" is pressed
                    CurrentTeleportWalk = 0 -- Reset current teleport walk speed
                    teleportWalkValue = 1 -- Reset teleport walk value to base
                end
            end
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
        if not gameProcessedEvent then
            if input.KeyCode == Enum.KeyCode.Q then
                isQPressed = false
            elseif input.KeyCode == Enum.KeyCode.R then
                isRPressed = false
            end
        end
    end)
    
    Player:CreateSlider("Walk Speed", 1, 100, 16, function(WalkspeedAdjuster)
        walkSpeeder = WalkspeedAdjuster
        adjustWalkSpeed()
    end)
 
    R6:CreateSlider("Animation Speed Adjuster", 0, 100, 65, function(R6AnimationSpeedChanger)
        R6animationSpeed = R6AnimationSpeedChanger
    end)
    R15:CreateSlider("Animation Speed Adjuster", 0, 100, 65, function(R15AnimationSpeedChanger)
        
        R15animationSpeed = R15AnimationSpeedChanger / 100 
    end)
    Player:CreateToggle("Invis Cam", function(InvisCam)
        if InvisCam then
        game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
    else
        game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Zoom"
    end
    end)
R6:CreateButton("R6 Reanimate", function(state)
        if R15reanimated or plr.Character.Humanoid.Health == 0 then
            Message("R15 Reanimate Status:", "Active", 5)
            return 
        end
        R6reanimated = true
        if "HaxterFelix is the best" then
    
            local v3_net, v3_808 = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)    
            local function getNetlessVelocity(realPartVelocity)
                local mag = realPartVelocity.Magnitude
                if mag > 0 then
                    local unit = realPartVelocity.Unit
                    if (unit.Y > 0.0) or (unit.Y < -0.0) then
                        return unit * (0.0 / unit.Y)
                    end
                end
                return v3_net + realPartVelocity * v3_808
            end
            game.ReplicatedStorage:WaitForChild("RagdollEvent"):FireServer()
    
            
            local simradius = "shp" 
            local simrad = 0 
            local healthHide = false 
            local reclaim = true 
            
    
            local novoid = true 
            local physp = nil 
    
            local noclipAllParts = false 
            local antiragdoll = false 
            local newanimate = false 
            local discharscripts = false 
            local R15toR6 = true 
            local hatcollide = false 
            local humState16 = true 
            local addtools = false 
            local hedafterneck = true 
            local loadtime = game:GetService("Players").RespawnTime + 0.5 
            local method = 3 
    
            
            local alignmode = 4 
            local flingpart = "HumanoidRootPart" 
    
            local lp = game:GetService("Players").LocalPlayer
            local rs, ws, sg = game:GetService("RunService"), game:GetService("Workspace"), game:GetService("StarterGui")    local stepped, heartbeat, renderstepped = rs.Stepped, rs.Heartbeat, rs.RenderStepped
            local twait, tdelay, rad, inf, abs, clamp = task.wait, task.delay, math.rad, math.huge, math.abs, math.clamp
            local cf, v3 = CFrame.new, Vector3.new
            local angles = CFrame.Angles
            local v3_0, cf_0 = v3(0, 0, 0), cf(0, 0, 0)
    
            local c = lp.Character
            if not (c and c.Parent) then
                return
            end
    
            c:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (c and c.Parent) then
                    c = nil
                end
            end)
    
            local clone, destroy, getchildren, getdescendants, isa = c.Clone, c.Destroy, c.GetChildren, c.GetDescendants, c.IsA
    
            local function gp(parent, name, className)
                if typeof(parent) == "Instance" then
                    for i, v in pairs(getchildren(parent)) do
                        if (v.Name == name) and isa(v, className) then
                            return v
                        end
                    end
                end
                return nil
            end
    
            local fenv = getfenv()
    
            local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
            local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.setsimrad or fenv.set_sim_rad
    
            healthHide = healthHide and ((method == 0) or (method == 3)) and gp(c, "Head", "BasePart")
    
            local reclaim, lostpart = reclaim and c.PrimaryPart, nil
    
            local function align(Part0, Part1)
    
                local att0 = Instance.new("Attachment")
                att0.Position, att0.Orientation, att0.Name = v3_0, v3_0, "att0_" .. Part0.Name
                local att1 = Instance.new("Attachment")
                att1.Position, att1.Orientation, att1.Name = v3_0, v3_0, "att1_" .. Part1.Name
            
                if alignmode == 4 then
                
                    local hide = false
                    if Part0 == healthHide then
                        healthHide = false
                        tdelay(0, function()
                            while twait(2.9) and Part0 and c do
                                hide = #Part0:GetConnectedParts() == 1
                                twait(0.1)
                                hide = false
                            end
                        end)
                    end
    
                    local rot = rad(0.05)
                    local con0, con1 = nil, nil
                    con0 = stepped:Connect(function()
                        if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
                        Part0.RotVelocity = Part1.RotVelocity
                    end)
                    local lastpos = Part0.Position
                    con1 = heartbeat:Connect(function(delta)
                        if not (Part0 and Part1 and att1) then return con0:Disconnect() and con1:Disconnect() end
                        if (not Part0.Anchored) and (Part0.ReceiveAge == 0) then
                            if lostpart == Part0 then
                                lostpart = nil
                            end
                            rot = -rot
                            local newcf = Part1.CFrame * att1.CFrame * angles(0, 0, rot)
                            if Part1.Velocity.Magnitude > 0.01 then
                                Part0.Velocity = getNetlessVelocity(Part1.Velocity)
                            else
                                Part0.Velocity = getNetlessVelocity((newcf.Position - lastpos) / delta)
                            end
                            lastpos = newcf.Position
                            if lostpart and (Part0 == reclaim) then
                                newcf = lostpart.CFrame
                            elseif hide then
                                newcf += v3(0, 3000, 0)
                            end
                            if novoid and (newcf.Y < ws.FallenPartsDestroyHeight + 0.1) then
                                newcf += v3(0, ws.FallenPartsDestroyHeight + 0.1 - newcf.Y, 0)
                            end
                            Part0.CFrame = newcf
                        elseif (not Part0.Anchored) and (abs(Part0.Velocity.X) < 45) and (abs(Part0.Velocity.Y) < 25) and (abs(Part0.Velocity.Z) < 45) then
                            lostpart = Part0
                        end
                    end)
                
                else
    
                    Part0.CustomPhysicalProperties = physp
                    if (alignmode == 1) or (alignmode == 2) then
                        local ape = Instance.new("AlignPosition")
                        ape.MaxForce, ape.MaxVelocity, ape.Responsiveness = inf, inf, inf
                        ape.ReactionForceEnabled, ape.RigidityEnabled, ape.ApplyAtCenterOfMass = false, true, false
                        ape.Attachment0, ape.Attachment1, ape.Name = att0, att1, "AlignPositionRtrue"
                        ape.Parent = att0
                    end
    
                    if (alignmode == 2) or (alignmode == 3) then
                        local apd = Instance.new("AlignPosition")
                        apd.MaxForce, apd.MaxVelocity, apd.Responsiveness = inf, inf, inf
                        apd.ReactionForceEnabled, apd.RigidityEnabled, apd.ApplyAtCenterOfMass = false, false, false
                        apd.Attachment0, apd.Attachment1, apd.Name = att0, att1, "AlignPositionRfalse"
                        apd.Parent = att0
                    end
    
                    local ao = Instance.new("AlignOrientation")
                    ao.MaxAngularVelocity, ao.MaxTorque, ao.Responsiveness = inf, inf, inf
                    ao.PrimaryAxisOnly, ao.ReactionTorqueEnabled, ao.RigidityEnabled = false, false, false
                    ao.Attachment0, ao.Attachment1 = att0, att1
                    ao.Parent = att0
    
                    local con0, con1 = nil, nil
                    local vel = Part0.Velocity
                    con0 = renderstepped:Connect(function()
                        if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
                        Part0.Velocity = vel
                    end)
                    local lastpos = Part0.Position
                    con1 = heartbeat:Connect(function(delta)
                        if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
                        vel = Part0.Velocity
                        if Part1.Velocity.Magnitude > 0.01 then
                            Part0.Velocity = getNetlessVelocity(Part1.Velocity)
                        else
                            Part0.Velocity = getNetlessVelocity((Part0.Position - lastpos) / delta)
                        end
                        lastpos = Part0.Position
                    end)
                
                end
            
                att0:GetPropertyChangedSignal("Parent"):Connect(function()
                    Part0 = att0.Parent
                    if not isa(Part0, "BasePart") then
                        att0 = nil
                        if lostpart == Part0 then
                            lostpart = nil
                        end
                        Part0 = nil
                    end
                end)
                att0.Parent = Part0
    
                att1:GetPropertyChangedSignal("Parent"):Connect(function()
                    Part1 = att1.Parent
                    if not isa(Part1, "BasePart") then
                        att1 = nil
                        Part1 = nil
                    end
                end)
                att1.Parent = Part1
            end
    
            local function respawnrequest()
                local ccfr, c = ws.CurrentCamera.CFrame, lp.Character
                lp.Character = nil
                lp.Character = c
                local con = nil
                con = ws.CurrentCamera.Changed:Connect(function(prop)
                    if (prop ~= "Parent") and (prop ~= "CFrame") then
                        return
                    end
                    ws.CurrentCamera.CFrame = ccfr
                    con:Disconnect()
                end)
            end
    
            local destroyhum = (method == 4) or (method == 5)
            local breakjoints = (method == 0) or (method == 4)
            local antirespawn = (method == 0) or (method == 2) or (method == 3)
    
            hatcollide = hatcollide and (method == 0)
    
            addtools = addtools and lp:FindFirstChildOfClass("Backpack")
    
            if type(simrad) ~= "number" then simrad = 1000 end
            if shp and (simradius == "shp") then
                tdelay(0, function()
                    while c do
                        shp(lp, "SimulationRadius", simrad)
                        heartbeat:Wait()
                    end
                end)
            elseif ssr and (simradius == "ssr") then
                tdelay(0, function()
                    while c do
                        ssr(simrad)
                        heartbeat:Wait()
                    end
                end)
            end
    
            if antiragdoll then
                antiragdoll = function(v)
                    if isa(v, "HingeConstraint") or isa(v, "BallSocketConstraint") then
                        v.Parent = nil
                    end
                end
                for i, v in pairs(getdescendants(c)) do
                    antiragdoll(v)
                end
                c.DescendantAdded:Connect(antiragdoll)
            end
    
            if antirespawn then
                respawnrequest()
            end
    
            if method == 0 then
                twait(loadtime)
                if not c then
                    return
                end
            end
    
            if discharscripts then
                for i, v in pairs(getdescendants(c)) do
                    if isa(v, "LocalScript") then
                        v.Disabled = true
                    end
                end
            elseif newanimate then
                local animate = gp(c, "Animate", "LocalScript")
                if animate and (not animate.Disabled) then
                    animate.Disabled = true
                else
                    newanimate = false
                end
            end
    
            if addtools then
                for i, v in pairs(getchildren(addtools)) do
                    if isa(v, "Tool") then
                        v.Parent = c
                    end
                end
            end
    
            pcall(function()
                settings().Physics.AllowSleep = false
                settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
            end)
    
            local OLDscripts = {}
    
            for i, v in pairs(getdescendants(c)) do
                if v.ClassName == "Script" then
                    OLDscripts[v.Name] = true
                end
            end
    
            local scriptNames = {}
    
            for i, v in pairs(getdescendants(c)) do
                if isa(v, "BasePart") then
                    local newName, exists = tostring(i), true
                    while exists do
                        exists = OLDscripts[newName]
                        if exists then
                            newName = newName .. "_"    
                        end
                    end
                    table.insert(scriptNames, newName)
                    Instance.new("Script", v).Name = newName
                end
            end
    
            local hum = c:FindFirstChildOfClass("Humanoid")
            if hum then
                for i, v in pairs(hum:GetPlayingAnimationTracks()) do
                    v:Stop()
                end
            end
            c.Archivable = true
            local cl = clone(c)
            if hum and humState16 then
                hum:ChangeState(Enum.HumanoidStateType.Physics)
                if destroyhum then
                    twait(1.6)
                end
            end
            if destroyhum then
                pcall(destroy, hum)
            end
    
            if not c then
                return
            end
    
            local head, torso, root = gp(c, "Head", "BasePart"), gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart"), gp(c, "HumanoidRootPart", "BasePart")
            if hatcollide then
                pcall(destroy, torso)
                pcall(destroy, root)
                pcall(destroy, c:FindFirstChildOfClass("BodyColors") or gp(c, "Health", "Script"))
            end
    
            local model = Instance.new("Model", c)
            model:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (model and model.Parent) then
                    model = nil
                end
            end)
    
            for i, v in pairs(getchildren(c)) do
                if v ~= model then
                    if addtools and isa(v, "Tool") then
                        for i1, v1 in pairs(getdescendants(v)) do
                            if v1 and v1.Parent and isa(v1, "BasePart") then
                                local bv = Instance.new("BodyVelocity")
                                bv.Velocity, bv.MaxForce, bv.P, bv.Name = v3_0, v3(1000, 1000, 1000), 1250, "bv_" .. v.Name
                                bv.Parent = v1
                            end
                        end
                    end
                    v.Parent = model
                end
            end
    
            if breakjoints then
                model:BreakJoints()
            else
                if head and torso then
                    for i, v in pairs(getdescendants(model)) do
                        if isa(v, "JointInstance") then
                            local save = false
                            if (v.Part0 == torso) and (v.Part1 == head) then
                                save = true
                            end
                            if (v.Part0 == head) and (v.Part1 == torso) then
                                save = true
                            end
                            if save then
                                if hedafterneck then
                                    hedafterneck = v
                                end
                            else
                                pcall(destroy, v)
                            end
                        end
                    end
                end
                if method == 3 then
                    task.delay(loadtime, pcall, model.BreakJoints, model)
                end
            end
    
            cl.Parent = ws
            for i, v in pairs(getchildren(cl)) do
                v.Parent = c
            end
            pcall(destroy, cl)
    
            local uncollide, noclipcon = nil, nil
            if noclipAllParts then
                uncollide = function()
                    if c then
                        for i, v in pairs(getdescendants(c)) do
                            if isa(v, "BasePart") then
                                v.CanCollide = false
                            end
                        end
                    else
                        noclipcon:Disconnect()
                    end
                end
            else
                uncollide = function()
                    if model then
                        for i, v in pairs(getdescendants(model)) do
                            if isa(v, "BasePart") then
                                v.CanCollide = false
                            end
                        end
                    else
                        noclipcon:Disconnect()
                    end
                end
            end
            noclipcon = stepped:Connect(uncollide)
            uncollide()
    
            for i, scr in pairs(getdescendants(model)) do
                if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
                    local Part0 = scr.Parent
                    if isa(Part0, "BasePart") then
                        for i1, scr1 in pairs(getdescendants(c)) do
                            if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
                                local Part1 = scr1.Parent
                                if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
                                    align(Part0, Part1)
                                    pcall(destroy, scr)
                                    pcall(destroy, scr1)
                                    break
                                end
                            end
                        end
                    end
                end
            end
    
            for i, v in pairs(getdescendants(c)) do
                if v and v.Parent and (not v:IsDescendantOf(model)) then
                    if isa(v, "Decal") then
                        v.Transparency = 1
                    elseif isa(v, "BasePart") then
                        v.Transparency = 1
                        v.Anchored = false
                    elseif isa(v, "ForceField") then
                        v.Visible = false
                    elseif isa(v, "Sound") then
                        v.Playing = false
                    elseif isa(v, "BillboardGui") or isa(v, "SurfaceGui") or isa(v, "ParticleEmitter") or isa(v, "Fire") or isa(v, "Smoke") or isa(v, "Sparkles") then
                        v.Enabled = false
                    end
                end
            end
    
            if newanimate then
                local animate = gp(c, "Animate", "LocalScript")
                if animate then
                    animate.Disabled = false
                end
            end
    
            if addtools then
                for i, v in pairs(getchildren(c)) do
                    if isa(v, "Tool") then
                        v.Parent = addtools
                    end
                end
            end
    
            local hum0, hum1 = model:FindFirstChildOfClass("Humanoid"), c:FindFirstChildOfClass("Humanoid")
            if hum0 then
                hum0:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not (hum0 and hum0.Parent) then
                        hum0 = nil
                    end
                end)
            end
            if hum1 then
                hum1:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not (hum1 and hum1.Parent) then
                        hum1 = nil
                    end
                end)
            
                ws.CurrentCamera.CameraSubject = hum1
                local camSubCon = nil
                local function camSubFunc()
                    camSubCon:Disconnect()
                    if c and hum1 then
                        ws.CurrentCamera.CameraSubject = hum1
                    end
                end
                camSubCon = renderstepped:Connect(camSubFunc)
                if hum0 then
                    hum0:GetPropertyChangedSignal("Jump"):Connect(function()
                        if hum1 then
                            hum1.Jump = hum0.Jump
                        end
                    end)
                else
                    respawnrequest()
                end
            end
    
            local rb = Instance.new("BindableEvent", c)
            rb.Event:Connect(function()
                pcall(destroy, rb)
                sg:SetCore("ResetButtonCallback", true)
                if destroyhum then
                    if c then c:BreakJoints() end
                    return
                end
                if model and hum0 and (hum0.Health > 0) then
                    model:BreakJoints()
                    hum0.Health = 0
                end
                if antirespawn then
                    respawnrequest()
                end
            end)
            sg:SetCore("ResetButtonCallback", rb)
    
            tdelay(0, function()
                while c do
                    if hum0 and hum1 then
                        hum1.Jump = hum0.Jump
                    end
                    wait()
                end
                sg:SetCore("ResetButtonCallback", true)
            end)
    
            R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
            if R15toR6 then
                local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "LowerTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
                if part then
                    local cfr = part.CFrame
                    local R6parts = { 
                        head = {
                            Name = "Head",
                            Size = v3(2, 1, 1),
                            R15 = {
                                Head = 0
                            }
                        },
                        torso = {
                            Name = "Torso",
                            Size = v3(2, 2, 1),
                            R15 = {
                                UpperTorso = 0.2,
                                LowerTorso = -0.8
                            }
                        },
                        root = {
                            Name = "HumanoidRootPart",
                            Size = v3(2, 2, 1),
                            R15 = {
                                HumanoidRootPart = 0
                            }
                        },
                        leftArm = {
                            Name = "Left Arm",
                            Size = v3(1, 2, 1),
                            R15 = {
                                LeftHand = -0.849,
                                LeftLowerArm = -0.174,
                                LeftUpperArm = 0.415
                            }
                        },
                        rightArm = {
                            Name = "Right Arm",
                            Size = v3(1, 2, 1),
                            R15 = {
                                RightHand = -0.849,
                                RightLowerArm = -0.174,
                                RightUpperArm = 0.415
                            }
                        },
                        leftLeg = {
                            Name = "Left Leg",
                            Size = v3(1, 2, 1),
                            R15 = {
                                LeftFoot = -0.85,
                                LeftLowerLeg = -0.29,
                                LeftUpperLeg = 0.49
                            }
                        },
                        rightLeg = {
                            Name = "Right Leg",
                            Size = v3(1, 2, 1),
                            R15 = {
                                RightFoot = -0.85,
                                RightLowerLeg = -0.29,
                                RightUpperLeg = 0.49
                            }
                        }
                    }
                                for i, v in pairs(getchildren(c)) do
                        if isa(v, "BasePart") then
                            for i1, v1 in pairs(getchildren(v)) do
                                if isa(v1, "Motor6D") then
                                    v1.Part0 = nil
                                end
                            end
                        end
                    end
                    part.Archivable = true
                    for i, v in pairs(R6parts) do
                        local part = clone(part)
                        part:ClearAllChildren()
                        part.Name, part.Size, part.CFrame, part.Anchored, part.Transparency, part.CanCollide = v.Name, v.Size, cfr, false, 1, false
                        for i1, v1 in pairs(v.R15) do
                            local R15part = gp(c, i1, "BasePart")
                            local att = gp(R15part, "att1_" .. i1, "Attachment")
                            if R15part then
                                local weld = Instance.new("Weld")
                                weld.Part0, weld.Part1, weld.C0, weld.C1, weld.Name = part, R15part, cf(0, v1, 0), cf_0, "Weld_" .. i1
                                weld.Parent = R15part
                                R15part.Massless, R15part.Name = true, "R15_" .. i1
                                R15part.Parent = part
                                if att then
                                    att.Position = v3(0, v1, 0)
                                    att.Parent = part
                                end
                            end
                        end
                        part.Parent = c
                        R6parts[i] = part
                    end
                    local R6joints = {
                        neck = {
                            Parent = R6parts.torso,
                            Name = "Neck",
                            Part0 = R6parts.torso,
                            Part1 = R6parts.head,
                            C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                            C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
                        },
                        rootJoint = {
                            Parent = R6parts.root,
                            Name = "RootJoint" ,
                            Part0 = R6parts.root,
                            Part1 = R6parts.torso,
                            C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                            C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
                        },
                        rightShoulder = {
                            Parent = R6parts.torso,
                            Name = "Right Shoulder",
                            Part0 = R6parts.torso,
                            Part1 = R6parts.rightArm,
                            C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                            C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                        },
                        leftShoulder = {
                            Parent = R6parts.torso,
                            Name = "Left Shoulder",
                            Part0 = R6parts.torso,
                            Part1 = R6parts.leftArm,
                            C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                            C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                        },
                        rightHip = {
                            Parent = R6parts.torso,
                            Name = "Right Hip",
                            Part0 = R6parts.torso,
                            Part1 = R6parts.rightLeg,
                            C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                            C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
                        },
                        leftHip = {
                            Parent = R6parts.torso,
                            Name = "Left Hip" ,
                            Part0 = R6parts.torso,
                            Part1 = R6parts.leftLeg,
                            C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                            C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                        }
                    }
                    for i, v in pairs(R6joints) do
                        local joint = Instance.new("Motor6D")
                        for prop, val in pairs(v) do
                            joint[prop] = val
                        end
                        R6joints[i] = joint
                    end
                    if hum1 then
                        hum1.RigType, hum1.HipHeight = Enum.HumanoidRigType.R6, 0
                    end
                end
            end
            local function getJoint(name)
                for i,v in next,R6joints do
                    if v.Name==name then
                        return v
                    end
                end
                return {C0=cf_0,C1=cf_0}
            end
            local torso1 = torso
            torso = gp(c, "Torso", "BasePart") or ((not R15toR6) and gp(c, torso.Name, "BasePart"))
            if (typeof(hedafterneck) == "Instance") and head and torso and torso1 then
                local conNeck, conTorso, conTorso1 = nil, nil, nil
                local aligns = {}
                local function enableAligns()
                    conNeck:Disconnect()
                    conTorso:Disconnect()
                    conTorso1:Disconnect()
                    for i, v in pairs(aligns) do
                        v.Enabled = true
                    end
                end
                conNeck = hedafterneck.Changed:Connect(function(prop)
                    if table.find({"Part0", "Part1", "Parent"}, prop) then
                        enableAligns()
                    end
                end)
                conTorso = torso:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
                conTorso1 = torso1:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
                for i, v in pairs(getdescendants(head)) do
                    if isa(v, "AlignPosition") or isa(v, "AlignOrientation") then
                        i = tostring(i)
                        aligns[i] = v
                        v:GetPropertyChangedSignal("Parent"):Connect(function()
                            aligns[i] = nil
                        end)
                        v.Enabled = false
                    end
                end
            end
    
            local flingpart0 = gp(model, flingpart, "BasePart") or gp(gp(model, flingpart, "Accessory"), "Handle", "BasePart")
            local flingpart1 = gp(c, flingpart, "BasePart") or gp(gp(c, flingpart, "Accessory"), "Handle", "BasePart")
    
            local fling = function() end
            if flingpart0 and flingpart1 then
                flingpart0:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not (flingpart0 and flingpart0.Parent) then
                        flingpart0 = nil
                        fling = function() end
                    end
                end)
                flingpart0.Archivable = true
                flingpart1:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not (flingpart1 and flingpart1.Parent) then
                        flingpart1 = nil
                        fling = function() end
                    end
                end)
                local att0 = gp(flingpart0, "att0_" .. flingpart0.Name, "Attachment")
                local att1 = gp(flingpart1, "att1_" .. flingpart1.Name, "Attachment")
                if att0 and att1 then
                    att0:GetPropertyChangedSignal("Parent"):Connect(function()
                        if not (att0 and att0.Parent) then
                            att0 = nil
                            fling = function() end
                        end
                    end)
                    att1:GetPropertyChangedSignal("Parent"):Connect(function()
                        if not (att1 and att1.Parent) then
                            att1 = nil
                            fling = function() end
                        end
                    end)
                    local lastfling = nil
                    local mouse = lp:GetMouse()
                    fling = function(target, duration, rotVelocity)
                        if typeof(target) == "Instance" then
                            if isa(target, "BasePart") then
                                target = target.Position
                            elseif isa(target, "Model") then
                                target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                                if target then
                                    target = target.Position
                                else
                                    return
                                end
                            elseif isa(target, "Humanoid") then
                                target = target.Parent
                                if not (target and isa(target, "Model")) then
                                    return
                                end
                                target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                                if target then
                                    target = target.Position
                                else
                                    return
                                end
                            else
                                return
                            end
                        elseif typeof(target) == "CFrame" then
                            target = target.Position
                        elseif typeof(target) ~= "Vector3" then
                            target = mouse.Hit
                            if target then
                                target = target.Position
                            else
                                return
                            end
                        end
                        if target.Y < ws.FallenPartsDestroyHeight + 5 then
                            target = v3(target.X, ws.FallenPartsDestroyHeight + 5, target.Z)
                        end
                        lastfling = target
                        if type(duration) ~= "number" then
                            duration = tonumber(duration) or 0.5
                        end
                        if typeof(rotVelocity) ~= "Vector3" then
                            rotVelocity = v3(0, 0, 0)
                        end
                        if not (target and flingpart0 and flingpart1 and att0 and att1) then
                            return
                        end
                        flingpart0.Archivable = true
                        local flingpart = clone(flingpart0)
                        flingpart.Transparency = 1
                        flingpart.CanCollide = false
                        flingpart.Name = "flingpart_" .. flingpart0.Name
                        flingpart.Anchored = true
                        flingpart.Velocity = v3_0
                        flingpart.RotVelocity = v3_0
                        flingpart.Position = target
                        flingpart:GetPropertyChangedSignal("Parent"):Connect(function()
                            if not (flingpart and flingpart.Parent) then
                                flingpart = nil
                            end
                        end)
                        flingpart.Parent = flingpart1
                        if flingpart0.Transparency > 0.5 then
                            flingpart0.Transparency = 0.5
                        end
                        att1.Parent = flingpart
                        local con = nil
                        local rotchg = v3(0, rotVelocity.Unit.Y * -1000, 0)
                        con = heartbeat:Connect(function(delta)
                            if target and (lastfling == target) and flingpart and flingpart0 and flingpart1 and att0 and att1 then
                                flingpart.Orientation += rotchg * delta
                                flingpart0.RotVelocity = rotVelocity
                            else
                                con:Disconnect()
                            end
                        end)
                        if alignmode ~= 4 then
                            local con = nil
                            con = renderstepped:Connect(function()
                                if flingpart0 and target then
                                    flingpart0.RotVelocity = v3_0
                                else
                                    con:Disconnect()
                                end
                            end)
                        end
                        twait(duration)
                        if lastfling ~= target then
                            if flingpart then
                                if att1 and (att1.Parent == flingpart) then
                                    att1.Parent = flingpart1
                                end
                                pcall(destroy, flingpart)
                            end
                            return
                        end
                        target = nil
                        if not (flingpart and flingpart0 and flingpart1 and att0 and att1) then
                            return
                        end
                        flingpart0.RotVelocity = v3_0
                        att1.Parent = flingpart1
                        pcall(destroy, flingpart)
                    end
                end
            end
        end
    
    
        local plrs = game:GetService("Players")
        local c = plrs.LocalPlayer.Character
        if not c then return end
        local ws = game:GetService("Workspace")
        local raycast = ws.Raycast
        c.AncestryChanged:Connect(function()
            if not c:IsDescendantOf(ws) then
                c = nil
            end
        end)
        local rs = game:GetService("RunService")
        local stepped, renderstepped, heartbeat = rs.Stepped, rs.RenderStepped, rs.Heartbeat
        local function gp(parent, name, classname)
            if typeof(parent) == "Instance" then
                for i, v in pairs(parent:GetChildren()) do
                    if (v.Name == name) and v:IsA(classname) then
                        return v
                    end
                end
            end
            return nil
        end
    
        local mrandom, schar, supper = math.random, string.char, string.upper
        local function randomstring(length)
            if type(length) ~= "number" then
                length = mrandom(8, 15)
            end
            local ret = ""
            for i=1, length do
                if mrandom(1, 2) == 1 then
                    ret = ret .. schar(mrandom(97, 122))
                else
                    ret = ret .. supper(schar(mrandom(97, 122)))
                end
            end
            return ret
        end
    
        local staticjoints = {}
        local function animjoint(name, parent, Part0, Part1, fakejoint)
            fakejoint.C0 = CFrame.new()
            fakejoint.C1 = CFrame.new()
            local joint = gp(parent, name, "Motor6D")
            if joint then
                for i, v in pairs(staticjoints) do
                    if (v.Part0 == Part0) and (v.Part1 == Part1) then
                        staticjoints[i] = nil
                        break
                    end
                end
                fakejoint.C0 = joint.C0
                fakejoint.C1 = joint.C1
                joint:Destroy()
                joint = nil
            end
            name = randomstring()
            local fix = nil
            local con = nil
            fix = function()
                if not c then
                    return con:Disconnect()
                end
                if not joint then 
                    joint = Instance.new("Weld")
                    name = randomstring()
                    joint.Changed:Connect(fix)
                    joint.Destroying:Connect(function() joint = nil fix() end)
                end
                if joint.Part0 ~= Part0 then
                    joint.Part0 = Part0
                end
                if joint.Part1 ~= Part1 then
                    joint.Part1 = Part1
                end
                if joint.C0 ~= fakejoint.C0 then
                    joint.C0 = fakejoint.C0
                end
                if joint.C1 ~= fakejoint.C1 then
                    joint.C1 = fakejoint.C1
                end
                if joint.Name ~= name then
                    name = randomstring()
                    joint.Name = name
                end
                if joint.Parent ~= parent then
                    joint.Parent = parent
                end
            end
            con = stepped:Connect(fix)
        end
    
        local function part(name, main)
            local part = gp(c, name, "BasePart")
            if not part then
                part = Instance.new("Part")
                part.Size = Vector3.new(1, 1, 1)
            end
            local size = part.Size
            part.Destroying:Connect(function()
                part = nil
                c = nil
            end)
            if not main then
                name = randomstring()
            end
            local con = nil
            con = stepped:Connect(function()
                if not part then
                    return con:Disconnect()
                end
                part.Transparency = 1
                part.Name = name
                part.Size = size
                part.CanCollide = true
                part.Anchored = main
                part.Parent = c
            end)
            return part
        end
    
        local function addjoint(v)
            table.insert(staticjoints, {C0 = v.C0, C1 = v.C1, Part0 = v.Part0, Part1 = v.Part1})
        end
        for i, v in pairs(c:GetDescendants()) do
            if v:IsA("JointInstance") then 
                pcall(addjoint, v)
            end
        end
    
        for i, v in pairs(c:GetChildren()) do
            if v:IsA("Accessory") then
                local handle = gp(v, "Handle", "BasePart")
                handle.Name = randomstring()
                handle.Parent = c
                v:Destroy()
            end
        end
    
        local Torso = part("Torso", false)
        local RightArm = part("Right Arm", false)
        local LeftArm = part("Left Arm", false)
        local LeftLeg = part("Left Leg", false)
        local RightLeg = part("Right Leg", false)
        local Head = part("Head", false)
        local HumanoidRootPart = part("HumanoidRootPart", true)
    
        local RootJoint = {}
        local RightShoulder = {}
        local LeftShoulder = {}
        local RightHip = {}
        local LeftHip = {}
        local Neck = {}
    
        animjoint("Neck", Torso, Torso, Head, Neck)
        animjoint("RootJoint", HumanoidRootPart, HumanoidRootPart, Torso, RootJoint)
        animjoint("Right Shoulder", Torso, Torso, RightArm, RightShoulder)
        animjoint("Left Shoulder", Torso, Torso, LeftArm, LeftShoulder)
        animjoint("Right Hip", Torso, Torso, RightLeg, RightHip)
        animjoint("Left Hip", Torso, Torso, LeftLeg, LeftHip)
    
        for i, v in pairs(c:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") then
                for i, v in pairs(v:GetDescendants()) do
                    if v:IsA("JointInstance") then
                        for i, v1 in pairs(staticjoints) do
                            if (v.Part0 == v1.Part0) and (v.Part1 == v1.Part1) then
                                staticjoints[i] = nil
                            end
                        end
                    end
                end
            end
        end
    
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then 
            hum:Destroy()
        end
    
        for i, v in pairs(staticjoints) do
            local Part0, Part1, C0, C1 = v.Part0, v.Part1, v.C0, v.C1
            local fix, con, joint, name = nil, nil, nil, randomstring()
            fix = function()
                if not c then
                    return con:Disconnect()
                end
                if not joint then 
                    joint = Instance.new("Weld")
                    name = randomstring()
                    joint.Changed:Connect(fix)
                    joint.Destroying:Connect(function() joint = nil fix() end)
                end
                if joint.Part0 ~= Part0 then
                    joint.Part0 = Part0
                end
                if joint.Part1 ~= Part1 then
                    joint.Part1 = Part1
                end
                if joint.C0 ~= C0 then
                    joint.C0 = C0
                end
                if joint.C1 ~= C1 then
                    joint.C1 = C1
                end
                if joint.Name ~= name then
                    name = randomstring()
                    joint.Name = name
                end
                if joint.Parent ~= c then
                    joint.Parent = c
                end
            end
            con = stepped:Connect(fix)
        end
    
        local animate = gp(a, "Animate", "LocalScript")
        if animate then animate:Destroy() end 
    
    
        local movementkeys = {
            [Enum.KeyCode.W] = false,
            [Enum.KeyCode.A] = false,
            [Enum.KeyCode.S] = false,
            [Enum.KeyCode.D] = false,
            [Enum.KeyCode.Space] = false
        }
        uis.InputBegan:Connect(function(a, b)
            if b then return end
            a = a.KeyCode
            if movementkeys[a] == false then
                movementkeys[a] = true
                return
            end
        end)
        uis.InputEnded:Connect(function(a)
            if movementkeys[a.KeyCode] == true then
                movementkeys[a.KeyCode] = false
            end
        end)
    
        local cf, v3 = CFrame.new, Vector3.new
        local v3_0, v3_101, v3_010, v3_d, v3_u = v3(0, 0, 0), v3(1, 0, 1), v3(0, 1, 0), v3(0, -10000, 0), v3(0, 10000, 0)
        local vel, cfr, raycastresult, onground = v3_0, HumanoidRootPart.CFrame, nil, true
    
        local raycastparams = RaycastParams.new()
        raycastparams.FilterType = Enum.RaycastFilterType.Blacklist
        local rayfilter = {}
        local characters = {}
        local function refreshrayfilter()
            for i, v in pairs(rayfilter) do
                if not table.find(characters, v) then
                    rayfilter[i] = nil
                end
            end
            for i, v in pairs(characters) do
                if not table.find(rayfilter, v) then
                    table.insert(rayfilter, v)
                end
            end
            raycastparams.FilterDescendantsInstances = rayfilter
        end
        local function oncharacter(plr, c)
            characters[plr] = c
            refreshrayfilter()
        end
        local function onplayer(v)
            oncharacter(v, v.Character)
            v.CharacterAdded:Connect(function(c)
                oncharacter(v, c)
            end)
        end
        for i, v in pairs(plrs:GetPlayers()) do onplayer(v) end
        plrs.PlayerAdded:Connect(onplayer)
        plrs.PlayerRemoving:Connect(function(v)
            oncharacter(v, nil)
        end)
    
        local legcfR, legcfL, legvec = cf(1, -1.5, 0), cf(-1, -1.5, 0), v3(0, -1.5, 0)
        local function raycastlegs()
            local rY, lY = raycast(ws, (cfr * legcfR).Position, legvec, raycastparams), raycast(ws, (cfr * legcfL).Position, legvec, raycastparams)
            return rY and (rY.Position.Y - (cfr.Y - 3)) or 0, lY and (lY.Position.Y - (cfr.Y - 3)) or 0
        end
    
        local euler, sin, sine, abs, clamp = CFrame.fromEulerAnglesXYZ, math.sin, 0, math.abs, math.clamp
        local con = nil
        con = renderstepped:Connect(function(deltaTime)
            if not c then
                return con:Disconnect()
            end
            raycastresult = raycast(ws, cfr.Position, v3_d, raycastparams)
            if raycastresult then
                onground = (cfr.Y - raycastresult.Position.Y) < 3.01
                if onground then
                    vel = v3(0, (raycastresult.Position.Y + 3 - cfr.Y) * 0.5 / deltaTime, 0)
                    if cfr.Y + vel.Y * deltaTime > raycastresult.Position.Y + 3 then
                        vel = v3_0
                        cfr += v3(0, raycastresult.Position.Y + 3 - cfr.Y, 0)
                    end
                    if movementkeys[Enum.KeyCode.Space] then
                        vel = v3(0, jumpPower, 0)
                    end
                else
                    vel -= v3_010 * deltaTime * 196.2
                    if cfr.Y + vel.Y * deltaTime < raycastresult.Position.Y then
                        vel = v3(0, (raycastresult.Position.Y + 3 - cfr.Y) / deltaTime, 0)
                    end
                end
            else
                onground = false
                raycastresult = raycast(ws, cfr.Position + v3_u, v3_d, raycastparams)
                if raycastresult then
                    vel = v3(0, 65, 0)
                    cfr += v3(0, raycastresult.Position.Y + 3 - cfr.Y, 0)
                else
                    vel += v3_010 * deltaTime * 50
                end
            end
            vel *= v3_010
            local xzvel, camcf = v3_0, ws.CurrentCamera.CFrame
            if movementkeys[Enum.KeyCode.W] then
                xzvel += (camcf.LookVector * v3_101).Unit
            end
            if movementkeys[Enum.KeyCode.S] then
                xzvel -= (camcf.LookVector * v3_101).Unit
            end
            if movementkeys[Enum.KeyCode.A] then
                xzvel -= (camcf.RightVector * v3_101).Unit
            end
            if movementkeys[Enum.KeyCode.D] then
                xzvel += (camcf.RightVector * v3_101).Unit
            end
            if xzvel.Magnitude ~= 0 then
                cfr = cfr:Lerp(cf(cfr.Position, cfr.Position + xzvel), deltaTime * 10)
                walkSpeed = walkSpeeder
                local totalSpeed = walkSpeed 
                xzvel = xzvel.Unit * totalSpeed 
                        end
            if uis.MouseBehavior == Enum.MouseBehavior.LockCenter then
                cfr = cf(cfr.Position, cfr.Position + camcf.LookVector * v3_101)
            end
            
            vel += xzvel
            cfr += vel * deltaTime
            HumanoidRootPart.CFrame, HumanoidRootPart.Velocity, HumanoidRootPart.RotVelocity, HumanoidRootPart.Anchored = cfr, vel, v3_0, true

            local hum = c:FindFirstChildOfClass("Humanoid")
            if not hum then 
                hum = Instance.new("Humanoid")
                for i, v in pairs(Enum.HumanoidStateType:GetEnumItems()) do
                    pcall(hum.SetStateEnabled, v, false)
                end
                hum.Name = randomstring()
                hum.Parent = c
            end
            local function cfMul(a, b)
                return a * b
            end
            local function angles(x, y, z)
                return CFrame.Angles(x, y, z)
            end
            local hhOff=3
            local hhOff1=3.01
            local setHipHeight=function(n)
                hhOff=n+3
                hhOff1=n+3.01
            end
    
            for i, v in pairs(hum:GetPlayingAnimationTracks()) do v:Stop() end
            sine += deltaTime
            deltaTime = clamp(deltaTime * 10, 0, 1)
        if vel.Magnitude < 0.01 then --idle
                if mode == "" then
                    walkSpeed = 16
                    local rY, lY = raycastlegs()
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(0.9999998807907104, 0.4999999403953552, -2.765073337516225e-32) * euler(-1.5707963267948966, 1.3962634015954636 + 0.08726646259971647 * sin((sine + 1) * 2), 1.5707963267948966), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 1.1739236345820182e-24 + 0.1 * sin((sine + 0.35) * 2), 0.1 * sin(sine * 2)) * euler(-1.5707963267948966 + 0.08726646259971647 * sin(sine * 2), 0.017453292519943295 * sin(sine * 2), -2.792526803190927), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-0.9999998807907104, 0.4999999403953552, -1.2568507556530796e-32) * euler(1.5707963267948966, -1.3962634015954636 + 0.08726646259971647 * sin((sine + 1) * 2), 1.2217304763960306), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966 + 0.08726646259971647 * sin((sine - 0.375) * 2), 0, 2.792526803190927 + 0.5235987755982988 * sin(sine * 0.6)), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(0.9999998807907104, -1.100000023841858 - 0.1 * sin((sine + 0.35) * 2) + rY, rY * -0.5) * euler(-1.0471975511965976 - 0.08726646259971647 * sin(sine * 2), 1.3962634015954636, 1.3962634015954636), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1.100000023841858 - 0.1 * sin((sine + 0.35) * 2) + lY, lY * -0.5) * euler(-1.7453292519943295 - 0.08726646259971647 * sin(sine * 2), -1.3962634015954636, -1.3962634015954636), deltaTime) 
                    --RightArm,0.9999998807907104,0,0,2,-90,0,0,2,0.4999999403953552,0,0,2,80,5,1,2,-2.765073337516225e-32,0,0,2,90,0,0,2,Torso,0,0,0,2,-90,5,0,2,1.1739236345820182e-24,0.1,0.35,2,0,1,0,2,0,0.1,0,2,-160,0,0,2,Fedora_Handle,8.657480066176504e-09,0,0,2,-6,0,0,2,-0.15052366256713867,0,0,2,0,0,0,2,-0.010221302509307861,0,0,2,0,0,0,2,LeftArm,-0.9999998807907104,0,0,2,90,0,0,2,0.4999999403953552,0,0,2,-80,5,1,2,-1.2568507556530796e-32,0,0,2,70,0,0,2,Head,0,0,0,2,-90,5,-0.375,2,1,0,0,2,0,0,0,2,0,0,0,2,160,30,0,0.6,RightLeg,0.9999998807907104,0,0,2,-60,-5,0,2,-1.100000023841858,-0.1,0.35,2,80,0,0,2,0,0,0,2,80,0,0,2,LeftLeg,-1,0,0,2,-100,-5,0,2,-1.100000023841858,-0.1,0.35,2,-80,0,0,2,0,0,0,2,-80,0,0,2
                elseif mode == "Back Fuck" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+3)*-5),0,0.3490658503988659)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(2.6179938779914944+0.2617993877991494*sin((sine+1)*-5),0,-0.3490658503988659)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    --MW_animatorProgressSave: LeftArm,-1.5,-0.3,2,0,60,-15,3,-5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0,RightArm,1.5,0,2,0,150,15,1,-5,0.4,-0.3,2,0,0,0,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,AnonymousHood_Handle,-6.617444900424222e-24,0,0,1,0,0,0,1,0.4000000059604645,0,0,1,0,0,0,1,0.06400000303983688,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, 1)
                    end
                elseif mode == "Hawk Tuah" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,-0.2+0.1*sin(sine*4)),angles(-1.4835298641951802+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),0.17453292519943295,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.3,0),angles(-2.007128639793479+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),-1.5707963267948966,0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),-0.17453292519943295,0)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,-85,7,0,4,1,0,0,1,0,0,0,1,-0.2,0.1,0,4,180,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,RightLeg,0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,10,0,0,1,-0.2,0.2,0,4,0,0,0,1,Torso,0,0,0,1,-115,7,0,4,-1.3,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,140,17,0,-4,0.1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,-10,0,0,1,-0.2,0.2,0,4,0,0,0,1,RightArm,1,0,0,1,140,17,0,-4,0.1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, -0.7, -1.7) * CFrame.Angles(0, math.rad(180), 0)
                    end
               
                elseif mode == "Corruption" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.6,0,0.3), angles(-0.17453292519943295 + 0.08726646259971647 * sin((sine + 2) * animationSpeed), 0.4363323129985824 - 0.08726646259971647 * sin((sine + 2) * animationSpeed), -0.5235987755982988)), deltaTime)
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5, -1 - 0.1 * sin(sine * animationSpeed), 0.5), angles(-0.08726646259971647 + 0.08726646259971647 * sin((sine + 1) * animationSpeed), -0.08726646259971647, 0.05235987755982989)), deltaTime)
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5, -1 - 0.1 * sin(sine * animationSpeed), 0.5), angles(0.17453292519943295 + 0.08726646259971647 * sin((sine + 1) * animationSpeed), 0.08726646259971647, -0.05235987755982989)), deltaTime)
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0, 1, 0), angles(-1.6580627893946132 + 0.12217304763960307 * sin(sine * animationSpeed), 0, 3.141592653589793)), deltaTime)
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.7, 0, 0.3), angles(-0.17453292519943295 + 0.08726646259971647 * sin((sine + 2) * animationSpeed), -0.4363323129985824 + 0.08726646259971647 * sin((sine + 2) * animationSpeed), 0.5235987755982988)), deltaTime)
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0, 0.1 * sin(sine * animationSpeed), -0.1 * sin((sine + 1) * animationSpeed)), angles(-1.5707963267948966 - 0.08726646259971647 * sin((sine + 1) * animationSpeed), 0, 3.141592653589793)), deltaTime)
                elseif mode == "Lap Dance" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, -1)
                    end
                elseif mode == "Invisible" then
                    walkSpeed = 16
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1000,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                elseif mode == "Anti Head" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-112312331312000,0),angles(0,0,0)),deltaTime) 
                elseif mode == "Unknown" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.6,0.3-0.1*sin((sine+2)*2.5),-0.2),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0.08726646259971647*sin((sine+2)*2.5),3.490658503988659)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.2,-0.9+0.1*sin((sine+1.3)*2.5),0),angles(-0.8726646259971648+0.17453292519943295*sin((sine+2)*-2),-1.3089969389957472,-0.22689280275926285)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.3-0.1*sin((sine+2)*2.5),-0.5),angles(0.17453292519943295*sin((sine+0.5)*2.5),-0.17453292519943295,-0.5235987755982988)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,4-1*sin(sine*2),0),angles(-2.007128639793479+0.05235987755982989*sin((sine+0.5)*2.5),-0.17453292519943295+0.05235987755982989*sin((sine+0.5)*2.5),2.792526803190927)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.1,-0.8+0.1*sin((sine+1)*2.5),-0.5),angles(-0.6981317007977318+0.17453292519943295*sin((sine+2)*2),1.3089969389957472,0.2617993877991494)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.6,0,0,0.5,-50,0,0,0,0.3,-0.1,2,2.5,-20,0,0,0,-0.2,0,0,0.5,-20,-10,4,0,Head,0,0,0,0.5,-90,0,0,0.5,1,0,0,0.5,0,5,2,2.5,0,0,0,0.5,200,0,0,0.5,LeftLeg,-1.2,0,0,0,-50,10,2,-2,-0.9,0.1,1.3,2.5,-75,0,0,0,-0.,,0,0.5,-13,0,0,4,LeftArm,-1.5,0,0,0.5,0,10,0.5,2.5,0.3,-0.1,2,2.5,-10,0,0,0.5,-0.5,0,0,0.5,-30,0,4,1.25,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,0.5,-115,3,0.5,2.5,4,-1,0,2,-10,3,0.5,2.5,0,0,0,0.5,160,0,0,0.5,RightLeg,1.1,0,0,0.5,-40,10,2,2,-0.8,0.1,1,2.5,75,0,0,0.5,-0.5,0,0,0.5,15,0,0,0.5,NurbsPath.008Accessory_Handle,-0.009944915771484375,0,0,1,-180,0,0,1,-0.3377801179885864,0,0,1,0,0,0,1,0.05934906005859375,0,0,1,180,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1
                                elseif mode == "Dragged away" then
                    walkSpeed = 25
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),0.5,0.8),angles(-2.443460952792061+0.2617993877991494*sin((sine+1)*5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),0.3490658503988659*sin(sine*2.5))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295+0.08726646259971647*sin(sine*5),3.141592653589793+0.3490658503988659*sin(sine*5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(0.6981317007977318+0.3490658503988659*sin((sine+1)*5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.7+0.1*sin((sine+1)*2.5),-0.5),angles(1.0471975511965976-0.17453292519943295*sin(sine*5),-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659+0.17453292519943295*sin(sine*5))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.2 * sin(sine*2.5),-1.7+0.1*sin(sine*5),0.2 * sin(sine*2.5)),angles(-2.0943951023931953+0.2617993877991494*sin((sine+1)*5),0.17453292519943295*sin(sine*2.5),0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(0.8726646259971648+0.3490658503988659*sin((sine+1)*5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,-140,15,1,5,0.5,0,0,1,30,20,0,2.5,0.8,0,0,1,,20,0,2.5,Head,0,0,0,1,-120,0,0,5,1,0,0,1,-10,5,0,5,0,0,0,1,180,20,0,5,RightLeg,0.5,0,0,1,40,20,1,5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,-5,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,1,60,-10,0,5,0.7,0.1,1,2.5,-30,10,0,5,-0.5,0,0,1,-20,10,0,5,Torso,0,0.2,0,2.5,-120,15,1,5,-1.7,0.1,0,5,0,10,0,2.5,0,0.2,0,2.5,,0,0,1,LeftLeg,-0.5,0,0,1,50,20,1,5,-1,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "S T A R" then
                    walkSpeed = 16
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1 - 0.1 * math.cos(sine / 32), 0) * angles(math.rad(0), math.rad(90), math.rad(0)) * angles(math.rad(-10 - 2.5 * math.cos(sine / 32)), math.rad(-20), math.rad(0)), 0.1)
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1 - 0.1 * math.cos(sine / 32), 0) * angles(math.rad(0), math.rad(-90), math.rad(0)) * angles(math.rad(0), math.rad(0), math.rad(-10 + 2.5 * math.cos(sine / 32))), 0.1)
                    RootJoint.C0 = RootJoint.C0:Lerp(RootJoint.C0 * cf(0, 0, 0 + 0.1 * math.cos(sine / 32)) * angles(math.rad(10 - 2 * math.cos(sine / 32)), math.rad(0), math.rad(20)), 0.1)
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.08726646259971647*sin((sine+1)*1),0,3.141592653589793+0.08726646259971647*sin(sine*0.5))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1.5, 0.5, 0) * angles(math.rad(10), math.rad(-20), math.rad(30 + 2.5 * math.cos(sine / 25))), 0.1)
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1.5, 0.5, 0) * angles(math.rad(160), math.rad(0), math.rad(25)), 0.1)
                                        
                elseif mode == "Sit Jerk" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,-0.7),angles(1.2217304763960306+0.2617993877991494*sin(sine*5),0,-0.8726646259971648)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.08726646259971647*sin((sine+1)*1),0,3.141592653589793+0.08726646259971647*sin(sine*0.5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1.5,0),angles(1.5707963267948966-0.08726646259971647*sin(sine*1),0,0.3490658503988659)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,-0.2,0.4),angles(1.5707963267948966-0.08726646259971647*sin(sine*1),-2.0943951023931953-0.08726646259971647*sin(sine*1),2.0943951023931953-0.08726646259971647*sin(sine*1))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.5+0.05*sin(sine*1),0.1 * sin(sine*1)),angles(-1.5707963267948966+0.08726646259971647*sin(sine*1),0,3.141592653589793+0.08726646259971647*sin(sine*0.5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1.5,0),angles(1.5707963267948966-0.08726646259971647*sin(sine*1),0.17453292519943295,-0.3490658503988659)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,70,15,0,5,0.5,0,0,1,0,0,0,1,-0.7,0,0,1,-50,0,0,1,Head,0,0,0,1,-90,5,1,1,1,0,0,1,0,0,0,1,0,0,0,1,180,5,0,0.5,RightLeg,0.5,0,0,1,90,-5,0,1,-1.5,0,0,1,0,0,0,1,0,0,0,1,20,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftArm,-1.,0,0,1,90,-5,0,1,-0.2,0,0,1,-120,-5,0,1,0.4,0,0,1,120,-5,0,1,Torso,0,0,0,1,-90,5,0,1,-1.5,0.05,0,1,0,0,0,1,0,0.1,0,1,180,5,0,0.5,LeftLeg,-0.5,0,0,1,90,-5,0,1,-1.5,0,0,1,10,0,0,1,0,0,0,1,-20,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1
                    
                elseif mode == "Bacon God" then
                    walkSpeed = 40
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.7,0.1 * sin(sine*5),0),angles(-0.5235987755982988,-0.5235987755982988,0.6981317007977318+0.17453292519943295*sin((sine+1)*5))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.9198621771937625+0.08726646259971647*sin(sine*5),0.08726646259971647*sin(sine*2.5),3.141592653589793-0.08726646259971647*sin(sine*2.5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.9,0.3),angles(-0.3490658503988659+0.17453292519943295*sin(sine*5),-0.3490658503988659,-0.17453292519943295+0.3490658503988659*sin(sine*2.5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.8+0.2*sin((sine+1)*5),0.5),angles(2.9670597283903604+0.3490658503988659*sin((sine+1)*5),0,-0.3490658503988659+0.08726646259971647*sin(sine*5))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.5 * sin(sine*2.5),1+0.5*sin(sine*5),0),angles(-1.0471975511965976-0.08726646259971647*sin((sine+1)*5),-0.3490658503988659+0.08726646259971647*sin(sine*2.5),3.141592653589793+0.08726646259971647*sin(sine*2.5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.3,-0.5),angles(-0.8726646259971648+0.17453292519943295*sin(sine*5),0.17453292519943295*sin(sine*2.5),-0.3490658503988659+0.17453292519943295*sin(sine*2.5))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.7,0,0,1,-30,0,0,1,0,0.1,0,5,-30,0,0,1,0,0,0,1,40,10,1,5,Head,0,0,0,1,-110,5,0,5,1,0,0,1,0,5,0,2.5,0,0,0,1,180,-5,0,2.5,RightLeg,0.5,0,0,1,-20,10,0,5,-0.9,0,0,1,-20,,0,1,0.3,0,0,1,-10,20,0,2.5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.5,0,0,1,170,20,1,5,0.8,0.2,1,5,0,0,0,1,0.5,0,0,1,-20,5,0,5,Torso,0,-0.5,0,2.5,-60,-5,1,5,1,0.5,0,5,-20,5,0,2.5,0,,0,1,180,5,0,2.5,LeftLeg,-0.5,0,0,1,-50,10,0,5,-0.3,0,0,1,0,10,0,2.5,-0.5,0,0,1,-20,10,0,2.5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "ERRAH" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),1,-0.5),angles(2.2689280275926285-0.17453292519943295*sin(sine*2.5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),-0.17453292519943295*sin((sine+1)*1.25))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953+0.5235987755982988*sin(sine*105),0.5235987755982988*sin(sine*106),3.141592653589793+0.5235987755982988*sin(sine*107))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(-1.2217304763960306-0.17453292519943295*sin((sine+1)*2.5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295+0.08726646259971647*sin(sine*1.25))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.3,0.8+0.1*sin((sine+1)*2.5),-0.8),angles(2.0943951023931953-0.17453292519943295*sin(sine*105),0.6981317007977318+0.17453292519943295*sin(sine*106),1.0471975511965976+0.17453292519943295*sin(sine*107))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*1.25),2+0.3*sin(sine*2.5),0.2 * sin(sine*2.5)),angles(2.443460952792061-0.17453292519943295*sin((sine+1)*2.5),0.17453292519943295*sin(sine*1.25),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.5+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(-0.5235987755982988-0.2617993877991494*sin((sine+1)*2.5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*1.25))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,130,-10,0,2.5,1,0,0,1,30,20,0,2.5,-0.5,0,0,1,0,-10,1,1.25,Head,0,0,0,1,-120,30,0,105,1,0,0,1,0,30,0,106,0,0,0,1,180,30,0,107,RightLeg,0.5,0,0,1,-70,-10,1,2.5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,5,0,1.25,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.3,0,0,1,120,-10,0,105,0.8,0.1,1,2.5,40,10,0,106,-0.8,0,0,1,60,10,0,107,Torso,0,0.3,0,1.25,140,-10,1,2.5,2,0.3,0,2.5,0,10,0,1.25,0,0.2,0,2.5,180,0,0,1,LeftLeg,-0.5,0,0,1,-30,-15,1,2.5,-0.5,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,1.25,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "Creature" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,1.5,-1-0.2*sin((sine+1)*5)),angles(1.5707963267948966-0.17453292519943295*sin((sine+1)*5),0.17453292519943295,0.08726646259971647)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,-0.5+0.1*sin((sine+1)*5)),angles(-0.17453292519943295*sin(sine*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1.5,-0.5+0.1*sin((sine+1)*5)),angles(1.5707963267948966-0.17453292519943295*sin((sine+1)*5),-0.17453292519943295,0.08726646259971647)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,1.5,-1-0.2*sin((sine+1)*5)),angles(1.5707963267948966-0.17453292519943295*sin((sine+1)*5),-0.17453292519943295,-0.08726646259971647)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.5,-0.1 * sin((sine+1)*5)),angles(3.141592653589793+0.08726646259971647*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1.5,-0.5+0.1*sin((sine+1)*5)),angles(1.5707963267948966-0.17453292519943295*sin((sine+1)*5),0.17453292519943295,-0.08726646259971647)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,90,-10,1,5,1.5,0,0,1,10,0,0,1,-1,-0.2,1,5,5,0,0,1,Head,0,,0,1,0,-10,0,5,1.5,0,0,1,0,0,0,1,-0.5,0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,90,-10,1,5,-1.5,0,0,1,-10,0,0,1,-0.5,0.1,1,5,5,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,1,90,-10,1,5,1.5,0,0,1,-10,0,0,1,-1,-0.2,1,5,-5,0,0,1,Torso,0,0,0,1,180,5,1,5,-0.5,0,0,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,LeftLeg,-0.5,,0,1,90,-10,1,5,-1.5,0,0,5,10,0,0,1,-0.5,0.1,1,5,-5,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                    
                elseif mode == "Sonic" then
                    walkSpeed = 60
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4,0.5+0.1*sin(sine*5),-0.6),angles(0.8726646259971648+0.3490658503988659*sin((sine+1)*5),0.3490658503988659,0.17453292519943295)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.6580627893946132+0.17453292519943295*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.8-0.2*sin(sine*5),0.5 * sin(sine*5)),angles(-0.3490658503988659+0.3490658503988659*sin(sine*5),-0.08726646259971647,0.08726646259971647)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.4,0.5+0.1*sin(sine*5),-0.6),angles(0.8726646259971648+0.3490658503988659*sin((sine+1)*5),-0.3490658503988659,-0.17453292519943295)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.3+0.3*sin(sine*5),0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.8-0.2*sin(sine*5),0.6 * sin(sine*5)),angles(-0.3490658503988659+0.3490658503988659*sin(sine*5),0.08726646259971647,-0.08726646259971647)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.4,0,0,1,50,20,1,5,0.5,0.1,0,5,20,0,0,1,-0.6,0,0,1,10,0,0,1,Head,0,0,0,1,-95,10,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,0.5,0,0,1,-20,20,0,5,-0.8,-0.2,0,5,-5,0,0,1,0,0.5,0,5,5,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.4,0,0,1,50,20,1,5,0.5,0.1,0,5,-20,0,0,1,-0.6,0,0,1,-10,0,0,1,Torso,0,0,0,1,-90,0,0,1,-0.3,0.3,0,5,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-0.5,0,0,1,-20,20,0,5,-0.8,-0.2,0,5,5,0,0,1,0,0.6,0,5,-5,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "siezrure 2" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*52))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-2.5,0),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*53))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,52,-0.5,0,0,1,0,20,0,53,Head,0,0,0,1,-90,20,0,51,1,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,RightLeg,0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,52,0.5,0,0,1,0,20,0,53,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,53,-0.5,0,0,1,0,20,0,52,Torso,0,0,0,1,0,20,0,51,-2.5,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,LeftLeg,-0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,53,0.5,0,0,1,0,20,0,53,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "Nazi Swastika" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0,0.5,0),angles(0,1.5707963267948966,3.141592653589793)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,-0.6981317007977318,3.141592653589793),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.5,0.5,0.5),angles(0,-3.141592653589793,1.5707963267948966)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(3.5 * sin((sine+1.5)*0.625),3 * sin((sine+4)*0.625),0),angles(0.5235987755982988+2.0943951023931953*sin((sine+30)*0.625),0.5235987755982988+2.0943951023931953*sin((sine+400)*0.625),0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,0,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0,-0.5,0.5),angles(0,-31.41592653589793,1.5707963267948966)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,0,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-40,0,0,1,0,0,0,1,180,0,0,1,SlickBackYakuzaBlack_Handle,-3.552713678800501e-15,0,0,1,180,0,0,1,0.3807339668273926,0,0,1,0,0,0,1,0.21092987060546875,0,0,1,180,0,0,1,LeftArm,-0.5,0,0,1,0,0,0,1,0.5,0,0,1,-180,0,0,1,0.5,0,0,1,90,0,0,1,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,LongHair_Handle,-0.00004900000203633681,0,0,1,0,0,0,1,1.10490083694458,0,0,1,0,0,0,1,-0.4286848306655884,0,0,1,0,0,0,1,Head,0,3.5,1.5,0.625,30,120,30,0.625,0,3,4,0.625,30,120,400,0.625,0,0,0.5,0.625,0,0,0,5,LeftLeg,-1,0,0,1,0,0,0,1,,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,,0,0,1,0,0,0,1,-0.5,0,0,1,-1800,0,0,1,0.5,0,0,1,90,0,0,1
                elseif mode == "siezrure funnier" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1),3.141592653589793+174532.90774614044*sin(sine*1))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*25),1+3*sin(sine*20),1 * sin(sine*17)),angles(-1.5707963267948966-174532.90774614044*sin(sine*1),-174532.90774614044*sin(sine*1),3.141592653589793-174532.90774614044*sin(sine*1))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,0,9999999,0,1,0.5,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Head,0,0,0,1,-90,9999999,0,1,1,0,0,1,0,9999999,0,1,0,0,0,1,180,9999999,0,1,RightLeg,1,0,0,1,0,9999999,0,1,-1,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,9999999,0,1,0.5,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Torso,0,1,,25,-90,-9999999,0,1,1,3,,20,0,-9999999,0,1,0,1,0,17,180,-9999999,0,1,LeftLeg,-1,0,0,1,0,9999999,0,1,-1,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "fishy business" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(10 * sin(sine*3),1+5*sin(sine*10),10 * sin(sine*5)),angles(-1.5707963267948966+1.7453292519943295*sin(sine*5),1.7453292519943295*sin(sine*3),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,,10,0,3,-90,100,0,5,1,5,0,10,0,100,0,3,,10,0,5,180,,0,4,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "Pogo Stick" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,1.5707963267948966-0.5235987755982988*sin(sine*10))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966-0.3490658503988659*sin(sine*10),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,-1.5707963267948966+0.5235987755982988*sin(sine*10))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1.2+2*sin((sine+1)*10),0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,0,0,1,-0.5,0,0,1,90,-30,0,10,Head,0,0,0,1,-90,-20,,10,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,,0,1,-0.5,0,0,1,-90,30,0,10,Torso,0,0,0,1,-90,0,0,1,1.2,2,1,10,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "reverse ragdoll" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(-1.5707963267948966-0.5235987755982988*sin((sine+2)*5),1.5707963267948966-0.5235987755982988*sin((sine+3)*5),1.5707963267948966)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966-0.5235987755982988*sin((sine+2)*5),-0.5235987755982988*sin((sine+3)*5),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(1.5707963267948966-0.5235987755982988*sin((sine+2)*5),1.5707963267948966+0.5235987755982988*sin((sine+3)*5),-1.5707963267948966)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(1.5707963267948966-0.5235987755982988*sin((sine+2)*5),-1.5707963267948966+0.5235987755982988*sin((sine+3)*5),1.5707963267948966)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.5 * sin((sine+3)*5),0,-0.5 * sin((sine+2)*5)),angles(-1.5707963267948966+0.5235987755982988*sin((sine+2)*5),0.5235987755982988*sin((sine+3)*5),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(1.5707963267948966-0.5235987755982988*sin((sine+2)*5),-1.5707963267948966+0.5235987755982988*sin((sine+3)*5),1.5707963267948966)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,-90,-30,2,5,0.5,0,0,1,90,-30,3,5,0,0,0,1,90,0,0,1,Head,0,0,0,1,-90,-30,2,5,1,0,0,1,0,-30,3,5,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,90,-30,2,5,-1,0,0,1,90,30,3,5,0,0,0,1,-90,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,90,-30,2,5,0.5,0,0,1,-90,30,3,5,0,0,0,1,90,0,0,1,Torso,0,-.5,3,5,-90,30,2,5,0,0,0,1,0,30,3,5,0,-.5,2,5,180,0,0,1,LeftLeg,-1,0,0,1,90,-30,2,5,-1,0,0,1,-90,30,3,5,0,0,0,1,90,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1
                elseif mode == "Twerk" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "spaghetti" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+1*sin((sine+1)*5),1.5,1 * sin((sine+2)*5)),angles(1.5707963267948966,1.5707963267948966,1.5707963267948966)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(3 * sin((sine+2)*5),5,3 * sin((sine+3)*5)),angles(-1.5707963267948966+0.3490658503988659*sin((sine+3)*5),0.3490658503988659*sin((sine+2)*5),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+1*sin((sine+1)*5),-1,1 * sin((sine+2)*5)),angles(0,1.5707963267948966,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5+2*sin((sine+2)*5),4.5,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*5),2,1 * sin((sine+1)*5)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+2*sin((sine+2)*5),-3,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,-0.5,1,1,5,90,0,0,1,1.5,0,0,1,90,0,3,5,0,1,2,5,90,0,0,1,Head,0,3,2,5,-90,20,3,5,5,0,0,1,0,20,2,5,0,3,3,5,180,0,0,1,RightLeg,0.5,1,1,5,0,0,0,1,-1,0,0,1,90,0,0,1,0,1,2,5,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,0.5,2,2,5,0,0,0,1,4.5,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Torso,0,1,0,5,-90,0,0,1,2,0,0,1,0,0,0,1,0,1,1,5,180,0,0,1,LeftLeg,-0.5,2,2,5,0,0,0,1,-3,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "Tornado" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+5*sin(sine*4),0.5,5 * sin((sine+2)*4)),angles(1.5707963267948966+1.5707963267948966*sin(sine*4),1.5707963267948966*sin((sine+2)*4),-1.5707963267948966-1.5707963267948966*sin((sine+2)*4))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-3-0.5*sin(sine*1),0),angles(-1.5707963267948966-0.08726646259971647*sin(sine*4),0.06981317007977318*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5-6*sin((sine+2)*4),0,-6 * sin((sine+4)*4)),angles(1.5707963267948966+1.5707963267948966*sin((sine+2)*4),1.5707963267948966*sin((sine+4)*4),-1.5707963267948966-1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.3 * sin((sine+2)*4),0.5 * sin(sine*1),0.3 * sin(sine*4)),angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),-0.08726646259971647*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+6*sin((sine+2)*4),0,6 * sin((sine+4)*4)),angles(1.5707963267948966-1.5707963267948966*sin((sine+2)*4),-1.5707963267948966*sin((sine+4)*4),1.5707963267948966+1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5-5*sin(sine*4),0.5,-5 * sin((sine+2)*4)),angles(-1.5707963267948966+1.5707963267948966*sin(sine*4),-1.5707963267948966*sin((sine+2)*4),1.5707963267948966+1.5707963267948966*sin((sine+2)*1))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,-0.5,5,0,4,90,90,0,4,0.5,0,0,1,0,90,2,4,0,5,2,4,-90,-90,2,4,Head,0,0,2,4,-90,-5,0,4,-3,-0.5,0,1,0,4,2,4,0,0,0,4,180,0,0,1,RightLeg,0.5,-6,2,4,90,90,2,4,0,0,0,1,0,90,4,4,0,-6,4,4,-90,-90,4,4,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,0.5,-5,0,4,-90,90,0,4,0.5,0,0,1,0,-90,2,4,0,-5,2,4,90,90,2,1,Torso,0,-.3,2,4,-90,5,0,4,0,0.5,0,1,0,-5,2,4,0,.3,0,4,180,0,0,1,LeftLeg,-0.5,6,2,4,90,-90,2,4,0,0,0,1,0,-90,4,4,0,6,4,4,90,90,4,4,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "ragdoll" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(-1.5707963267948966-0.5235987755982988*sin((sine+2)*5),1.5707963267948966-0.5235987755982988*sin((sine+3)*5),1.5707963267948966)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.5235987755982988*sin((sine+2)*5),0.5235987755982988*sin((sine+3)*5),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(1.5707963267948966-0.5235987755982988*sin((sine+2)*5),1.5707963267948966+0.5235987755982988*sin((sine+3)*5),-1.5707963267948966)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(1.5707963267948966-0.5235987755982988*sin((sine+2)*5),-1.5707963267948966+0.5235987755982988*sin((sine+3)*5),1.5707963267948966)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.5 * sin((sine+1)*5),0,0.5 * sin(sine*5)),angles(-1.5707963267948966-0.08726646259971647*sin((sine+1)*5),-0.08726646259971647*sin((sine+2)*5),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(1.5707963267948966-0.5235987755982988*sin((sine+2)*5),-1.5707963267948966+0.5235987755982988*sin((sine+3)*5),1.5707963267948966)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,-90,-30,2,5,0.5,0,0,1,90,-30,3,5,0,0,0,1,90,0,0,1,Head,0,0,0,1,-90,30,2,5,1,0,0,1,0,30,3,5,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,90,-30,2,5,-1,0,0,1,90,30,3,5,0,0,0,1,-90,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,90,-30,2,5,0.5,0,0,1,-90,30,3,5,0,0,0,1,90,0,0,1,Torso,0,.5,1,5,-90,-5,1,5,0,0,0,1,0,-5,2,5,0,.5,0,5,180,0,0,1,LeftLeg,-1,0,0,1,90,-30,2,5,-1,0,0,1,-90,30,3,5,0,0,0,1,90,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1
                elseif mode == "Classic r6" then
                    walkSpeed = 16
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1
                elseif mode == "mayhem" then
                    walkSpeed = 12
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.4,-1-0.2*sin(sine*5),0.2 * sin((sine+1)*5)),angles(-0.17453292519943295+0.17453292519943295*sin((sine+1)*5),-0.3490658503988659-0.17453292519943295*sin((sine+1)*5),0.08726646259971647*sin((sine+1)*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5-0.1*sin((sine+1)*5),-0.7-0.2*sin((sine+1)*5),-0.3-0.3*sin(sine*5)),angles(0.3490658503988659-0.17453292519943295*sin(sine*5),0.3490658503988659+0.17453292519943295*sin((sine+1)*5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*5))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1+0.1*sin((sine+2)*5),0.2,-1+0.1*sin((sine+2)*5)),angles(0.3490658503988659-0.2617993877991494*sin((sine+2)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5),-0.17453292519943295+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.1 * sin((sine+1)*5),-0.3+0.2*sin(sine*5),0.2 * sin((sine+1)*5)),angles(-1.9198621771937625+0.08726646259971647*sin((sine+1)*5),-0.08726646259971647+0.08726646259971647*sin((sine+1)*5),2.792526803190927)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.3962634015954636-0.08726646259971647*sin(sine*5),0.08726646259971647-0.08726646259971647*sin(sine*5),3.3161255787892263+0.2617993877991494*sin(sine*100))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1.3-0.3*sin((sine+1)*5),-0.5+0.1*sin((sine+1)*5)),angles(2.6179938779914944+0.17453292519943295*sin((sine+1)*5),0.8726646259971648,0.8726646259971648-0.2617993877991494*sin((sine+1)*5))),deltaTime) 
                    --MW_animatorProgressSave: RightLeg,0.4,0,0,1,-10,10,1,5,-1,-0.2,0,5,-20,-10,1,5,0,0.2,1,5,0,5,1,5,LeftLeg,-0.5,-0.1,1,5,20,-10,0,5,-0.7,-0.2,1,5,20,10,1,5,-0.3,-0.3,0,5,-20,10,1,5,RightArm,1,0.1,2,5,20,-15,2,5,0.2,0,0,1,30,-10,2,5,-1,0.1,2,5,-10,10,2,5,Torso,0,0.1,1,5,-110,5,1,5,-0.3,0.2,0,5,-5,5,1,5,0,0.2,1,5,160,0,0,1,Head,0,0,0,1,-80,-5,0,5,1,0,0,1,5,-5,0,5,0,0,0,1,190,15,0,100,LeftArm,-1.5,0,1,5,150,10,1,5,1.3,-0.3,1,5,50,0,1,5,-0.5,0.1,1,5,50,-15,1,5
                elseif mode == "CHAOS" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.9198621771937625+0.08726646259971647*sin((sine+2)*5),-0.17453292519943295+0.17453292519943295*sin(sine*100),3.3161255787892263+0.17453292519943295*sin(sine*99))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1-0.1*sin(sine*5),-0.05 * sin(sine*5)),angles(0,-0.17453292519943295,-0.08726646259971647)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5-0.1*sin((sine+3)*5),0.4-0.2*sin((sine+2)*5),-0.7-0.1*sin((sine+2)*5)),angles(0.3490658503988659+0.3490658503988659*sin(sine*98),0.3490658503988659+0.17453292519943295*sin(sine*101),0.17453292519943295-0.2617993877991494*sin((sine+3)*5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5-0.2*sin((sine+2)*5),-0.5-0.1*sin((sine+2)*5)),angles(0.3490658503988659+0.3490658503988659*sin(sine*99),-0.3490658503988659+0.17453292519943295*sin(sine*100),-0.3490658503988659+0.2617993877991494*sin((sine+3)*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7-0.1*sin(sine*5),-0.05 * sin(sine*5)),angles(0.3490658503988659,0.3490658503988659,-0.17453292519943295)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.02 * sin(sine*5),-0.3+0.1*sin(sine*5),0),angles(-1.9198621771937625,-0.08726646259971647,2.9670597283903604)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,-110,5,2,5,1,0,0,1,-10,10,0,100,0,0,0,1,190,10,0,99,RightLeg,0.5,0,0,1,0,0,0,1,-1,-0.1,0,5,-10,0,0,1,0.,-0.05,0,5,-5,0,0,1,RightArm,1.5,-0.1,3,5,20,20,0,98,0.4,-0.2,2,5,20,10,0,101,-0.7,-0.1,2,5,10,-15,3,5,LeftArm,-1.5,0,0,1,20,20,0,99,0.5,-0.2,2,5,-20,10,0,100,-0.5,-0.1,2,5,-20,15,3,5,LeftLeg,-0.5,0,0,0,20,0,0,1,-0.7,-0.1,0,5,20,0,0,1,0,-0.05,0,5,-10,0,0,1,Torso,0,-0.02,0,5,-110,0,0,1,-0.3,0.1,0,5,-5,0,0,1,0,0,0,1,170,0,0,1
                elseif mode == "Thrust On Face" then
                    walkSpeed = 16
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,-0.3490658503988659)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,0.3490658503988659)),deltaTime) 
                    --MW_animatorProgressSave: Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1.5,0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,-30,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1.5,-0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.Head.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 1, -1) * CFrame.Angles(0, math.rad(180), 0)
                    end
                elseif mode == "Laugh" then
                    walkSpeed = 16
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.15+0.15*sin(sine*10),0.5),angles(-0.7853981633974483,0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7-0.1*sin(sine*10),0.5+0.1*sin(sine*10)),angles(-0.7853981633974483,0,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.6-0.05*sin(sine*10),0.1 * sin(sine*10),-0.2+0.05*sin(sine*10)),angles(-0.8726646259971648,0.17453292519943295+0.08726646259971647*sin(sine*10),-0.17453292519943295-0.08726646259971647*sin(sine*10))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4,0.7+0.1*sin(sine*10),-0.5),angles(2.9670597283903604+0.05235987755982989*sin((sine+0.5)*10),0.17453292519943295+0.05235987755982989*sin(sine*10),-0.9599310885968813)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.7-0.1*sin(sine*10),0.5+0.1*sin(sine*10)),angles(-0.7853981633974483,0,0)),deltaTime) 
                    --MW_animatorProgressSave: Torso,0,0,0,2,-45,0,0,2,-0.15,0.15,0,10,0,0,0,2,0.5,0,0,2,180,0,0,2,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,256,0,0,0,256,0.09050845354795456,0,0,256,0,0,0,256,-0.07476425170898438,0,0,256,0,0,0,256,LeftLeg,-0.5,0,0,2,-45,0,0,2,-0.7,-0.1,0,10,0,0,0,2,0.5,0.1,0,10,0,0,0,10,Head,0,0,0,2,-60,0,0,2,1,0,0,2,0,0,0,2,0,0,0,2,180,0,0,2,LeftArm,-1.6,-0.05,0,10,-50,0,0,2,0.,0.1,0,10,10,5,0,10,-0.2,0.05,0,10,-10,-5,0,10,RightArm,1.4,0,0,2,170,3,0.5,10,0.7,0.1,0,10,10,3,0,10,-0.5,0,0,2,-55,0,0,2,RightLeg,0.5,0,0,2,-45,0,0,2,-0.7,-0.1,0,10,0,0,0,2,0.5,0.1,0,10,0,0,0,2,hair_Handle,-0.014593426138162613,0,0,256,-180,0,0,256,0.36794137954711914,0,0,256,0,0,0,256,0.181226909160614,0,0,256,180,0,0,256
                elseif mode == "Shavine Script" then 
                    walkSpeed = 16
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1-0.1*sin(sine*5),0.5),angles(-0.08726646259971647*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4+0.1*sin((sine+1)*5),-0.5),angles(-0.17453292519943295*sin((sine+2)*5),0,-0.17453292519943295+0.08726646259971647*sin(sine*5))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.1 * sin(sine*5),0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.08726646259971647*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.08726646259971647*sin((sine+2)*5),0,3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4+0.1*sin((sine+1)*5),-0.5),angles(-0.17453292519943295*sin((sine+2)*5),0,0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.1*sin(sine*5),0.5),angles(-0.08726646259971647*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                elseif mode == "No" then 
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0.3490658503988659*sin((sine+1)*5),3.141592653589793-0.8726646259971648*sin((sine+1)*5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4-0.2*sin((sine+3)*5),-0.5),angles(-0.5235987755982988*sin((sine+3)*5),0,-0.17453292519943295)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4+0.2*sin((sine+3)*5),-0.5),angles(0.5235987755982988*sin((sine+3)*5),0,0.17453292519943295)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-0.5,-1,0.5),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(0.5,-1,0.5),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.4 * sin(sine*5),0,0),angles(-1.5707963267948966,0.17453292519943295*sin(sine*5),3.141592653589793-0.5235987755982988*sin(sine*5))),deltaTime) 
                
                elseif mode == "Yes" then 
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.5235987755982988*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4-0.2*sin((sine+2)*5),-0.5),angles(-0.3490658503988659*sin((sine+2)*5),0,-0.17453292519943295)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4-0.2*sin((sine+2)*5),-0.5),angles(-0.3490658503988659*sin((sine+2)*5),0,0.17453292519943295)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-0.5,-1,0.5),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(0.5,-1,0.5),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0,0.5 * sin(sine*5)),angles(-1.5707963267948966+0.17453292519943295*sin(sine*5),0,3.141592653589793)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,-90,30,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1.5,0,0,1,0,-20,2,5,0.4,-0.2,2,5,0,0,0,1,-0.5,0,0,1,-10,0,0,1,RightArm,1.5,0,0,1,0,-20,2,5,0.4,-0.2,2,5,0,0,0,1,-0.5,0,0,1,10,0,0,1,LeftLeg,-0.5,0,0,1,0,0,0,5,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,10,0,5,0,0,0,1,0,0,0,1,0,0.5,0,5,180,0,0,1
                elseif mode == "Wave" then 
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5+0.3*sin((sine+1)*10),1.3-0.3*sin((sine+1)*10),0.5),angles(3.141592653589793,0,0.6981317007977318-0.6981317007977318*sin((sine+3)*10))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(0,0,-0.3490658503988659-0.08726646259971647*sin((sine+1)*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.45,-1-0.05*sin(sine*5),0.5),angles(0,0.08726646259971647,-0.13962634015954636+0.08726646259971647*sin(sine*5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.45,-1.1+0.05*sin(sine*5),0.5),angles(0,-0.08726646259971647,-0.05235987755982989+0.08726646259971647*sin(sine*5))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.1 * sin(sine*5),0,0),angles(-1.5707963267948966,-0.08726646259971647+0.08726646259971647*sin(sine*5),3.141592653589793)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,-0.17453292519943295+0.17453292519943295*sin((sine+1)*5),3.141592653589793)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.5,0.3,1,10,180,0,0,1,1.3,-0.3,1,10,0,0,0,1,0.5,0,1,10,40,-40,3,10,LeftArm,-1.5,0,0,1,0,0,0,1,0.4,0,0,5,0,0,0,1,-0.5,0,0,1,-20,-5,1,5,LeftLeg,-0.45,0,0,5,0,0,0,1,-1,-0.05,0,5,5,0,0,1,0.5,0,0,1,-8,5,0,5,RightLeg,0.45,0,0,1,0,0,0,1,-1.1,0.05,0,5,-5,0,0,1,0.5,0,0,1,-3,5,0,5,Torso,0,0.1,0,5,-90,0,0,1,0,0,0,5,-5,5,0,5,0,0,0,1,180,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-10,10,1,5,0,0,0,1,180,0,0,1
                elseif mode == "Point" then 
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966-0.08726646259971647*sin((sine+1)*5),0.08726646259971647-0.08726646259971647*sin(sine*5),2.792526803190927)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.2 * sin((sine+1)*5),-0.05+0.1*sin(sine*5),0),angles(-1.5707963267948966,-0.08726646259971647+0.05235987755982989*sin((sine+1)*5),3.490658503988659)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+0.1*sin((sine+1)*5),-1-0.1*sin(sine*5),0.5),angles(0,-0.08726646259971647,0.05235987755982989-0.05235987755982989*sin((sine+1)*5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.6,0.5+0.1*sin(sine*5),-0.3),angles(-0.17453292519943295,0.3490658503988659,-0.3490658503988659+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.1*sin(sine*5),0.5),angles(0,0.08726646259971647,-0.08726646259971647-0.03490658503988659*sin((sine+1)*5))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4,1,-0.5+0.2*sin(sine*5)),angles(1.3962634015954636+0.08726646259971647*sin((sine+1)*5),0.5235987755982988+0.08726646259971647*sin(sine*5),0.3490658503988659)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,-90,-5,1,5,1,0,0,1,5,-5,0,5,0,0,0,1,160,0,0,1,Torso,0,0.2,1,5,-90,0,0,1,-0.05,0.1,0,5,-5,3,1,5,0,0,0,1,200,0,0,1,RightLeg,0.5,0.1,1,5,0,0,0,1,-1,-0.1,0,5,-5,0,0,1,0.5,0,0,1,3,-3,1,5,LeftArm,-1.6,0,0,1,-10,0,0,1,0.5,0.1,0,5,20,0,0,1,-0.3,0,0,1,-20,10,2,5,LeftLeg,-0.5,0,0,1,0,0,0,1,-1,-0.1,0,5,5,0,0,1,0.5,0,0,1,-5,-2,1,5,RightArm,1.4,0,0,1,80,5,1,5,1,0,0,1,30,5,0,5,-0.5,0.2,0,5,20,0,0,5
                elseif mode == "Scared" then 
                    walkSpeed = 30
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.08726646259971647*sin(sine*5),-0.2617993877991494*sin(sine*50),3.141592653589793+0.5235987755982988*sin(sine*1))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.1 * sin(sine*50),-0.1 * sin(sine*5),-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966-0.08726646259971647*sin((sine+1)*5),0.08726646259971647*sin(sine*50),3.141592653589793+0.08726646259971647*sin(sine*55))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1+0.1*sin(sine*50),0.5+0.1*sin(sine*52),-0.5+0.1*sin(sine*54)),angles(1.3962634015954636,-0.17453292519943295,-1.3962634015954636)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*5),0.5),angles(0.08726646259971647*sin((sine+1)*5),0.08726646259971647+0.08726646259971647*sin(sine*55),-0.08726646259971647+0.08726646259971647*sin(sine*50))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1+0.1*sin(sine*52),0.5+0.1*sin(sine*50),-0.6+0.1*sin(sine*54)),angles(1.2217304763960306+0.17453292519943295*sin(sine*5),0.17453292519943295,0.8726646259971648)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.4,-1+0.1*sin(sine*5),0.5),angles(0.08726646259971647*sin((sine+1)*5),-0.08726646259971647+0.08726646259971647*sin(sine*55),0.08726646259971647+0.08726646259971647*sin(sine*50))),deltaTime) 
                elseif mode == "AMOGUS" then 
                    walkSpeed = 16
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.05-0.1*sin(sine*5),-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966-0.08726646259971647*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.1*sin(sine*5),0.5),angles(0.08726646259971647*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-0.4-0.1*sin((sine+1)*5),-0.5+0.05*sin((sine+2)*5)),angles(-1.5707963267948966-0.08726646259971647*sin((sine+2)*5),0,3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.25,0.4-0.05*sin((sine+1)*5),0.5),angles(0.08726646259971647,0.17453292519943295,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.25,0.4-0.05*sin((sine+1)*5),0.5),angles(0.08726646259971647,-0.17453292519943295,0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*5),0.5),angles(0.08726646259971647*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                    --MW_animatorProgressSave: Torso,0,0,0,1,-90,-5,1,5,-0.05,-0.1,0,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,0,5,1,5,-1,0.1,0,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,Head,0,0,0,1,-90,-5,2,5,-0.4,-0.1,1,5,0,0,0,1,-0.5,0.05,2,5,180,0,0,1,RightArm,0.25,0,0,1,5,0,0,1,0.4,-0.05,1,5,10,0,0,1,0.5,0,0,1,0,0,0,1,LeftArm,-0.25,0,0,1,5,0,0,1,0.4,-0.05,1,5,-10,0,0,1,0.5,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,0,5,1,5,-1,0.1,0,5,5,0,0,1,0.5,0,0,1,-3,0,0,1
                elseif mode == "Chase" then
                    walkSpeed = 30
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.03490658503988659*sin((sine+1)*2),0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5-0.01*sin((sine+2)*2),0.4-0.1*sin((sine+2)*2),-0.5+0.1*sin((sine+1)*2)),angles(-0.06981317007977318*sin((sine+2)*2),0.06981317007977318*sin((sine+2)*2),-0.17453292519943295-0.017453292519943295*sin(sine*-4.2))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.03490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,1,-0.3),angles(2.9670597283903604+0.2617993877991494*sin((sine+2)*5),2.792526803190927,0.6981317007977318)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.1*sin((sine+1)*3),0.5),angles(-0.06981317007977318*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin((sine+1)*3),0.5),angles(-0.06981317007977318*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,-100,-2,1,2,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,SlickBackYakuzaBlack_Handle,-3.552713678800501e-15,0,0,1,180,0,0,1,0.3807339668273926,0,0,1,0,0,0,1,0.21092987060546875,0,0,1,180,0,0,1,LeftArm,-1.5,-0.01,2,2,0,-4,2,2,0.4,-0.1,2,2,0,4,2,2,-0.5,0.1,1,2,-10,-1,0,-4.2,LongHair_Handle,-0.00004900000203633681,0,0,1,0,0,0,1,1.10490083694458,0,0,1,0,0,0,1,-0.4286848306655884,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,2,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightArm,1.5,0,2,2,170,15,2,5,1,0,2,2,160,0,2,0,-0.3,0,1,2,40,-0.6,0,0,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,0,-4,1,5,-1,0.1,1,3,-5,0,0,1,0.5,0,0,1,3,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,0,-4,1,5,-1,0.1,1,3,5,0,0,1,0.5,0,0,1,-3,0,0,1
                elseif mode == "wait🤚" then 
                            walkSpeed = 16
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.2,-1,0),angles(0,0.3490658503988659,0)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.4+0.1*sin((sine+1)*2),1,0),angles(2.9670597283903604+0.08726646259971647*sin(sine*2),-0.5235987755982988+0.17453292519943295*sin((sine+2)*2),-0.3490658503988659+0.08726646259971647*sin((sine+1)*2))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.1 * sin(sine*2),-0.05 * sin(sine*2),0.5),angles(-1.7453292519943295,0.08726646259971647+0.03490658503988659*sin(sine*2),3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+0.1*sin(sine*2),-1+0.05*sin(sine*2),0),angles(0.3490658503988659,0,0.17453292519943295-0.05235987755982989*sin(sine*2))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,-0.08726646259971647,3.141592653589793)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.3,-0.2),angles(-0.17453292519943295-0.17453292519943295*sin((sine+1)*2),-0.3490658503988659,0.08726646259971647*sin(sine*2))),deltaTime) 
                        --MW_animatorProgressSave: LeftLeg,-0.2,0,0,1,0,0,0,1,-1,0,0,1,20,0,0,1,0,0,0,1,0,0,0,2,LeftArm,-1.4,0.1,1,2,170,5,0,2,1,0,0,1,-30,10,2,2,0,0,0,1,-20,5,1,2,Torso,0,0.1,0,2,-100,0,0,1,0,-0.05,0,2,5,2,0,2,0.5,0,0,2,180,0,0,1,RightLeg,0.5,0.1,0,2,20,0,0,1,-1,0.05,0,2,0,0,0,1,0,0,0,1,10,-3,0,2,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-5,0,0,1,0,0,0,1,180,0,0,1,RightArm,1.5,0,0,1,-10,-10,1,2,0.3,0,0,1,-20,0,0,1,-0.2,0,0,1,0,5,0,2
                        task.wait(0.7)
                        if mode == "wait🤚" then
                        mode = "wait2"
                end
                elseif mode == "wait2" then 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.2,-1,0.3),angles(-0.5235987755982988,0.5235987755982988,0.3490658503988659)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.4+0.1*sin((sine+1)*2),1,-0.5),angles(1.5707963267948966+0.08726646259971647*sin(sine*2),-0.5235987755982988+0.17453292519943295*sin((sine+2)*2),-0.3490658503988659+0.08726646259971647*sin((sine+1)*2))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.1 * sin(sine*2),-0.05 * sin(sine*2),0),angles(-1.7453292519943295,0.08726646259971647+0.03490658503988659*sin(sine*2),2.792526803190927)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+0.1*sin(sine*2),-1+0.05*sin(sine*2),0),angles(0.17453292519943295,0,-0.05235987755982989*sin(sine*2))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.490658503988659)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.3,0.5),angles(-0.5235987755982988-0.17453292519943295*sin((sine+1)*2),-0.6981317007977318,-0.17453292519943295+0.08726646259971647*sin(sine*2))),deltaTime) 
                    --MW_animatorProgressSave: LeftLeg,-0.2,0,0,1,-30,0,0,1,-1,0,0,1,30,0,0,1,0.3,0,0,1,20,0,0,2,LeftArm,-1.4,0.1,1,2,90,5,0,2,1,0,0,1,-30,10,2,2,-0.5,0,0,1,-20,5,1,2,Torso,0,0.1,0,2,-100,0,0,1,0,-0.05,0,2,5,2,0,2,0,0,0,2,160,0,0,1,RightLeg,0.5,0.1,0,2,10,0,0,1,-1,0.05,0,2,0,0,0,1,0,0,0,1,0,-3,0,2,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,200,0,0,1,RightArm,1.5,0,0,1,-30,-10,1,2,0.3,0,0,1,-40,0,0,1,0.5,0,0,1,-10,5,0,2
                    task.wait(1.2)
                    if mode == "wait2" then
                        mode = "wait3"
                    end
                elseif mode == "wait3" then 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+0.2*sin((sine+1)*20),-1-0.05*sin(sine*20),0.5),angles(0,0,-0.05235987755982989+0.2617993877991494*sin(sine*20))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5+0.2*sin((sine+1)*20),0.4,-0.3),angles(0.17453292519943295,0,-0.17453292519943295+0.4363323129985824*sin((sine+1)*20))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.2 * sin((sine+1)*20),0,0),angles(-1.5707963267948966,0.17453292519943295*sin(sine*20),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+0.2*sin((sine+1)*20),-1+0.05*sin(sine*20),0.5),angles(0,0,0.05235987755982989+0.2617993877991494*sin(sine*20))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295,0.17453292519943295*sin((sine+2)*20),3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5+0.2*sin((sine+1)*20),0.4,-0.3),angles(0.17453292519943295,0,0.17453292519943295+0.4363323129985824*sin((sine+1)*20))),deltaTime) 
                    task.wait(2)

                    if mode == "wait3" then
                    mode = "wait🤚"
                end

        elseif mode == "Jerking Off" then 
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.4,-1),angles(0.6981317007977318+0.2617993877991494*sin(sine*15),0,-0.8726646259971648)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightArm,1,0,0,1,40,15,0,15,0.4,0,0,1,0,0,0,5,-1,0,0,1,-50,0,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1
        elseif mode == "Hugo Hilaire" then
                        walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.3,0.2-0.2*sin(sine*10),-0.5-0.8*sin((sine-0.5) * 2.5)),angles(0.6981317007977318*sin((sine+0.5)*-2.5),0,0.7853981633974483*sin((sine-0.5)*-5))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(-5.960464477539063e-08+0.1*sin((sine+1)*10),1.0000171184539794+0.12*sin(sine*5),1.1920928955078125e-07),angles(-1.5707963267948966,-0.2617993877991494*sin(sine*5),3.141592653589793-0.17453292519943295*sin(sine*10))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1+0.2*sin(sine*-6),-1-0.2*sin((sine+1)*-6),-0.6),angles(-0.3490658503988659,1.5707963267948966+0.13962634015954636*sin((sine-10)*-8),0)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.3,0.2-0.2*sin(sine*10),-0.5-0.8*sin((sine+0.5)*2.5)),angles(0.6981317007977318*sin((sine+0.5)*2.5),0,0.7853981633974483*sin((sine+0.5)*5))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-1.1920928955078125e-07,0.20002491772174835+0.2*sin(sine*5),7.644625506630354e-20),angles(-1.5707963267948966+0.13962634015954636*sin(sine*5),0.06981317007977318*sin(sine*6),3.141592653589793+0.17453292519943295*sin((sine+2)*3))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1+0.2*sin(sine*6),-1-0.2*sin((sine+1)*6),-0.6),angles(-0.3490658503988659,-1.5707963267948966+0.13962634015954636*sin((sine-10)*8),0)),deltaTime) 
                    --MW_animatorProgressSave: RightLeg,1,0.2,0,-6,-20,0,0,-6,-1,-0.2,1,-6,90,8,-10,-8,-0.6,0,0,-1,0,0,0,-2,LeftLeg,-1,0.2,0,6,-20,0,0,6,-1,-0.2,1,6,-90,8,-10,8,-0.6,0,0,1,0,0,0,2,LeftArm,-1.3,0,0.5,5,0,40,0.5,-2.5,0.2,-0.2,0,10,0,0,0,-5,-0.5,-0.8,-0.5,2.5,0,45,-0.5,-5,RightArm,1.3,0,0.5,5,0,40,0.5,2.5,0.2,-0.2,0,10,0,0,0,5,-0.5,-0.8,0.5,2.5,0,45,0.5,5,Torso,-1.1920928955078125e-07,0,0,2,-90,8,0,5,0.20002491772174835,0.2,0,5,0,4,0,6,7.644625506630354e-20,0,0,2,180,10,2,3,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,Head,-5.960464477539063e-08,0.1,1,10,-90,0,0,2,1.0000171184539795,0.12,0,5,0,-15,0,5,1.1920928955078125e-07,0,0,2,180,-10,0,10             elseif mode == "goofy trolus" then
        elseif mode == "Silly Dance" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966-0.17453292519943295*sin((sine+1)*10),0.17453292519943295*sin((sine+1)*5),3.141592653589793)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.5 * sin(sine*5),0.2 * sin(sine*10),0.1 * sin(sine*10)),angles(-1.5707963267948966+0.08726646259971647*sin(sine*10),0.17453292519943295*sin(sine*5),3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5+0.5*sin((sine+1)*5),-0.5),angles(1.5707963267948966-0.5235987755982988*sin(sine*5),0.3490658503988659-0.3490658503988659*sin(sine*10),0.3490658503988659+0.6981317007977318*sin(sine*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1,0.5),angles(-0.08726646259971647*sin(sine*10),0.08726646259971647,-0.08726646259971647+0.5235987755982988*sin(sine*5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5-0.5*sin((sine+1)*5),-0.5),angles(1.5707963267948966+0.5235987755982988*sin(sine*5),-0.3490658503988659+0.3490658503988659*sin(sine*10),-0.3490658503988659+0.6981317007977318*sin(sine*5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,0.5),angles(-0.08726646259971647*sin(sine*10),-0.08726646259971647,0.08726646259971647+0.5235987755982988*sin(sine*5))),deltaTime) 
                                    --MW_animatorProgressSave: RightLeg,1,0.2,0,-6,-20,0,0,-6,-1,-0.2,1,-6,90,8,-10,-8,-0.6,0,0,-1,0,0,0,-2,LeftLeg,-1,0.2,0,6,-20,0,0,6,-1,-0.2,1,6,-90,8,-10,8,-0.6,0,0,1,0,0,0,2,LeftArm,-1.3,0,0.5,5,0,40,0.5,-2.5,0.2,-0.2,0,10,0,0,0,-5,-0.5,-0.8,-0.5,2.5,0,45,-0.5,-5,RightArm,1.3,0,0.5,5,0,40,0.5,2.5,0.2,-0.2,0,10,0,0,0,5,-0.5,-0.8,0.5,2.5,0,45,0.5,5,Torso,-1.1920928955078125e-07,0,0,2,-90,8,0,5,0.20002491772174835,0.2,0,5,0,4,0,6,7.644625506630354e-20,0,0,2,180,10,2,3,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,Head,-5.960464477539063e-08,0.1,1,10,-90,0,0,2,1.0000171184539795,0.12,0,5,0,-15,0,5,1.1920928955078125e-07,0,0,2,180,-10,0,10             elseif mode == "goofy trolus" then
    
        elseif mode == "goofy trolus" then
                    walkSpeed = 34
                    local rY, lY = raycastlegs()
    
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 0.75, -0.2) * euler(2.705260340591211 - 0.08726646259971647 * sin((sine + 0.1) * 2), 2.792526803190927, 0.6981317007977318), deltaTime)
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.75, -0.2) * euler(2.705260340591211 - 0.08726646259971647 * sin((sine + 0.1) * 2), -2.792526803190927, -0.6981317007977318), deltaTime)
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.9198621771937625 - 0.10471975511965978 * sin((sine + 0.3) * 2), 0, 3.141592653589793), deltaTime)
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -2.45 - 0.05 * sin(sine * 2), 0) * euler(0.03490658503988659 * sin(sine * 2), 0, 3.141592653589793), deltaTime)
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.3962634015954636 - 0.03490658503988659 * sin(sine * 2), 1.3089969389957472, -0.9599310885968813), deltaTime)
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.5707963267948966 - 0.03490658503988659 * sin(sine * 2), -1.3089969389957472, 1.5707963267948966), deltaTime)
        elseif mode == "Chest Lay" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,0.7+0.04*sin(sine*1)),angles(0.8726646259971648-0.08726646259971647*sin(sine*2),0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1.3,1.2),angles(-2.897246558310587,-2.0943951023931953,-0.5235987755982988+0.06981317007977318*sin(sine*2))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.9+0.08*sin(sine*1.2),0),angles(2.4085543677521746+0.03490658503988659*sin(sine*2),0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.6,0.8,0.5),angles(3.839724354387525,0.10471975511965978*sin(sine*1.5),0.5235987755982988+0.03490658503988659*sin(sine*1.5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1.2,0.8),angles(-2.705260340591211,1.7453292519943295,0.8726646259971648-0.06981317007977318*sin(sine*2))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.6,0.8,0.5),angles(3.839724354387525,-0.10471975511965978*sin(sine*1.5),-0.5235987755982988+0.03490658503988659*sin(sine*1.5))),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,50,-5,0,2,1.5,0,0,1,0,0,0,1,0.7,0.04,0,1,180,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-166,0,0,1,-1.3,0,0,1,-120,0,0,1,1.2,0,0,1,-30,4,0,2,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,Torso,0,0,0,1,138,2,0,2,-1.9  ,0.08,0,1.2,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1.6,0,0,1.5,220,0,0,1.5,0.8,0,0,1.5,0,6,0,1.5,0.5,0,0,1.5,30,2,0,1.5,RightLeg,1,0,0,1,-155,0,0,1,-1.2,0,0,1,100,0,0,1,0.8,0,0,1,50,-4,0,2,RightArm,1.6,0,0,1.5,220,0,0,1.5,0.8,0,0,1.5,0,-6,0,1.5,0.5,0,0,1.5,-30,2,0,1.5
        elseif mode == "laying" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.75, -0.2) * euler(2.705260340591211 - 0.08726646259971647 * sin((sine + 0.1) * 2), -2.792526803190927, -0.6981317007977318), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 0.75, -0.2) * euler(2.705260340591211 - 0.08726646259971647 * sin((sine + 0.1) * 2), 2.792526803190927, 0.6981317007977318), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.9198621771937625 - 0.10471975511965978 * sin((sine + 0.3) * 2), 0, 3.141592653589793), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -2.45 - 0.05 * sin(sine * 2), 0) * euler(0.03490658503988659 * sin(sine * 2), 0, 3.141592653589793), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.3962634015954636 - 0.03490658503988659 * sin(sine * 2), 1.3089969389957472, -0.9599310885968813), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.5707963267948966 - 0.03490658503988659 * sin(sine * 2), -1.3089969389957472, 1.5707963267948966), deltaTime) 
                    --LeftArm,-1,0,0,2,155,-5,0.1,2,0.75,0,0,2,-160,0,0,2,-0.2,0,0,2,-40,0,0,2,RightArm,1,0,0,2,155,-5,0.1,2,0.75,0,0,2,160,0,0,2,-0.2,0,0,2,40,0,0,2,Head,0,0,0,2,-110,-6,0.3,2,1,0,0,2,-0,0,0,2,0,0,0,2,180,0,0,2,Torso,0,0,0,2,0,2,0,2,-2.45,-0.05,0,2,-0,0,0,2,0,0,0,2,180,0,0,2,RightLeg,1,0,0,2,80,-2,0,2,-1,0,0,2,75,0,0,2,0,0,0,2,-55,0,0,2,LeftLeg,-1,0,0,2,90,-2,0,2,-1,0,0,2,-75,0,0,2,0,0,0,2,90,0,0,2
                elseif mode == "equinox" then
                    walkSpeed = 40
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0.08726646259971647*sin((sine+2)*2.5),3.490658503988659)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.8+0.1*sin((sine+1)*2.5),0),angles(-0.3490658503988659+0.17453292519943295*sin((sine+2)*2.5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.6,0.3-0.1*sin((sine+2)*2.5),-0.2),angles(0,-0.3490658503988659,0.3490658503988659-0.17453292519943295*sin((sine+4)*2.5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.3-0.1*sin((sine+2)*2.5),-0.5),angles(0.17453292519943295*sin((sine+0.5)*2.5),-0.17453292519943295,-0.17453292519943295+0.08726646259971647*sin((sine+4)*1.25))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.5+0.1*sin((sine+1.3)*2.5),-0.5),angles(-0.6981317007977318-0.17453292519943295*sin((sine+2)*2.5),0.17453292519943295,-0.05235987755982989)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1-0.3*sin(sine*2.5),0),angles(-1.5707963267948966+0.05235987755982989*sin((sine+0.5)*2.5),0.05235987755982989*sin((sine+0.5)*2.5),2.792526803190927)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,0.5,-90,0,0,0.5,1,0,0,0.5,0,5,2,2.5,0,0,0,0.5,200,0,0,0.5,RightLeg,0.5,0,0,0.5,-20,10,2,2.5,-0.8,0.1,1,2.5,-5,0,0,0.5,0,0,0,0.5,3,0,0,0.5,RightArm,1.6,0,0,0.5,0,0,0,0.5,0.3,-0.1,2,2.5,-20,0,0,0,-0.2,0,0,0.5,20,-10,4,2.5,LeftArm,-1.5,0,0,0.5,0,10,0.5,2.5,0.3,-0.1,2,2.5,-10,0,0,0.5,-0.5,0,0,0.5,-10,5,4,1.25,LeftLeg,-0.5,0,0,0.5,-40,-10,2,2.5,-0.5,0.1,1.3,2.5,10,0,0,0.5,-0.5,0,0,0.5,-3,0,0,0.5,Torso,0,0,0,0.5,-90,3,0.5,2.5,1,-0.3,0,2.5,0,3,0.5,2.5,0,0,0,0.5,160,0,0,0.5
                        
        elseif mode == "sit" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-0.9, 0.4 + 0.1 * sin(sine * 2), 0.3 - 0.15 * sin(sine * 2)) * euler(-1.0471975511965976 - 0.12217304763960307 * sin(sine * 2), -1.3962634015954636, -0.6981317007977318), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -1.85 - 0.1 * sin((sine + 0.2) * 2), 0) * euler(-1.3962634015954636 + 0.03490658503988659 * sin(sine * 2), -0.08726646259971647, 3.141592653589793), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 0.4 + 0.1 * sin(sine * 2), 0.2 - 0.15 * sin(sine * 2)) * euler(0.6108652381980153 - 0.12217304763960307 * sin(sine * 2), 1.2217304763960306, -0.7853981633974483), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.6580627893946132 - 0.03490658503988659 * sin((sine + 0.6) * 2), 0.10471975511965978 + 0.06981317007977318 * sin(sine * 0.66), 3.141592653589793 + 0.3490658503988659 * sin(sine * 0.66)), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, 0.2 + 0.15 * sin((sine + 0.2) * 2), -0.7 + 0.1 * sin(sine * 2)) * euler(1.4835298641951802 + 0.03490658503988659 * sin(sine * 2), 1.4835298641951802, -1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -0.75 + 0.1 * sin((sine + 0.2) * 2), -0.5) * euler(1.3962634015954636 - 0.03490658503988659 * sin(sine * 2), -1.6580627893946132, 0), deltaTime) 
                    --LeftArm,-0.9,0,0,2,-60,-7,0,2,0.4,0.1,0,2,-80,0,0,2,0.3,-0.15,0,2,-40,0,0,2,Torso,0,0,0,2,-80,2,0,2,-1.85,-0.1,0.2,2,-5,0,0,2,0,0,0,2,180,0,0,2,RightArm,1,0,0,2,35,-7,0,2,0.4,0.1,0,2,70,0,0,2,0.2,-0.15,0,2,-45,0,0,2,Head,0,0,0,2,-95,-2,0.6,2,1,0,0,2,6,4,0,0.66,0,0,0,2,180,20,0,0.66,RightLeg,1,0,0,2,85,2,0,2,0.2,0.15,0.2,2,85,0,0,2,-0.7,0.1,0,2,-90,0,0,2,LeftLeg,-1,0,0,2,80,-2,0,2,-0.75,0.1,0.2,2,-95,0,0,2,-0.5,0,0,2,0,0,0,2
        elseif mode == "Back Handstand" then 
                    walkSpeed = 12
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.7,1.2,0.9+0.04*sin(sine*3)),angles(-2.0943951023931953,-0.6981317007977318,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.65+0.03*sin(sine*3),0),angles(-0.22689280275926285+0.017453292519943295*sin(sine*3),-15.707963267948966,3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.7,1.2,0.9+0.04*sin(sine*3)),angles(-2.0943951023931953,1.0471975511965976,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.5707963267948966,1.2217304763960306,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.5707963267948966,-1.2217304763960306,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-0.5235987755982988,0.17453292519943295*sin(sine*1),3.141592653589793+0.5235987755982988*sin(sine*1))),deltaTime) 
        
        elseif mode == "rickroll" then
                                walkSpeed = 16
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -0.9 - 0.2 * sin(sine * 2), 0) * euler(1.5707963267948966, 1.6580627893946132 - 0.17453292519943295 * sin(sine + 0.8), -1.5707963267948966), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0.3 * sin(sine + 0.8), -0.1 + 0.2 * sin(sine * 2), 0) * euler(-1.5707963267948966, 0, -3.141592653589793), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966 + 0.08726646259971647 * sin((sine - 0.5) * 2), 0.08726646259971647 * sin(sine - 1), -3.141592653589793 + 0.2617993877991494 * sin(sine * 5)), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1 + 0.1 * sin(sine * 7), 0.2 - 0.1 * sin(sine + 0.8), -0.25) * euler(1.5707963267948966 + 0.5235987755982988 * sin(sine * 7), -0.6981317007977318, 0.3490658503988659 * sin(sine * 7)), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -0.9 - 0.2 * sin(sine * 2), 0) * euler(1.5707963267948966, -1.6580627893946132 - 0.17453292519943295 * sin(sine + 0.8), 1.5707963267948966), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1 + 0.1 * sin(sine * 7), 0.2 + 0.1 * sin(sine + 0.8), -0.25) * euler(1.5707963267948966 - 0.5235987755982988 * sin(sine * 7), 0.6981317007977318, 0.3490658503988659 * sin(sine * 7)), deltaTime) 
                    --RightLeg,1,0,0,1,90,0,0,1,-0.9,-0.2,0,2,95,-10,0.8,1,0,0,0,1,-90,0,0,1,Torso,0,0.3,0.8,1,-90,0,0,1,-0.1,0.2,0,2,0,0,0,1,0,0,0,1,-180,0,0,1,Head,0,0,0,1,-90,5,-0.5,2,1,0,0,1,0,5,-1,1,0,0,0,1,-180,15,0,5,Fedora_Handle,8.657480066176504e-09,0,0,1,-6,0,0,1,-0.15052366256713867,0,0,1,0,0,0,1,-0.010221302509307861,0,0,1,0,0,0,1,LeftArm,-1,0.1,0,7,90,30,0,7,0.2,-0.1,0.8,1,-40,0,0,1,-0.25,0,0,1,0,20,0,7,LeftLeg,-1,0,0,1,90,0,0,1,-0.9,-0.2,0,2,-95,-10,0.8,1,0,0,0,1,90,0,0,1,RightArm,1,0.1,0,7,90,-30,0,7,0.2,0.1,0.8,1,40,0,0,1,-0.25,0,0,1,-0,20,0,7
    
        elseif mode == "wave" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.5, 0) * euler(1.5707963267948966, -1.6580627893946132 + 0.08726646259971647 * sin((sine - 0.3) * 4), 1.5707963267948966), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1 + 0.15 * sin((sine - 0.4) * 4), 1.42, 0) * euler(1.5707963267948966, 1.4835298641951802 - 0.3490658503988659 * sin((sine - 0.4) * 4), 1.5707963267948966), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.4835298641951802, 0.04363323129985824 - 0.08726646259971647 * sin((sine + 0.1) * 4), -3.141592653589793 + 0.04363323129985824 * sin(sine * 4)), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0.1 * sin(sine * 4), 0, 0) * euler(-1.5707963267948966, -0.08726646259971647 + 0.08726646259971647 * sin(sine * 4), -3.141592653589793), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1.1 + 0.1 * sin(sine * 4), 0) * euler(1.5707963267948966, 1.5707963267948966 + 0.08726646259971647 * sin(sine * 4), -1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1 - 0.02 * sin(sine * 4), -0.925 - 0.07 * sin(sine * 4), 0) * euler(1.5707963267948966, -1.7453292519943295 + 0.08726646259971647 * sin(sine * 4), 1.5707963267948966), deltaTime) 
                    --LeftArm,-1,0,0,4,90,0,0,4,0.5,0,0,4,-95,5,-0.3,4,0,0,0,4,90,0,0,4,RightArm,1,0.15,-0.4,4,90,0,0,4,1.42,0,0,4,85,-20,-0.4,4,0,0,0,4,90,0,0,4,Head,0,0,0,4,-85,0,0,4,1,0,0,4,2.5,-5,0.1,4,0,0,0,4,-180,2.5,0,4,Torso,0,0.1,0,4,-90,0,0,4,0,0,0,4,-5,5,0,4,0,0,0,4,-180,0,0,4,RightLeg,1,0,0,4,90,0,0,4,-1.1,0.1,0,4,90,5,0,4,0,0,0,4,-90,0,0,4,LeftLeg,-1,-0.02,0,4,90,0,0,4,-0.925,-0.07,0,4,-100,5,0,4,0,0,0,4,90,0,0,4
    
        elseif mode == "dab" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1.5, 0.5, 0) * euler(-1.7453292519943295, 0.17453292519943295 - 0.04363323129985824 * sin(sine * 2), -1.4835298641951802), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -0.9000000953674316 - 0.1 * sin(sine * 2), 0) * euler(-1.3962634015954636, 1.3962634015954636, 1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1.0000001192092896 - 0.1 * sin(sine * 2), 0) * euler(-1.5707963267948966, -1.3962634015954636, -1.5707963267948966), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-2.0943951023931953 + 0.08726646259971647 * sin((sine - 1) * 2), -0.08726646259971647, 2.792526803190927), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 1.2000000476837158, 0) * euler(2.6179938779914944 + 0.08726646259971647 * sin((sine - 1) * 2), 0.6981317007977318, -1.3962634015954636), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0.1 * sin(sine * 2), 0) * euler(-1.6580627893946132, 0.08726646259971647, 3.0543261909900767), deltaTime) 
                    --LeftArm,-1.5,0,0,2,-100,0,0,2,0.5,0,0,2,10,-2.5,0,2,0,0,0,2,-85,0,0,2,RightLeg,1,0,0,2,-80,0,0,2,-0.9000000953674316,-0.1,0,2,80,0,0,2,0,0,0,2,90,0,0,2,LeftLeg,-1,0,0,2,-90,0,0,2,-1.0000001192092896,-0.1,0,2,-80,0,0,2,0,0,0,2,-90,0,0,2,Fedora_Handle,8.657480066176504e-09,0,0,2,-6,0,0,2,-0.15052366256713867,0,0,2,0,0,0,2,-0.010221302509307861,0,0,2,0,0,0,2,Head,0,0,0,2,-120,5,-1,2,1,0,0,2,-5,0,0,2,0,0,0,2,160,0,0,2,RightArm,1,0,0,2,150,5,-1,2,1.2000000476837158,0,0,2,40,0,0,2,0,0,0,2,-80,0,0,2,Torso,0,0,0,2,-95,0,0,2,0,0.1,0,2,5,0,0,2,0,0,0,2,175,0,0,2
    
        elseif mode == "blaze" then
                    walkSpeed = 16
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0.75 + 0.25 * sin(sine * 2), 0) * euler(-1.5707963267948966, 0, 3.141592653589793), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1.5 - 0.1 * sin((sine + 0.2) * 2), 0) * euler(-1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.4) * 2), 0, 3.141592653589793 + 0.3490658503988659 * sin(sine * 0.66)), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-0.5 - 1 * sin((sine + 0.2) * 2.2), -0.75 - 0.25 * sin(sine * 2), 1 * sin((sine + 0.95) * 2.2)) * euler(0, -1.5707963267948966, 0), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(0.5 + 1 * sin((sine + 0.2) * 2.2), -0.75 - 0.25 * sin(sine * 2), -1 * sin((sine + 0.95) * 2.2)) * euler(0, 1.5707963267948966, 0), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(-0.5 - 1.85 * sin(sine * 2), 0.8 - 0.5 * sin(sine * 2), -1.85 * sin((sine + 0.75) * 2)) * euler(0, 1.5707963267948966, 0), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(0.5 + 1.85 * sin(sine * 2), 0.8 - 0.5 * sin(sine * 2), 1.85 * sin((sine + 0.75) * 2)) * euler(0, -1.5707963267948966, 0), deltaTime) 
                    --Torso,0,0,0,2,-90,0,0,2,0.75,0.25,0,2,-0,0,0,2,0,0,0,2,180,0,0,2,Fedora_Handle,8.657480066176504e-09,0,0,2,-6,0,0,2,-0.15052366256713867,0,0,2,0,0,0,2,-0.010221302509307861,0,0,2,0,0,0,2,Head,0,0,0,2,-90,-5,0.4,2,1.5,-0.1,0.2,2,-0,0,0,2,0,0,0,2,180,20,0,0.66,LeftLeg,-0.5,-1,0.2,2.2,-0,0,0,2,-0.75,-0.25,0,2,-90,0,0,2,0,1,0.95,2.2,0,0,0,2,RightLeg,0.5,1,0.2,2.2,0,0,0,2,-0.75,-0.25,0,2,90,0,0,2,0,-1,0.95,2.2,0,0,0,2,RightArm,-0.5,-1.85,0,2,0,0,0,2,0.8,-0.5,0,2,90,0,0,2,0,-1.85,0.75,2,0,0,0,2,LeftArm,0.5,1.85,0,2,-0,0,0,2,0.8,-0.5,0,2,-90,0,0,2,0,1.85,0.75,2,0,0,0,2
    
        elseif mode == "T" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1.5, 0.5, 0) * euler(1.5707963267948966, 3.141592653589793, -1.5707963267948966), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(0, 1.5707963267948966, 0), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1.5, 0.5, 0) * euler(1.5707963267948966, 3.141592653589793, 1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(0, -1.5707963267948966, 0), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966, 0, -3.141592653589793), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0, 0) * euler(-1.5707963267948966, 0, -3.141592653589793), deltaTime) 
                    --RightArm,1.5,0,0,1,90,0,0,1,0.5,0,0,1,180,0,0,1,0,0,0,1,-90,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Fedora_Handle,8.657480066176504e-09,0,0,1,-6,0,0,1,-0.15052366256713867,0,0,1,0,0,0,1,-0.010221302509307861,0,0,1,0,0,0,1,LeftArm,-1.5,0,0,1,90,0,0,1,0.5,0,0,1,180,0,0,1,0,0,0,1,90,0,0,1,LeftLeg,-1,0,0,1,-0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,-180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,-180,0,0,1
    
        elseif mode == "float" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 0.5, 0) * euler(-1.7453292519943295, 1.5707963267948966 + 0.17453292519943295 * sin((sine + 1) * 2), 1.5707963267948966), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(1 * sin(sine * 2), 2 + 0.5 * sin(sine * 1), 0) * euler(-1.3962634015954636, 0.08726646259971647 * sin(sine * 2), 3.141592653589793), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.3962634015954636, -1.5707963267948966 + 0.08726646259971647 * sin((sine + 2) * 2), 1.5707963267948966), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.5, 0) * euler(1.3962634015954636, -1.5707963267948966 - 0.17453292519943295 * sin((sine + 1) * 2), 1.5707963267948966), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.3962634015954636, 1.5707963267948966 + 0.08726646259971647 * sin((sine + 2) * 2), -1.5707963267948966), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.0471975511965976 + 0.17453292519943295 * sin((sine + 1) * 1), -0.17453292519943295 * sin((sine + 0.5) * 2), 3.141592653589793 + 0.17453292519943295 * sin((sine + 0.2) * 2)), deltaTime) 
                    --RightArm,1,0,0,1,-100,0,0,1,0.5,0,0,1,90,10,1,2,0,0,0,1,90,0,0,1,Torso,0,1,0,2,-80,0,0,1,2,0.5,0,1,-0,5,0,2,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,80,0,0,1,-1,0,0,1,-90,5,2,2,0,0,0,1,90,0,0,1,LeftArm,-1,0,0,1,80,0,0,1,0.5,0,0,1,-90,-10,1,2,0,0,0,1,90,0,0,1,RightLeg,1,0,0,1,80,0,0,1,-1,0,0,1,90,5,2,2,0,0,0,1,-90,0,0,1,Head,0,0,0,1,-60,10,1,1,1,0,0,1,-0,-10,0.5,2,0,0,0,1,180,10,0.2,2
    
        elseif mode == "floss" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966 + 0.04363323129985824 * sin((sine + 0.125) * 16), -0.2617993877991494 * sin((sine + 0.05) * 8), -3.141592653589793 + 0.5235987755982988 * sin(sine * 1.1)), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(0.9 + 0.4 * sin(sine * 8), 0.5, -0.5 * sin((sine - 0.35) * 4)) * euler(1.5707963267948966 + 0.6981317007977318 * sin(sine * 4), 1.5707963267948966 + 0.8726646259971648 * sin(sine * 8), -1.5707963267948966 + 0.17453292519943295 * sin((sine - 0.35) * 4)), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(-0.1 * sin((sine + 0.4) * 8), 0, 0) * euler(-1.5707963267948966, 0.3490658503988659 * sin(sine * 8), -3.141592653589793), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1 - 0.4 * sin((sine - 0.01) * 8), 0) * euler(1.5707963267948966, -1.7453292519943295 + 0.5235987755982988 * sin(sine * 8), 1.5707963267948966), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1 + 0.4 * sin((sine - 0.01) * 8), 0) * euler(1.5707963267948966, 1.7453292519943295 + 0.5235987755982988 * sin(sine * 8), -1.5707963267948966), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-0.9 + 0.4 * sin(sine * 8), 0.5, 0.5 * sin((sine + 0.25) * 4)) * euler(1.5707963267948966, -1.5707963267948966 + 0.8726646259971648 * sin(sine * 8), 1.5707963267948966 + 0.6981317007977318 * sin((sine + 0.25) * 4)), deltaTime) 
                    --Head,0,0,0,8,-90,2.5,0.125,16,1,0,0,8,0,-15,0.05,8,0,0,0,8,-180,30,0,1.1,RightArm,0.9,0.4,0,8,90,40,0,4,0.5,0,0,8,90,50,0,8,0,-0.5,-0.35,4,-90,10,-0.35,4,Fedora_Handle,8.657480066176504e-09,0,0,8,-6,0,0,8,-0.15052366256713867,0,0,8,0,0,0,8,-0.010221302509307861,0,0,8,0,0,0,8,Torso,0,-0.1,0.4,8,-90,0,0,8,0,0,0,4,0,20,0,8,0,0,0,8,-180,0,0,8,LeftLeg,-1,0,0,8,90,0,0,8,-1,-0.4,-0.01,8,-100,30,0,8,0,0,0,8,90,0,0,8,RightLeg,1,0,0,8,90,0,0,8,-1,0.4,-0.01,8,100,30,0,8,0,0,0,8,-90,0,0,8,LeftArm,-0.9,0.4,0,8,90,0,0.25,4,0.5,0,0,8,-90,50,0,8,0,0.5,0.25,4,90,40,0.25,4
    
        elseif mode == "emote" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966, -0.4363323129985824 * sin(sine * 8), -3.141592653589793), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1 + 0.3 * sin(sine * 8), 0) * euler(1.5707963267948966, 1.5707963267948966 + 0.5235987755982988 * sin(sine * 8), -1.5707963267948966), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-0.5, 1, 0) * euler(-0.5235987755982988, -1.5707963267948966 - 0.5235987755982988 * sin(sine * 8), 3.141592653589793), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(0.5, 1, 0) * euler(-0.5235987755982988, 1.5707963267948966 - 0.5235987755982988 * sin(sine * 8), 3.141592653589793), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(-0.1 * sin(sine * 8), 0.2 * sin((sine + 0.1) * 16), 0) * euler(-1.5707963267948966, 0.2617993877991494 * sin(sine * 8), -3.141592653589793), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1 - 0.3 * sin(sine * 8), 0) * euler(1.5707963267948966, -1.5707963267948966 + 0.5235987755982988 * sin(sine * 8), 1.5707963267948966), deltaTime) 
                    --Head,0,0,0,8,-90,0,0,8,1,0,0,8,0,-25,0,8,0,0,0,8,-180,0,0,8,RightLeg,1,0,0,8,90,0,0,8,-1,0.3,0,8,90,30,0,8,0,0,0,8,-90,0,0,8,LeftArm,-0.5,0,0,8,-30,0,0,8,1,0,0,8,-90,-30,0,8,0,0,0,8,180,0,0,8,RightArm,0.5,0,0,8,-30,0,0,8,1,0,0,16,90,-30,0,8,0,0,0,8,180,0,0,8,Torso,0,-0.1,0,8,-90,0,0,8,0,0.2,0.1,16,0,15,0,8,0,0,0,8,-180,0,0,8,LeftLeg,-1,0,0,8,90,0,0,8,-1,-0.3,0,8,-90,30,0,8,0,0,0,8,90,0,0,8,Fedora_Handle,8.657480066176504e-09,0,0,8,-6,0,0,8,-0.15052366256713867,0,0,8,0,0,0,8,-0.010221302509307861,0,0,8,0,0,0,8
    
        elseif mode == "pushups" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1.2 - 0.3 * sin(sine * 4), 0.5 + 0.15 * sin(sine * 4), 0.4 - 0.6 * sin(sine * 4)) * euler(3.0543261909900767 - 0.17453292519943295 * sin(sine * 4), 1.3962634015954636 + 0.17453292519943295 * sin(sine * 4), -1.5707963267948966), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966, 0, 3.141592653589793), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.5707963267948966, -1.3962634015954636, 1.5707963267948966), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.5707963267948966, 1.3962634015954636, -1.5707963267948966), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -1.99 + 0.5 * sin(sine * 4), 0.15 * sin(sine * 4)) * euler(3.3161255787892263 + 0.17453292519943295 * sin(sine * 4), 0, 3.141592653589793), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1.2 + 0.3 * sin(sine * 4), 0.5 + 0.15 * sin(sine * 4), 0.4 - 0.6 * sin(sine * 4)) * euler(3.0543261909900767 - 0.17453292519943295 * sin(sine * 4), -1.3962634015954636 - 0.17453292519943295 * sin(sine * 4), 1.5707963267948966), deltaTime) 
                    --RightArm,1.2,-0.3,0,4,175,-10,0,4,0.5,0.15,0,4,80,10,0,4,0.4,-0.6,0,4,-90,0,0,4,Head,0,0,0,4,-90,0,0,4,1,0,0,4,-0,0,0,4,0,0,0,4,180,0,0,4,LeftLeg,-1,0,0,4,90,0,0,4,-1,0,0,4,-80,0,0,4,0,0,0,4,90,0,0,4,RightLeg,1,0,0,4,90,0,0,4,-1,0,0,4,80,0,0,4,0,0,0,4,-90,0,0,4,Torso,0,0,0,4,190,10,0,4,-1.99,0.5,0,4,-0,0,0,4,0,0.15,0,4,180,0,0,4,LeftArm,-1.2,0.3,0,4,175,-10,0,4,0.5,0.15,0,4,-80,-10,0,4,0.4,-0.6,0,4,90,0,0,4
    
        elseif mode == "kazotsky" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-0.8 + 0.1 * sin(sine * 4), 0.5 - 0.15 * sin(sine * 4), -0.2) * euler(3.141592653589793 + 0.17453292519943295 * sin((sine + 0.6) * 8), -0.17453292519943295, 1.5707963267948966 - 0.08726646259971647 * sin(sine * 4)), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -0.5 + 0.3 * sin((sine + 0.25) * 8), 0) * euler(-1.3962634015954636 + 0.08726646259971647 * sin((sine + 0.5) * 8), 0.08726646259971647 * sin((sine + 0.1) * 4), 3.141592653589793), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(0.8 + 0.1 * sin(sine * 4), 0.5 + 0.15 * sin(sine * 4), -0.2) * euler(3.141592653589793 + 0.17453292519943295 * sin((sine + 0.6) * 8), 0.17453292519943295, -1.5707963267948966 - 0.08726646259971647 * sin(sine * 4)), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.6580627893946132 - 0.08726646259971647 * sin((sine + 0.5) * 8), -0.08726646259971647 * sin((sine + 0.2) * 4), 3.141592653589793), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -0.5 - 0.5 * sin((sine + 0.6) * 8), -0.5) * euler(1.7453292519943295 + 1.0471975511965976 * sin(sine * 4), 1.5707963267948966 + 0.2617993877991494 * sin(sine * 4), -1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -0.5 - 0.5 * sin((sine + 0.6) * 8), -0.5) * euler(1.7453292519943295 - 1.0471975511965976 * sin(sine * 4), -1.5707963267948966 + 0.017453292519943295 * sin(sine * 4), 1.5707963267948966), deltaTime) 
                    --LeftArm,-0.8,0.1,0,4,180,10,0.6,8,0.5,-0.15,0,4,-10,0,0,4,-0.2,0,0,4,90,-5,0,4,Torso,0,0,0,4,-80,5,0.5,8,-0.5,0.3,0.25,8,-0,5,0.1,4,0,0,0,4,180,0,0,4,RightArm,0.8,0.1,0,4,180,10,0.6,8,0.5,0.15,0,4,10,0,0,4,-0.2,0,0,4,-90,-5,0,4,Head,0,0,0,4,-95,-5,0.5,8,1,0,0,4,-0,-5,0.2,4,0,0,0,4,180,0,0,4,RightLeg,1,0,0,4,100,60,0,4,-0.5,-0.5,0.6,8,90,15,0,4,-0.5,0,0,4,-90,0,0,4,LeftLeg,-1,0,0,4,100,-60,0,4,-0.5,-0.5,0.6,8,-90,1,0,4,-0.5,0,0,4,90,0,0,4
    
        elseif mode == "L" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966 + 0.04363323129985824 * sin((sine + 0.1) * 1), -0.17453292519943295 * sin((sine + 0.1) * 5), -3.141592653589793), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1 + 0.2 * sin(sine * 5), -0.2 + 0.2 * sin(sine * 5)) * euler(2.181661564992912 - 0.8726646259971648 * sin(sine * 5), 1.9198621771937625 - 0.3490658503988659 * sin(sine * 5), -1.5707963267948966), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(0.7, 0.8, 0) * euler(1.0471975511965976 + 0.03490658503988659 * sin(sine * 10), 2.0943951023931953 + 0.10471975511965978 * sin((sine + 0.1) * 5), 1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1 - 0.2 * sin(sine * 5), -0.2 - 0.2 * sin(sine * 5)) * euler(2.181661564992912 + 0.8726646259971648 * sin(sine * 5), -1.9198621771937625 - 0.3490658503988659 * sin(sine * 5), 1.5707963267948966), deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0.15 + 0.4 * sin((sine - 0.5) * 10), 0) * euler(-1.4835298641951802, 0.17453292519943295 * sin(sine * 5), -3.141592653589793), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-0.7, 0.5, -0.3) * euler(1.7453292519943295, -0.8726646259971648, 1.5707963267948966), deltaTime) 
                    --Head,0,0,0,5,-90,2.5,0.1,1,1,0,0,4,0,-10,0.1,5,0,0,0,4,-180,0,0,4,RightLeg,1,0,0,4,125,-50,0,5,-1,0.2,0,5,110,-20,0,5,-0.2,0.2,0,5,-90,0,0,4,RightArm,0.7,0,0,4,60,2,0,10,0.8,0,0,4,120,6,0.1,5,0,0,0,4,90,0,0,4,LeftLeg,-1,0,0,4,125,50,0,5,-1,-0.2,0,5,-110,-20,0,5,-0.2,-0.2,0,5,90,0,0,4,Torso,0,0,0,4,-85,0,0,4,0.15,0.4,-0.5,10,0,10,0,5,0,0,0,4,-180,0,0,4,LeftArm,-0.7,0,0,4,100,0,0,4,0.5,0,0,4,-50,0,0,4,-0.3,0,0,4,90,0,0,4
        elseif mode == "fe creepy crawler" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cf(0, 0, 0.5) * euler(0.08726646259971647 * sin((sine + 20) * 0.05), 0, 3.141592653589793 + 0.3490658503988659 * sin((sine + -30) * 0.025)), 0.2) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -1.5 + 0.1 * sin(sine * 0.05), 0) * euler(3.141592653589793, 0, -3.1590459461097367 + 0.05235987755982989 * sin(sine * 0.025)), 0.2) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 1.5, -0.1 * sin(sine * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 1.5, -0.1 * sin(sine * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1.5, 0.5 + -0.1 * sin((sine + 10) * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1.5, 0.5 + -0.1 * sin((sine + 10) * 0.05)) * euler(1.5707963267948966, 0, 0.08726646259971647 * sin(sine * 0.025)), 0.2) 
    
                end
    
            else
                local speedMultiplierFloppa = 35
    
                local fw, rt = cfr.LookVector * vel / walkSpeed, cfr.RightVector * vel / walkSpeed
                fw, rt = fw.X + fw.Z, rt.X + rt.Z
    
        if onground and ((vel * v3_101).Magnitude > 0.2) then 
                    if mode == "Jerking Off" then 
                        walkSpeed = 16
                        local rY, lY = raycastlegs()
                        Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966 + 0.12217304763960307 * sin((sine - 0.1) * 16), -0.05235987755982989 * sin(sine * 8), 3.141592653589793 - 0.17453292519943295 * sin((sine - 0.05) * 8) - rt), deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1 + 0.2 * sin((sine + 0.1) * 8) + lY, lY * -0.5) * euler(-1.5707963267948966 + 0.6981317007977318 * sin(sine * 8) * fw, -1.5707963267948966 - 0.5235987755982988 * sin((sine - 0.05) * 8) * rt, -1.5707963267948966), deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.4,-1),angles(0.6981317007977318+0.2617993877991494*sin(sine*15),0,-0.8726646259971648)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.5, 0) * euler(0, -1.5707963267948966 + 0.3490658503988659 * sin((sine + 0.1) * 8), 0.005235987755982988 + 0.6981317007977318 * sin(sine * 8) * fw), deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0.25 * sin((sine + 0.05) * 16), 0) * euler(-1.5707963267948966 + 0.08726646259971647 * sin((sine + 0.05) * 16) + fw * -0.1, -0.03490658503988659 * sin(sine * 8) + rt * 0.1, 3.141592653589793 + 0.17453292519943295 * sin(sine * 8)), deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cf(1, -1 - 0.2 * sin((sine + 0.1) * 8) + rY, rY * -0.5) * euler(-1.5707963267948966 - 0.6981317007977318 * sin(sine * 8) * fw, 1.5707963267948966 + 0.5235987755982988 * sin((sine - 0.05) * 8) * rt, 1.5707963267948966), deltaTime) 
                        --Head,0,0,0,8,-90,7,-0.1,16,1,0,0,8,-0,-3,0,8,0,0,0,8,180,-10,-0.05,8,Fedora_Handle,8.657480066176504e-09,0,0,8,-6,0,0,8,-0.15052366256713867,0,0,8,0,0,0,8,-0.010221302509307861,0,0,8,0,0,0,8,LeftLeg,-1,0,0,8,-90,40,0,8,-1,0.2,0.1,8,-90,-30,-0.05,8,0,0,0,8,-90,0,0,8,RightArm,1,0,0,8,0,0,0,8,0.5,0,0,8,90,20,0.1,8,0,0,0,8,0.3,40,0,8,LeftArm,-1,0,0,8,-0,0,0,8,0.5,0,0,8,-90,20,0.1,8,0,0,0,8,0.3,40,0,8,Torso,0,0,0,8,-90,5,0.05,16,0,0.25,0.05,16,-0,-2,0,8,0,0,0,8,180,10,0,8,RightLeg,1,0,0,8,-90,-40,0,8,-1,-0.2,0.1,8,90,30,-0.05,8,0,0,0,8,90,0,0,8
                    elseif mode == "Back Fuck" then
                        walkSpeed = 16
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+3)*-5),0,0.3490658503988659)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(2.6179938779914944+0.2617993877991494*sin((sine+1)*-5),0,-0.3490658503988659)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                        --MW_animatorProgressSave: LeftArm,-1.5,-0.3,2,0,60,-15,3,-5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0,RightArm,1.5,0,2,0,150,15,1,-5,0.4,-0.3,2,0,0,0,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,AnonymousHood_Handle,-6.617444900424222e-24,0,0,1,0,0,0,1,0.4000000059604645,0,0,1,0,0,0,1,0.06400000303983688,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1
                        local TargetPlayer = GetPlayer(Targetnms)
                        if TargetPlayer then
                            local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                            plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, 1)
                        end                    
                    elseif mode == "Lap Dance" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                        local TargetPlayer = GetPlayer(Targetnms)
                        if TargetPlayer then
                            local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                            plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, -1)
                        end
    
                    elseif mode == "Hawk Tuah" then
                        walkSpeed = 16
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,-0.2+0.1*sin(sine*4)),angles(-1.4835298641951802+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),0.17453292519943295,0)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.3,0),angles(-2.007128639793479+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),-1.5707963267948966,0)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),-0.17453292519943295,0)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),1.5707963267948966,0)),deltaTime) 
                        --MW_animatorProgressSave: Head,0,0,0,1,-85,7,0,4,1,0,0,1,0,0,0,1,-0.2,0.1,0,4,180,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,RightLeg,0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,10,0,0,1,-0.2,0.2,0,4,0,0,0,1,Torso,0,0,0,1,-115,7,0,4,-1.3,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,140,17,0,-4,0.1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,-10,0,0,1,-0.2,0.2,0,4,0,0,0,1,RightArm,1,0,0,1,140,17,0,-4,0.1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1
                        local TargetPlayer = GetPlayer(Targetnms)
                        if TargetPlayer then
                            local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                            plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, -0.7, -1.7) * CFrame.Angles(0, math.rad(180), 0)
                        end
                    elseif mode == "Thrust On Face" then
                        walkSpeed = 16
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,-0.3490658503988659)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,0.3490658503988659)),deltaTime) 
                        --MW_animatorProgressSave: Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1.5,0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,-30,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1.5,-0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0
                        local TargetPlayer = GetPlayer(Targetnms)
                        if TargetPlayer then
                            local targetCFrame = TargetPlayer.Character.Head.CFrame
                            plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 1, -1) * CFrame.Angles(0, math.rad(180), 0)
                        end
                    elseif mode == "equinox" then
                        walkSpeed = 40
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*5),0.3 * sin((sine+2)*5)),angles(-2.356194490192345-0.08726646259971647*sin((sine+1)*5),0,3.141592653589793+0.08726646259971647*sin(sine*2.5))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7,0.3),angles(-0.5235987755982988-0.17453292519943295*sin((sine+4)*5),0.3490658503988659,0)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.5+0.3*sin((sine+1)*5),-0.3),angles(-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659,0)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*5),0,3.141592653589793-0.08726646259971647*sin(sine*2.5))),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                        --MW_animatorProgressSave: Torso,0,0,0,1,-135,-5,1,5,0,0.3,0,5,0,0,0,1,0,0.3,2,5,180,5,0,2.5,LeftArm,-1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,30,-20,1,5,0,-0.2,1,5,-30,10,2,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,-30,-10,4,5,-0.7,0,0,5,20,0,0,1,0.3,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,-30,10,0,5,-0.5,0.3,1,5,-20,0,0,1,-0.3,0,0,1,0,0,0,1,Head,0,0,0,1,-60,-5,0,5,1,0,0,1,0,0,0,1,0,0,0,1,180,-5,0,2.5,RightArm,1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,-30,20,1,5,0,-0.2,1,5,30,-10,2,5
                    elseif mode == "Corruption" then
                        walkSpeed = 16
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0.17453292519943295-0.3490658503988659*sin(sine*5),1.5707963267948966,0)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(-0.3490658503988659*sin(sine*5),0,0.17453292519943295)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(0.5235987755982988*sin(sine*5),0,-0.17453292519943295)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.07 * sin(sine*5),0),angles(-1.7453292519943295+0.03490658503988659*sin(sine*3),0.0017453292519943296*sin((sine+2)*3),3.141592653589793+0.03490658503988659*sin(sine*3))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0.17453292519943295+0.3490658503988659*sin(sine*5),-1.5707963267948966,0)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295+0.010471975511965976*sin(sine*5),0.03490658503988659*sin((sine+2)*4),3.141592653589793+0.06981317007977318*sin(sine*3))),deltaTime) 
                        --MW_animatorProgressSave: RightLeg,1,0,0,1,10,-20,0,5,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,RightArm,1.5,0,0,0,0,-20,0,5,0.4,-0.1,0,0,0,0,0,0,-0.5,0.1,0,0,10,0,0,0,LeftArm,-1.5,0,0,0,0,30,0,5,0.4,0.1,0,0,0,0,0,0,-0.5,-0.1,0,0,-10,0,0,0,Torso,0,0,0,10,-100,2,0,3,0,-0.07,0,5,0,0.1,2,3,0,0,0,1,180,2,0,3,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,10,20,0,5,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-100,0.6,0,5,1,0,0,1,0,2,2,4,0,0,0,1,180,4,0,3
                    elseif mode == "Tornado" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+5*sin(sine*4),0.5,5 * sin((sine+2)*4)),angles(1.5707963267948966+1.5707963267948966*sin(sine*4),1.5707963267948966*sin((sine+2)*4),-1.5707963267948966-1.5707963267948966*sin((sine+2)*4))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-3-0.5*sin(sine*1),0),angles(-1.5707963267948966-0.08726646259971647*sin(sine*4),0.06981317007977318*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5-6*sin((sine+2)*4),0,-6 * sin((sine+4)*4)),angles(1.5707963267948966+1.5707963267948966*sin((sine+2)*4),1.5707963267948966*sin((sine+4)*4),-1.5707963267948966-1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.3 * sin((sine+2)*4),0.5 * sin(sine*1),0.3 * sin(sine*4)),angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),-0.08726646259971647*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+6*sin((sine+2)*4),0,6 * sin((sine+4)*4)),angles(1.5707963267948966-1.5707963267948966*sin((sine+2)*4),-1.5707963267948966*sin((sine+4)*4),1.5707963267948966+1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5-5*sin(sine*4),0.5,-5 * sin((sine+2)*4)),angles(-1.5707963267948966+1.5707963267948966*sin(sine*4),-1.5707963267948966*sin((sine+2)*4),1.5707963267948966+1.5707963267948966*sin((sine+2)*1))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,-0.5,5,0,4,90,90,0,4,0.5,0,0,1,0,90,2,4,0,5,2,4,-90,-90,2,4,Head,0,0,2,4,-90,-5,0,4,-3,-0.5,0,1,0,4,2,4,0,0,0,4,180,0,0,1,RightLeg,0.5,-6,2,4,90,90,2,4,0,0,0,1,0,90,4,4,0,-6,4,4,-90,-90,4,4,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,0.5,-5,0,4,-90,90,0,4,0.5,0,0,1,0,-90,2,4,0,-5,2,4,90,90,2,1,Torso,0,-.3,2,4,-90,5,0,4,0,0.5,0,1,0,-5,2,4,0,.3,0,4,180,0,0,1,LeftLeg,-0.5,6,2,4,90,-90,2,4,0,0,0,1,0,-90,4,4,0,6,4,4,90,90,4,4,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                    elseif mode == "Bacon God" then
                        walkSpeed = 40
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*5),0.3 * sin((sine+2)*5)),angles(-2.356194490192345-0.08726646259971647*sin((sine+1)*5),0,3.141592653589793+0.08726646259971647*sin(sine*2.5))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7,0.3),angles(-0.5235987755982988-0.17453292519943295*sin((sine+4)*5),0.3490658503988659,0)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.5+0.3*sin((sine+1)*5),-0.3),angles(-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659,0)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*5),0,3.141592653589793-0.08726646259971647*sin(sine*2.5))),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                        --MW_animatorProgressSave: Torso,0,0,0,1,-135,-5,1,5,0,0.3,0,5,0,0,0,1,0,0.3,2,5,180,5,0,2.5,LeftArm,-1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,30,-20,1,5,0,-0.2,1,5,-30,10,2,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,-30,-10,4,5,-0.7,0,0,5,20,0,0,1,0.3,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,-30,10,0,5,-0.5,0.3,1,5,-20,0,0,1,-0.3,0,0,1,0,0,0,1,Head,0,0,0,1,-60,-5,0,5,1,0,0,1,0,0,0,1,0,0,0,1,180,-5,0,2.5,RightArm,1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,-30,20,1,5,0,-0.2,1,5,30,-10,2,5
                    elseif mode == "Unknown" then
                        walkSpeed = 30
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.1,-0.8+0.1*sin((sine+1)*2.5),-0.5),angles(-0.6981317007977318+0.17453292519943295*sin((sine+2)*2),1.3089969389957472,0.2617993877991494)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,-0.2),angles(-0.6981317007977318,0.08726646259971647*sin((sine+2)*2.5),3.490658503988659)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,3-0.4*sin(sine*2),0),angles(-2.6179938779914944+0.05235987755982989*sin((sine+0.5)*2.5),-0.17453292519943295+0.05235987755982989*sin((sine+0.5)*2.5),2.792526803190927)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.2,-0.9+0.1*sin((sine+1.3)*2.5),0),angles(-0.8726646259971648+0.17453292519943295*sin((sine+2)*-2),-1.3089969389957472,-0.22689280275926285)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1-0.1*sin((sine+2)*2.5),-0.2),angles(2.0943951023931953+0.17453292519943295*sin((sine+0.5)*2.5),-0.17453292519943295,-0.5235987755982988)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.6,0.3-0.1*sin((sine+2)*2.5),-0.2),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime) 
                        --MW_animatorProgressSave: RightLeg,1.1,0,0,0.5,-40,10,2,2,-0.8,0.1,1,2.5,75,0,0,0.5,-0.5,0,0,0.5,15,0,0,0.5,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,Head,0,0,0,0.5,-40,0,0,0.5,1,0,0,0.5,0,5,2,2.5,-0.2,0,0,0.5,200,0,0,0.5,Torso,0,0,0,0.5,-150,3,0.5,2.5,3,-0.4,0,2,-10,3,0.5,2.5,0,0,0,0.5,160,0,0,0.5,LeftLeg,-1.2,0,0,0,-50,10,2,-2,-0.9,0.1,1.3,2.5,-75,0,0,0,-0.,,0,0.5,-13,0,0,4,LeftArm,-1.5,0,0,0.5,120,10,0.5,2.5,1,-0.1,2,2.5,-10,0,0,0.5,-0.2,0,0,0.5,-30,0,4,1.25,RightArm,1.6,0,0,0.5,-50,0,0,0,0.3,-0.1,2,2.5,-20,0,0,0,-0.2,0,0,0.5,-20,-10,4,0
                    elseif mode == "Invisible" then
                        walkSpeed = 16
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1000,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                        --MW_animatorProgressSave: Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,1400,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1
                    elseif mode == "Dragged away" then
                        walkSpeed = 25
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),0.5,0.8),angles(-2.443460952792061+0.2617993877991494*sin((sine+1)*5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),0.3490658503988659*sin(sine*2.5))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295+0.08726646259971647*sin(sine*5),3.141592653589793+0.3490658503988659*sin(sine*5))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(0.6981317007977318+0.3490658503988659*sin((sine+1)*5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.7+0.1*sin((sine+1)*2.5),-0.5),angles(1.0471975511965976-0.17453292519943295*sin(sine*5),-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659+0.17453292519943295*sin(sine*5))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.2 * sin(sine*2.5),-1.7+0.1*sin(sine*5),0.2 * sin(sine*2.5)),angles(-2.0943951023931953+0.2617993877991494*sin((sine+1)*5),0.17453292519943295*sin(sine*2.5),0)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(0.8726646259971648+0.3490658503988659*sin((sine+1)*5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,-140,15,1,5,0.5,0,0,1,30,20,0,2.5,0.8,0,0,1,,20,0,2.5,Head,0,0,0,1,-120,0,0,5,1,0,0,1,-10,5,0,5,0,0,0,1,180,20,0,5,RightLeg,0.5,0,0,1,40,20,1,5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,-5,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,1,60,-10,0,5,0.7,0.1,1,2.5,-30,10,0,5,-0.5,0,0,1,-20,10,0,5,Torso,0,0.2,0,2.5,-120,15,1,5,-1.7,0.1,0,5,0,10,0,2.5,0,0.2,0,2.5,,0,0,1,LeftLeg,-0.5,0,0,1,50,20,1,5,-1,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                        
                    elseif mode == "Creature" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,1.5-0.5*sin((sine+0.5)*10),-1+0.5*sin((sine+0.25)*10)),angles(1.5707963267948966-0.7853981633974483*sin((sine+0.5)*10),0,0)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,-0.5),angles(0.17453292519943295*sin((sine+1)*20),0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1.5+0.5*sin((sine+0.5)*10),-0.5+0.5*sin((sine+0.25)*10)),angles(1.5707963267948966+0.5235987755982988*sin(sine*10),-0.08726646259971647,0)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,1.5+0.5*sin((sine+0.5)*10),-1-0.5*sin((sine+0.25)*10)),angles(1.5707963267948966+0.7853981633974483*sin((sine+0.5)*10),0,0)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.6+0.2*sin(sine*20),-0.1 * sin(sine*20)),angles(-3.141592653589793+0.08726646259971647*sin((sine+0.5)*20),0,3.141592653589793)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1.5-0.5*sin((sine+0.5)*10),-0.5-0.5*sin((sine+0.25)*10)),angles(1.5707963267948966-0.5235987755982988*sin(sine*10),0.08726646259971647,0)),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1,0,0,2,90,-45,0.5,10,1.5,-0.5,0.5,10,0,0,0,2,-1,0.5,0.25,10,0,0,0,2,Head,0,0,0,2,0,10,1,20,1.5,0,0,2,0,0,0,2,-0.5,0,0,2,180,0,0,2,RightLeg,0.5,0,0,2,90,30,0,10,-1.5,0.5,0.5,10,-5,0,0,2,-0.5,0.5,0.25,10,0,0,0,2,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,2,90,45,0.5,10,1.5,0.5,0.5,10,0,0,0,2,-1,-0.5,0.25,10,0,0,0,2,Torso,0,0,0,2,-180,5,0.5,20,-0.6,0.2,0,20,0,0,0,2,,-0.1,0,20,180,0,0,2,LeftLeg,-0.5,0,0,2,90,-30,0,10,-1.5,-0.5,0.5,10,5,0,0,2,-0.5,-0.5,0.25,10,0,0,0,2,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                    elseif mode == "ERRAH" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),1,-0.8),angles(1.7453292519943295+0.17453292519943295*sin(sine*5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),-0.17453292519943295*sin((sine+1)*2.5))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953+0.5235987755982988*sin(sine*105),-0.17453292519943295+0.5235987755982988*sin(sine*106),3.141592653589793+0.5235987755982988*sin(sine*107))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(0.6981317007977318-0.17453292519943295*sin((sine+1)*2.5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295+0.08726646259971647*sin(sine*5))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,1+0.1*sin((sine+1)*2.5),-0.8),angles(2.0943951023931953-0.17453292519943295*sin(sine*105),0.6981317007977318+0.17453292519943295*sin(sine*106),1.2217304763960306+0.17453292519943295*sin(sine*107))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*2.5),2+0.3*sin(sine*5),0.2 * sin(sine*2.5)),angles(2.0943951023931953-0.17453292519943295*sin((sine+1)*5),0.17453292519943295*sin(sine*2.5),3.141592653589793)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(0.5235987755982988-0.2617993877991494*sin((sine+1)*2.5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,100,10,0,5,1,0,0,1,30,20,0,2.5,-0.8,0,0,1,0,-10,1,2.5,Head,0,0,0,1,-120,30,0,105,1,0,0,1,-10,30,0,106,0,0,0,1,180,30,0,107,RightLeg,0.5,0,0,1,40,-10,1,2.5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,5,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.,0,0,1,120,-10,0,105,1,0.1,1,2.5,40,10,0,106,-0.8,0,0,1,70,10,0,107,Torso,0,0.3,0,2.5,120,-10,1,5,2,0.3,0,5,0,10,0,2.5,0,0.2,0,2.5,180,0,0,1,LeftLeg,-0.5,0,0,1,30,-15,1,2.5,-1,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                                            
                    elseif mode == "siezrure funnier" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1),3.141592653589793+174532.90774614044*sin(sine*1))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*25),1+3*sin(sine*20),1 * sin(sine*17)),angles(-1.5707963267948966-174532.90774614044*sin(sine*1),-174532.90774614044*sin(sine*1),3.141592653589793-174532.90774614044*sin(sine*1))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1,0,0,1,0,9999999,0,1,0.5,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Head,0,0,0,1,-90,9999999,0,1,1,0,0,1,0,9999999,0,1,0,0,0,1,180,9999999,0,1,RightLeg,1,0,0,1,0,9999999,0,1,-1,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,9999999,0,1,0.5,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Torso,0,1,,25,-90,-9999999,0,1,1,3,,20,0,-9999999,0,1,0,1,0,17,180,-9999999,0,1,LeftLeg,-1,0,0,1,0,9999999,0,1,-1,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                    elseif mode == "siezrure 2" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*52))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-2.5,0),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*53))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,52,-0.5,0,0,1,0,20,0,53,Head,0,0,0,1,-90,20,0,51,1,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,RightLeg,0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,52,0.5,0,0,1,0,20,0,53,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,53,-0.5,0,0,1,0,20,0,52,Torso,0,0,0,1,0,20,0,51,-2.5,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,LeftLeg,-0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,53,0.5,0,0,1,0,20,0,53,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                    elseif mode == "Sonic" then
                        walkSpeed = 60
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.8+0.2*sin((sine+1)*20),0.3+0.3*sin((sine+1)*40),0),angles(-0.8726646259971648+0.3490658503988659*sin((sine+1)*40),-0.3490658503988659-0.5235987755982988*sin((sine+1)*20),0.5235987755982988)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*40),-0.17453292519943295*sin(sine*20),3.141592653589793-0.17453292519943295*sin(sine*20))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.5*sin((sine+0.5)*20),0.3-0.5*sin((sine+1)*20)),angles(1.7453292519943295*sin((sine+1)*20),0,0)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.8+0.2*sin((sine+1)*20),0.3+0.3*sin((sine+1)*40),0),angles(-0.8726646259971648+0.3490658503988659*sin((sine+1)*40),0.3490658503988659-0.5235987755982988*sin((sine+1)*20),-0.5235987755982988)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*40),0.5 * sin((sine+1)*40)),angles(-2.181661564992912-0.17453292519943295*sin((sine+1)*40),0.08726646259971647*sin(sine*20),3.141592653589793+0.17453292519943295*sin(sine*20))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.5*sin((sine+0.5)*20),0.3+0.5*sin((sine+1)*20)),angles(-1.7453292519943295*sin((sine+1)*20),0,0)),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1.8,0.2,1,20,-50,20,1,40,0.3,0.3,1,40,-20,-30,1,20,0,0,0,1,30,0,0,20,Head,0,0,0,1,-60,-5,0,40,1,0,0,1,0,-10,0,20,0,0,0,1,180,-10,0,20,RightLeg,0.5,0,0,1,0,100,1,20,-1,0.5,0.5,20,0,0,0,1,0.3,-0.5,1,20,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.8,0.2,1,20,-50,20,1,40,0.3,0.3,1,40,20,-30,1,20,0,0,0,1,-30,0,0,20,Torso,0,0,0,1,-125,-10,1,40,0,0.3,0,40,0,5,0,20,0,0.5,1,40,180,10,0,20,LeftLeg,-0.5,0,0,1,0,-100,1,20,-1,-0.5,0.5,20,0,0,0,1,0.3,0.5,1,20,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                    elseif mode == "Pogo Stick" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,1.5707963267948966-0.5235987755982988*sin(sine*10))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966-0.3490658503988659*sin(sine*10),0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,-1.5707963267948966+0.5235987755982988*sin(sine*10))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1.2+2*sin((sine+1)*10),0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,0,0,1,-0.5,0,0,1,90,-30,0,10,Head,0,0,0,1,-90,-20,,10,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,,0,1,-0.5,0,0,1,-90,30,0,10,Torso,0,0,0,1,-90,0,0,1,1.2,2,1,10,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                    elseif mode == "fishy business" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(0,1.5707963267948966,0)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(10 * sin(sine*3),1+5*sin(sine*10),10 * sin(sine*5)),angles(-1.5707963267948966+1.7453292519943295*sin(sine*5),1.7453292519943295*sin(sine*3),3.141592653589793)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,,10,0,3,-90,100,0,5,1,5,0,10,0,100,0,3,,10,0,5,180,,0,4,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                    elseif mode == "Twerk" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
        
                    elseif mode == "Nazi Swastika" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0,0.5,0),angles(0,1.5707963267948966,3.141592653589793)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,-0.6981317007977318,3.141592653589793),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.5,0.5,0.5),angles(0,-3.141592653589793,1.5707963267948966)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(3.5 * sin((sine+1.5)*0.625),3 * sin((sine+4)*0.625),0),angles(0.5235987755982988+2.0943951023931953*sin((sine+30)*0.625),0.5235987755982988+2.0943951023931953*sin((sine+400)*0.625),0)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,0,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0,-0.5,0.5),angles(0,-31.41592653589793,1.5707963267948966)),deltaTime) 
                        --MW_animatorProgressSave: RightArm,0,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-40,0,0,1,0,0,0,1,180,0,0,1,SlickBackYakuzaBlack_Handle,-3.552713678800501e-15,0,0,1,180,0,0,1,0.3807339668273926,0,0,1,0,0,0,1,0.21092987060546875,0,0,1,180,0,0,1,LeftArm,-0.5,0,0,1,0,0,0,1,0.5,0,0,1,-180,0,0,1,0.5,0,0,1,90,0,0,1,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,LongHair_Handle,-0.00004900000203633681,0,0,1,0,0,0,1,1.10490083694458,0,0,1,0,0,0,1,-0.4286848306655884,0,0,1,0,0,0,1,Head,0,3.5,1.5,0.625,30,120,30,0.625,0,3,4,0.625,30,120,400,0.625,0,0,0.5,0.625,0,0,0,5,LeftLeg,-1,0,0,1,0,0,0,1,,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,,0,0,1,0,0,0,1,-0.5,0,0,1,-1800,0,0,1,0.5,0,0,1,90,0,0,1
                    elseif mode == "spaghetti" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+1*sin((sine+1)*5),1.5,1 * sin((sine+2)*5)),angles(1.5707963267948966,1.5707963267948966,1.5707963267948966)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(3 * sin((sine+2)*5),5,3 * sin((sine+3)*5)),angles(-1.5707963267948966+0.3490658503988659*sin((sine+3)*5),0.3490658503988659*sin((sine+2)*5),3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+1*sin((sine+1)*5),-1,1 * sin((sine+2)*5)),angles(0,1.5707963267948966,0)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5+2*sin((sine+2)*5),4.5,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*5),2,1 * sin((sine+1)*5)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+2*sin((sine+2)*5),-3,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                        --MW_animatorProgressSave: RightArm,-0.5,1,1,5,90,0,0,1,1.5,0,0,1,90,0,3,5,0,1,2,5,90,0,0,1,Head,0,3,2,5,-90,20,3,5,5,0,0,1,0,20,2,5,0,3,3,5,180,0,0,1,RightLeg,0.5,1,1,5,0,0,0,1,-1,0,0,1,90,0,0,1,0,1,2,5,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,0.5,2,2,5,0,0,0,1,4.5,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Torso,0,1,0,5,-90,0,0,1,2,0,0,1,0,0,0,1,0,1,1,5,180,0,0,1,LeftLeg,-0.5,2,2,5,0,0,0,1,-3,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
        
                    elseif mode == "Classic r6" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(0.8726646259971648*sin(sine*8),1.5707963267948966,0)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(-0.8726646259971648*sin(sine*8),1.5707963267948966,0)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0.8726646259971648*sin(sine*8),-1.5707963267948966,0)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(-0.8726646259971648*sin(sine*8),-1.5707963267948966,0)),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1,0,0,1,0,50,0,8,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,0,-50,0,8,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,0,50,0,8,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,0,-50,0,8,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1
                                        
                    elseif mode == "CHAOS" then
                        walkSpeed = 11
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.9198621771937625+0.08726646259971647*sin((sine+2)*5),0.17453292519943295*sin(sine*100),3.141592653589793+0.17453292519943295*sin(sine*99))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin(sine*2.5),0.2 * sin((sine+0.5)*2.5)),angles(0.17453292519943295-0.5235987755982988*sin((sine+0.5)*2.5),0,0)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4+0.1*sin(sine*2.5),0.3-0.3*sin(sine*2.5),-0.7+0.2*sin(sine*2.5)),angles(0.3490658503988659-0.5235987755982988*sin(sine*2.5),0.3490658503988659*sin(sine*101),0.17453292519943295*sin(sine*2.5))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.4+0.1*sin(sine*2.5),0.3+0.3*sin(sine*2.5),-0.7-0.2*sin(sine*2.5)),angles(0.3490658503988659+0.5235987755982988*sin(sine*2.5),0.3490658503988659*sin(sine*100),0.17453292519943295*sin(sine*2.5))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.2*sin(sine*2.5),-0.2 * sin((sine+0.5)*2.5)),angles(0.17453292519943295+0.5235987755982988*sin((sine+0.5)*2.5),0,0)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1 * sin(sine*5),0),angles(-1.9198621771937625,0,3.141592653589793)),deltaTime) 
                        --MW_animatorProgressSave: Head,0,0,0,1,-110,5,2,5,1,0,0,1,0,10,0,100,0,0,0,1,180,10,0,99,RightLeg,0.5,0,0,1,10,-30,0.5,2.5,-1,0.2,0,2.5,0,0,0,1,0,0.2,0.5,2.5,0,0,0,1,RightArm,1.4,0.1,0,2.5,20,-30,0,2.5,0.3,-0.3,0,2.5,0,20,0,101,-0.7,0.2,0,2.5,0,10,0,2.5,LeftArm,-1.4,0.1,0,2.5,20,30,0,2.5,0.3,0.3,0,2.5,0,20,0,100,-0.7,-0.2,0,2.5,0,10,0,2.5,LeftLeg,-0.5,0,0,1,10,30,0.5,2.5,-1,-0.2,0,2.5,0,0,0,1,0,-0.2,0.5,2.5,0,0,0,1,Torso,0,0,0,1,-110,0,0,1,0,-0.1,0,5,0,0,0,1,0,0,0,1,180,0,0,1
                                            
                    elseif mode == "Shavine Script" then
                        walkSpeed = 16
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5+0.2*sin((sine+0.1)*5),0.5-0.3*sin((sine+0.1)*5),-0.5+0.3*sin((sine+0.1)*5)),angles(0.17453292519943295-0.6981317007977318*sin((sine+0.1)*5),-0.3490658503988659*sin((sine+0.1)*5),0.17453292519943295+0.17453292519943295*sin((sine+0.1)*5))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.4835298641951802+0.08726646259971647*sin(sine*10),-0.08726646259971647*sin((sine+1)*5),3.141592653589793+0.08726646259971647*sin(sine*5))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.85+0.3*sin((sine+1)*5),0.1+0.2*sin(sine*5)),angles(-0.6981317007977318*sin(sine*5),0.08726646259971647,-0.08726646259971647*sin(sine*5))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.85-0.3*sin((sine+1)*5),0.1-0.2*sin(sine*5)),angles(0.6981317007977318*sin(sine*5),-0.08726646259971647,-0.08726646259971647*sin(sine*5))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5+0.2*sin((sine+0.1)*5),0.5+0.3*sin((sine+0.1)*5),-0.5-0.3*sin((sine+0.1)*5)),angles(0.17453292519943295+0.6981317007977318*sin((sine+0.1)*5),-0.3490658503988659*sin((sine+0.1)*5),-0.17453292519943295+0.17453292519943295*sin((sine+0.1)*5))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.1 * sin(sine*10),0),angles(-1.8325957145940461+0.10471975511965978*sin((sine+1)*10),-0.05235987755982989*sin(sine*5),3.141592653589793-0.08726646259971647*sin(sine*5))),deltaTime) 
                    elseif mode == "mayhem" then
                        walkSpeed = 12
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1+0.1*sin((sine+2)*5),0.2,-1+0.1*sin((sine+2)*5)),angles(0.3490658503988659-0.2617993877991494*sin((sine+2)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5),-0.17453292519943295+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.3962634015954636-0.08726646259971647*sin(sine*5),0.08726646259971647-0.08726646259971647*sin(sine*5),3.3161255787892263+0.2617993877991494*sin(sine*100))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.4,-1-0.3*sin(sine*5),0.7 * sin((sine+1)*5)),angles(-0.5934119456780721-0.15707963267948966*sin((sine+1)*5),-0.3490658503988659,0)),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1.3-0.3*sin((sine+1)*5),-0.5+0.1*sin((sine+1)*5)),angles(2.6179938779914944+0.17453292519943295*sin((sine+1)*5),0.8726646259971648,0.8726646259971648-0.2617993877991494*sin((sine+1)*5))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.1 * sin((sine+1)*5),-0.3+0.2*sin(sine*5),0.2 * sin((sine+1)*5)),angles(-1.9198621771937625+0.08726646259971647*sin((sine+1)*5),-0.08726646259971647+0.08726646259971647*sin((sine+1)*5),2.792526803190927)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5-0.1*sin((sine+1)*5),-0.7,-0.3-0.2*sin(sine*5)),angles(-0.17453292519943295+0.5934119456780721*sin(sine*5),0.3490658503988659,-0.17453292519943295)),deltaTime) 
                        --MW_animatorProgressSave: RightArm,1,0.1,2,5,20,-15,2,5,0.2,0,0,1,30,-10,2,5,-1,0.1,2,5,-10,10,2,5,Head,0,0,0,1,-80,-5,0,5,1,0,0,1,5,-5,0,5,0,0,0,1,190,15,0,100,RightLeg,0.4,0,0,1,-34,-9,1,5,-1,-0.3,0,5,-20,0,1,0,0,0.7,1,5,0,0,1,0,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftArm,-1.5,0,1,5,150,10,1,5,1.3,-0.3,1,5,50,0,1,5,-0.5,0.1,1,5,50,-15,1,5,Torso,0,0.1,1,5,-110,5,1,5,-0.3,0.2,0,5,-5,5,1,5,0,0.2,1,5,160,0,0,1,LeftLeg,-0.5,-0.1,1,5,-10,34,0,5,-0.7,0,1,5,20,0,1,,-0.3,-0.2,0,5,-10,0,1,0,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1
                    elseif mode == "Chase" then
                        walkSpeed = 30
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.3,1+0.3*sin((sine+1)*10),-0.5+0.4*sin(sine*10)),angles(2.0943951023931953+0.3490658503988659*sin((sine+1)*10),-0.5235987755982988-0.5235987755982988*sin((sine+1)*10),-0.08726646259971647*sin((sine+1)*10))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.8-0.5*sin((sine+3)*10),0.3 * sin((sine+1)*10)),angles(0.17453292519943295-1.2217304763960306*sin((sine+1)*10),0.08726646259971647-0.17453292519943295*sin(sine*10),-0.08726646259971647+0.17453292519943295*sin(sine*10))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.2217304763960306+0.17453292519943295*sin((sine+2)*20),0.3490658503988659*sin((sine+1)*10),3.141592653589793-0.17453292519943295*sin(sine*10))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.8+0.5*sin((sine+3)*10),-0.3 * sin((sine+1)*10)),angles(1.2217304763960306*sin((sine+1)*10),-0.08726646259971647-0.17453292519943295*sin(sine*10),0.08726646259971647+0.17453292519943295*sin(sine*10))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*20),0.2 * sin(sine*20)),angles(-2.0943951023931953-0.17453292519943295*sin((sine+1)*20),0.08726646259971647*sin(sine*10),3.141592653589793+0.17453292519943295*sin(sine*10))),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.3,1-0.3*sin((sine+1)*10),-0.5-0.4*sin(sine*10)),angles(2.0943951023931953-0.3490658503988659*sin((sine+1)*10),0.5235987755982988-0.5235987755982988*sin((sine+1)*10),-0.08726646259971647*sin((sine+1)*10))),deltaTime) 
                    elseif mode == "Scared" then
                        walkSpeed = 30
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,1-0.3*sin(sine*20),0.5),angles(3.490658503988659+0.3490658503988659*sin(sine*20),0.3490658503988659,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.3962634015954636-0.17453292519943295*sin((sine+1)*20),-0.17453292519943295*sin(sine*10),3.141592653589793-0.17453292519943295*sin(sine*10))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1-0.3*sin(sine*20),0.5),angles(3.490658503988659+0.3490658503988659*sin((sine+1)*20),-0.3490658503988659,-0.3490658503988659-0.3490658503988659*sin(sine*20))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.2 * sin((sine+1)*10),0.5 * sin(sine*20),-0.3 * sin((sine+1)*20)),angles(-1.2217304763960306-0.17453292519943295*sin((sine+1)*20),-0.17453292519943295*sin((sine+1)*10),3.141592653589793+0.17453292519943295*sin((sine+1)*10))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.9+0.6*sin(sine*10),0.3+1*sin((sine+2)*10)),angles(-0.3490658503988659-1.7453292519943295*sin(sine*10),0.17453292519943295*sin(sine*10),0.08726646259971647)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.9-0.6*sin(sine*10),0.3-1*sin((sine+2)*10)),angles(-0.3490658503988659+1.7453292519943295*sin(sine*10),0.08726646259971647+0.08726646259971647*sin(sine*10),-0.08726646259971647)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.5,0,0,1,200,20,0,20,1,-0.3,0,20,20,0,0,1,0.5,0,0,1,20,20,0,20,Head,0,0,0,1,-80,-10,1,20,1,0,0,1,0,-10,0,10,0,0,0,1,180,-10,0,10,LeftArm,-1.5,0,0,1,200,20,1,20,1,-0.3,0,20,-20,0,0,1,0.5,0,0,1,-20,-20,0,20,Torso,0,-0.2,1,10,-70,-10,1,20,0,0.5,0,20,0,-10,1,10,0,-0.3,1,20,180,10,1,10,RightLeg,0.5,0,0,1,-20,-100,0,10,-0.9,0.6,0,10,0,10,0,10,0.3,1,2,10,5,0,0,1,LeftLeg,-0.5,0,0,1,-20,100,0,10,-0.9,-0.6,0,10,5,5,0,10,0.3,-1,2,10,-5,0,0,1
                    elseif mode == "AMOGUS" then 
                        walkSpeed = 16
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1 * sin(sine*10),0.1 * sin((sine+0.5)*10)),angles(-1.6580627893946132-0.08726646259971647*sin((sine+0.5)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.17453292519943295*sin(sine*5))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.8+0.3*sin((sine+2)*5),0.3+0.5*sin((sine+1)*5)),angles(-0.3490658503988659-0.6981317007977318*sin((sine+1)*5),-0.08726646259971647-0.17453292519943295*sin(sine*5),0.05235987755982989+0.08726646259971647*sin(sine*5))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-0.4-0.1*sin((sine+0.5)*10),-0.5+0.05*sin((sine+1)*10)),angles(-1.5707963267948966-0.08726646259971647*sin((sine+1)*10),0.08726646259971647*sin((sine+1)*5),3.141592653589793-0.17453292519943295*sin(sine*5))),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.25,0.4+0.07*sin((sine+1)*5),0.5),angles(0.08726646259971647,0.17453292519943295,0.17453292519943295*sin((sine+1)*5))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.25,0.4-0.07*sin((sine+1)*5),0.5),angles(0.08726646259971647,-0.17453292519943295,0.17453292519943295*sin((sine+1)*5))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.8-0.3*sin((sine+2)*5),0.3-0.5*sin((sine+1)*5)),angles(-0.3490658503988659+0.6981317007977318*sin((sine+1)*5),0.08726646259971647-0.17453292519943295*sin(sine*5),-0.05235987755982989+0.08726646259971647*sin(sine*5))),deltaTime) 
                        --MW_animatorProgressSave: Torso,0,0,0,2,-95,-5,0.5,10,0,-0.1,0,10,0,5,0,5,0,0.1,0.5,10,180,10,0,5,RightLeg,0.5,0,0,2,-20,-40,1,5,-0.8,0.3,2,5,-5,-10,0,5,0.3,0.5,1,5,3,5,0,5,Head,0,0,0,2,-90,-5,1,10,-0.4,-0.1,0.5,10,0,5,1,5,-0.5,0.05,1,10,180,-10,0,5,RightArm,0.25,0,0,2,5,0,0,2,0.4,0.07,1,5,10,0,0,2,0.5,0,0,2,0,10,1,5,LeftArm,-0.25,0,0,2,5,0,0,2,0.4,-0.07,1,5,-10,0,0,2,0.5,0,0,2,0,10,1,5,LeftLeg,-0.5,0,0,2,-20,40,1,5,-0.8,-0.3,2,5,5,-10,0,5,0.3,-0.5,1,5,-3,5,0,5
                    elseif mode == "Chest Lay" then
                        walkSpeed = 16
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1.3,1.2),angles(-2.897246558310587+0.2617993877991494*sin(sine*-6),-2.0943951023931953+0.13962634015954636*sin(sine*5),-0.5235987755982988+0.06981317007977318*sin(sine*2))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,0.7+0.1*sin(sine*4)),angles(0.8726646259971648+0.10471975511965978*sin(sine*5),0.06981317007977318*sin(sine*4),3.141592653589793-0.12217304763960307*sin(sine*-5))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1.2,0.8),angles(-2.705260340591211+0.2617993877991494*sin(sine*-6),1.7453292519943295+0.13962634015954636*sin(sine*5),0.8726646259971648+0.15707963267948966*sin(sine*2))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1,0.9),angles(2.9670597283903604+1.0471975511965976*sin(sine*6),-0.08726646259971647*sin(sine*2.5),0.17453292519943295)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,1,0.9),angles(2.9670597283903604+0.6981317007977318*sin(sine*-6),-0.10471975511965978*sin(sine*-2.5),-0.17453292519943295)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.6+0.1*sin(sine*1.2),0),angles(2.4085543677521746+0.10471975511965978*sin(sine*5),0.05235987755982989*sin(sine*1),3.141592653589793)),deltaTime) 
                        --MW_animatorProgressSave: LeftLeg,-1,0,0,1,-166,15,0,-6,-1.3,0,0,1,-120,8,0,5,1.2,0,0,1,-30,4,0,2,Head,0,0,0,4,50,6,0,5,1.5,0,0,4,0,4,0,4,0.7,0.1,0,4,180,-7,0,-5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-155,15,0,-6,-1.2,0,0,1,100,8,0,5,0.8,0,0,1,50,9,0,2,LeftArm,-1.5,0,0,2.5,170,60,0,6,1,0,0,2.5,0,-5,0,2.5,0.9,0,0,2.5,10,0,0,2.5,RightArm,1.5,0,0,-2.5,170,40,0,-6,1,0,0,-2.5,0,-6,0,-2.5,0.9,0,0,-2.5,-10,0,0,-2.5,Torso,0,0,0,1,138,6,0,5,-1.6,0.1,0,1.2,0,3,0,1,0,0,0,1,180,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1
                    elseif mode == "Back Handstand" then
                        walkSpeed = 12
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.7,1.2,0.9+0.04*sin(sine*3)),angles(-1.7976891295541595+0.5235987755982988*sin(sine*4),1.5707963267948966,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.65+0.03*sin(sine*3),0),angles(-0.22689280275926285+0.017453292519943295*sin(sine*3),-15.707963267948966,3.141592653589793)),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-0.3490658503988659+0.10471975511965978*sin(sine*4),0,3.141592653589793)),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.8325957145940461-0.5235987755982988*sin(sine*4),1.5707963267948966,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.7,1.2,0.9+0.04*sin(sine*3)),angles(-1.7976891295541595-0.5235987755982988*sin(sine*4),-1.5707963267948966,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.8325957145940461+0.5235987755982988*sin(sine*4),-1.5707963267948966,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        --MW_animatorProgressSave: RightArm,0.7,0,0,1,-103,30,0,4,1.2,0,0,1,90,0,0,1,0.9,0.04,0,3,0,-3,0,0.4,Torso,0,0,0,0,-13,1,0,3,-0.65,0.03,0,03,-900,0,0,1,0,0,0,0,180,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,Head,0,0,0,11,-20,6,0,4,1,0,110,1,0,0,0,11,0,0,0,1,180,0,0,1,RightLeg,1.3,0,0,1,-105,-30,0,4,-1.2,0,0,1,90,0,0,1,0.6,0.04,0,3,0,-3,0,0.4,LeftArm,-0.7,0,0,1,-103,-30,0,4,1.2,0,0,1,-90,0,0,1,0.9,0.04,0,3,0,3,0,0.4,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,LeftLeg,-1.3,0,0,1,-105,30,0,4,-1.2,0,0,1,-90,0,0,1,0.6,0.04,0,3,0,3,0,0.4
                    elseif mode == "goofy trolus" then
                        walkSpeed = 34
                        Neck.C0 = Neck.C0:Lerp(cfMul(CFrame.new(0, 1, 0), angles(-1.5707963267948966 + 0.5235987755982988 * math.sin((sine + 0.45) * 8), 0, 3.141592653589793)), deltaTime)
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(CFrame.new(1, 0.5, 0), angles(2.0943951023931953 - 1.7453292519943295 * math.sin((sine - 0.1) * 4), 1.9198621771937625, -1.5707963267948966)), deltaTime)
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(CFrame.new(0, 0.25 + 0.5 * math.sin((sine - 0.125) * 8), 0), angles(-1.5707963267948966 + 0.17453292519943295 * math.sin(sine * 8), 0, 3.141592653589793)), deltaTime)
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(CFrame.new(-1, -1 - 1 * math.sin(sine * 4), 0), angles(1.5707963267948966 - 1.2217304763960306 * math.sin((sine - 0.15) * 4), -1.5707963267948966 - 0.6108652381980153 * math.sin((sine - 0.15) * 4), 1.5707963267948966)), deltaTime)
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(CFrame.new(1, -1 + 1 * math.sin(sine * 4), 0), angles(1.5707963267948966 + 1.2217304763960306 * math.sin((sine - 0.15) * 4), 1.5707963267948966 + 0.6108652381980153 * math.sin((sine - 0.15) * 4), -1.5707963267948966)), deltaTime)
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(CFrame.new(-1, 0.5, 0), angles(2.0943951023931953 + 1.7453292519943295 * math.sin((sine - 0.1) * 4), -1.7453292519943295, 1.5707963267948966)), deltaTime)
                    elseif mode == "fe creepy crawler" then
                            walkSpeed = 16
                        Neck.C0 = Neck.C0:Lerp(cf(0, 0, 0.5) * euler(0.17453292519943295, 0.03490658503988659 * sin((sine * speedMultiplierFloppa + 2.5) * 0.2), 3.141592653589793 + -0.17453292519943295 * sin((sine * speedMultiplierFloppa + -10) * 0.2)), 0.1) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -1.5, 0) * euler(3.0543261909900767, 0.08726646259971647 * sin((sine * speedMultiplierFloppa + 7.5) * 0.2), -3.1590459461097367 + -0.08726646259971647 * sin(sine * speedMultiplierFloppa * 0.2)), 0.1) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 1.5 + 0.5 * sin((sine * speedMultiplierFloppa + 10) * 0.2), 0.3 + 0.2 * sin((sine * speedMultiplierFloppa + -10) * 0.2)) * euler(1.6580627893946132 + 0.17453292519943295 * sin((sine * speedMultiplierFloppa + 15) * 0.2), 0, -0.08726646259971647 * sin(sine * speedMultiplierFloppa * 0.2)), 0.1) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 1.5 + 0.5 * sin((sine * speedMultiplierFloppa + -7.5) * 0.2), 0.3 + 0.2 * sin((sine * speedMultiplierFloppa + 5) * 0.2)) * euler(1.6580627893946132 + 0.17453292519943295 * sin(sine * speedMultiplierFloppa * 0.2), 0, -0.08726646259971647 * sin(sine * speedMultiplierFloppa * 0.2)), 0.1) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1.5 + 0.5 * sin((sine * speedMultiplierFloppa + -7.5) * 0.2), 0.5 + 0.2 * sin((sine * speedMultiplierFloppa + 5) * 0.2)) * euler(1.6580627893946132 + 0.17453292519943295 * sin(sine * speedMultiplierFloppa * 0.2), 0, 0.08726646259971647 * sin(sine * speedMultiplierFloppa * 0.2)), 0.1) 
                        RightHip.C0 = RightHip.C0:Lerp(cf(1, -1.5 + 0.5 * sin((sine * speedMultiplierFloppa + 10) * 0.2), 0.5 + 0.2 * sin((sine * speedMultiplierFloppa + -7.5) * 0.2)) * euler(1.6580627893946132 + -0.17453292519943295 * sin(sine * speedMultiplierFloppa * 0.2), 0, -0.08726646259971647 * sin(sine * speedMultiplierFloppa * 0.2)), 0.1) 
                    else                  
                        local rY, lY = raycastlegs()
                        Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.5707963267948966 + 0.12217304763960307 * sin((sine - 0.1) * 16), -0.05235987755982989 * sin(sine * 8), 3.141592653589793 - 0.17453292519943295 * sin((sine - 0.05) * 8) - rt), deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1 + 0.2 * sin((sine + 0.1) * 8) + lY, lY * -0.5) * euler(-1.5707963267948966 + 0.6981317007977318 * sin(sine * 8) * fw, -1.5707963267948966 - 0.5235987755982988 * sin((sine - 0.05) * 8) * rt, -1.5707963267948966), deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 0.5, 0) * euler(0, 1.5707963267948966 + 0.3490658503988659 * sin((sine + 0.1) * 8), 0.005235987755982988 + 0.6981317007977318 * sin(sine * 8) * fw), deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.5, 0) * euler(0, -1.5707963267948966 + 0.3490658503988659 * sin((sine + 0.1) * 8), 0.005235987755982988 + 0.6981317007977318 * sin(sine * 8) * fw), deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0.25 * sin((sine + 0.05) * 16), 0) * euler(-1.5707963267948966 + 0.08726646259971647 * sin((sine + 0.05) * 16) + fw * -0.1, -0.03490658503988659 * sin(sine * 8) + rt * 0.1, 3.141592653589793 + 0.17453292519943295 * sin(sine * 8)), deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cf(1, -1 - 0.2 * sin((sine + 0.1) * 8) + rY, rY * -0.5) * euler(-1.5707963267948966 - 0.6981317007977318 * sin(sine * 8) * fw, 1.5707963267948966 + 0.5235987755982988 * sin((sine - 0.05) * 8) * rt, 1.5707963267948966), deltaTime) 
                        --Head,0,0,0,8,-90,7,-0.1,16,1,0,0,8,-0,-3,0,8,0,0,0,8,180,-10,-0.05,8,Fedora_Handle,8.657480066176504e-09,0,0,8,-6,0,0,8,-0.15052366256713867,0,0,8,0,0,0,8,-0.010221302509307861,0,0,8,0,0,0,8,LeftLeg,-1,0,0,8,-90,40,0,8,-1,0.2,0.1,8,-90,-30,-0.05,8,0,0,0,8,-90,0,0,8,RightArm,1,0,0,8,0,0,0,8,0.5,0,0,8,90,20,0.1,8,0,0,0,8,0.3,40,0,8,LeftArm,-1,0,0,8,-0,0,0,8,0.5,0,0,8,-90,20,0.1,8,0,0,0,8,0.3,40,0,8,Torso,0,0,0,8,-90,5,0.05,16,0,0.25,0.05,16,-0,-2,0,8,0,0,0,8,180,10,0,8,RightLeg,1,0,0,8,-90,-40,0,8,-1,-0.2,0.1,8,90,30,-0.05,8,0,0,0,8,90,0,0,8
                    end
        elseif vel.Y > 0.5 then 
                            if mode == "Shavine Script" then 
                                walkSpeed = 16
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295+0.17453292519943295*sin((sine+3)*5),0,3.141592653589793)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,1.2-0.2*sin((sine+2)*5),-0.2 * sin((sine+3)*5)),angles(2.0943951023931953-0.3490658503988659*sin((sine+3)*5),0.5235987755982988,0.5235987755982988+0.08726646259971647*sin((sine+3)*5))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-0.5+0.1*sin((sine+2)*5),0),angles(-0.3490658503988659+0.17453292519943295*sin((sine+3)*5),0.3490658503988659,-0.17453292519943295)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.3962634015954636+0.08726646259971647*sin(sine*5),0,3.141592653589793),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.4,-0.9,0.3),angles(-0.3490658503988659+0.17453292519943295*sin((sine+2)*5),-0.3490658503988659,0.17453292519943295)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1.2-0.2*sin((sine+1)*5),-0.1 * sin((sine+2)*5)),angles(2.0943951023931953-0.3490658503988659*sin((sine+2)*5),-0.5235987755982988,-0.5235987755982988+0.08726646259971647*sin((sine+2)*5))),deltaTime) 
                            elseif mode == "Hawk Tuah" then
                                walkSpeed = 16
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,-0.2+0.1*sin(sine*4)),angles(-1.4835298641951802+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),0.17453292519943295,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.3,0),angles(-2.007128639793479+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),-1.5707963267948966,0)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),-0.17453292519943295,0)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),1.5707963267948966,0)),deltaTime) 
                                --MW_animatorProgressSave: Head,0,0,0,1,-85,7,0,4,1,0,0,1,0,0,0,1,-0.2,0.1,0,4,180,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,RightLeg,0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,10,0,0,1,-0.2,0.2,0,4,0,0,0,1,Torso,0,0,0,1,-115,7,0,4,-1.3,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,140,17,0,-4,0.1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,-10,0,0,1,-0.2,0.2,0,4,0,0,0,1,RightArm,1,0,0,1,140,17,0,-4,0.1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1
                                local TargetPlayer = GetPlayer(Targetnms)
                                if TargetPlayer then
                                    local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                                    plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, -0.7, -1.7) * CFrame.Angles(0, math.rad(180), 0)
                                end
                            elseif mode == "Thrust On Face" then
                                walkSpeed = 16
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,-0.3490658503988659)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,0.3490658503988659)),deltaTime) 
                                --MW_animatorProgressSave: Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1.5,0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,-30,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1.5,-0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0
                                local TargetPlayer = GetPlayer(Targetnms)
                                if TargetPlayer then
                                    local targetCFrame = TargetPlayer.Character.Head.CFrame
                                    plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 1, -1) * CFrame.Angles(0, math.rad(180), 0)
                                end
                            elseif mode == "Back Fuck" then
                                walkSpeed = 16
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+3)*-5),0,0.3490658503988659)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(2.6179938779914944+0.2617993877991494*sin((sine+1)*-5),0,-0.3490658503988659)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                                --MW_animatorProgressSave: LeftArm,-1.5,-0.3,2,0,60,-15,3,-5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0,RightArm,1.5,0,2,0,150,15,1,-5,0.4,-0.3,2,0,0,0,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,AnonymousHood_Handle,-6.617444900424222e-24,0,0,1,0,0,0,1,0.4000000059604645,0,0,1,0,0,0,1,0.06400000303983688,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1
                                local TargetPlayer = GetPlayer(Targetnms)
                                if TargetPlayer then
                                    local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                                    plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, 1)
                                end
                            elseif mode == "Lap Dance" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                                local TargetPlayer = GetPlayer(Targetnms)
                                if TargetPlayer then
                                    local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                                    plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, -1)
                                end
            
                            elseif mode == "Bacon God" then
                                walkSpeed = 40
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*5),0.3 * sin((sine+2)*5)),angles(-2.356194490192345-0.08726646259971647*sin((sine+1)*5),0,3.141592653589793+0.08726646259971647*sin(sine*2.5))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7,0.3),angles(-0.5235987755982988-0.17453292519943295*sin((sine+4)*5),0.3490658503988659,0)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.5+0.3*sin((sine+1)*5),-0.3),angles(-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659,0)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*5),0,3.141592653589793-0.08726646259971647*sin(sine*2.5))),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                                --MW_animatorProgressSave: Torso,0,0,0,1,-135,-5,1,5,0,0.3,0,5,0,0,0,1,0,0.3,2,5,180,5,0,2.5,LeftArm,-1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,30,-20,1,5,0,-0.2,1,5,-30,10,2,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,-30,-10,4,5,-0.7,0,0,5,20,0,0,1,0.3,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,-30,10,0,5,-0.5,0.3,1,5,-20,0,0,1,-0.3,0,0,1,0,0,0,1,Head,0,0,0,1,-60,-5,0,5,1,0,0,1,0,0,0,1,0,0,0,1,180,-5,0,2.5,RightArm,1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,-30,20,1,5,0,-0.2,1,5,30,-10,2,5
                            elseif mode == "Corruption" then
                                walkSpeed = 16
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0.17453292519943295-0.3490658503988659*sin(sine*5),1.5707963267948966,0)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(-0.3490658503988659*sin(sine*5),0,0.17453292519943295)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(0.5235987755982988*sin(sine*5),0,-0.17453292519943295)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.07 * sin(sine*5),0),angles(-1.7453292519943295+0.03490658503988659*sin(sine*3),0.0017453292519943296*sin((sine+2)*3),3.141592653589793+0.03490658503988659*sin(sine*3))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0.17453292519943295+0.3490658503988659*sin(sine*5),-1.5707963267948966,0)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295+0.010471975511965976*sin(sine*5),0.03490658503988659*sin((sine+2)*4),3.141592653589793+0.06981317007977318*sin(sine*3))),deltaTime) 
                                --MW_animatorProgressSave: RightLeg,1,0,0,1,10,-20,0,5,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,RightArm,1.5,0,0,0,0,-20,0,5,0.4,-0.1,0,0,0,0,0,0,-0.5,0.1,0,0,10,0,0,0,LeftArm,-1.5,0,0,0,0,30,0,5,0.4,0.1,0,0,0,0,0,0,-0.5,-0.1,0,0,-10,0,0,0,Torso,0,0,0,10,-100,2,0,3,0,-0.07,0,5,0,0.1,2,3,0,0,0,1,180,2,0,3,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,10,20,0,5,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-100,0.6,0,5,1,0,0,1,0,2,2,4,0,0,0,1,180,4,0,3                            elseif mode == "Dragged away" then
                                walkSpeed = 25
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),0.5,0.8),angles(-2.443460952792061+0.2617993877991494*sin((sine+1)*5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),0.3490658503988659*sin(sine*2.5))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295+0.08726646259971647*sin(sine*5),3.141592653589793+0.3490658503988659*sin(sine*5))),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(0.6981317007977318+0.3490658503988659*sin((sine+1)*5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.7+0.1*sin((sine+1)*2.5),-0.5),angles(1.0471975511965976-0.17453292519943295*sin(sine*5),-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659+0.17453292519943295*sin(sine*5))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.2 * sin(sine*2.5),-1.7+0.1*sin(sine*5),0.2 * sin(sine*2.5)),angles(-2.0943951023931953+0.2617993877991494*sin((sine+1)*5),0.17453292519943295*sin(sine*2.5),0)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(0.8726646259971648+0.3490658503988659*sin((sine+1)*5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,-140,15,1,5,0.5,0,0,1,30,20,0,2.5,0.8,0,0,1,,20,0,2.5,Head,0,0,0,1,-120,0,0,5,1,0,0,1,-10,5,0,5,0,0,0,1,180,20,0,5,RightLeg,0.5,0,0,1,40,20,1,5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,-5,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,1,60,-10,0,5,0.7,0.1,1,2.5,-30,10,0,5,-0.5,0,0,1,-20,10,0,5,Torso,0,0.2,0,2.5,-120,15,1,5,-1.7,0.1,0,5,0,10,0,2.5,0,0.2,0,2.5,,0,0,1,LeftLeg,-0.5,0,0,1,50,20,1,5,-1,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                            elseif mode == "Tornado" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+5*sin(sine*4),0.5,5 * sin((sine+2)*4)),angles(1.5707963267948966+1.5707963267948966*sin(sine*4),1.5707963267948966*sin((sine+2)*4),-1.5707963267948966-1.5707963267948966*sin((sine+2)*4))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-3-0.5*sin(sine*1),0),angles(-1.5707963267948966-0.08726646259971647*sin(sine*4),0.06981317007977318*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5-6*sin((sine+2)*4),0,-6 * sin((sine+4)*4)),angles(1.5707963267948966+1.5707963267948966*sin((sine+2)*4),1.5707963267948966*sin((sine+4)*4),-1.5707963267948966-1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.3 * sin((sine+2)*4),0.5 * sin(sine*1),0.3 * sin(sine*4)),angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),-0.08726646259971647*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+6*sin((sine+2)*4),0,6 * sin((sine+4)*4)),angles(1.5707963267948966-1.5707963267948966*sin((sine+2)*4),-1.5707963267948966*sin((sine+4)*4),1.5707963267948966+1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5-5*sin(sine*4),0.5,-5 * sin((sine+2)*4)),angles(-1.5707963267948966+1.5707963267948966*sin(sine*4),-1.5707963267948966*sin((sine+2)*4),1.5707963267948966+1.5707963267948966*sin((sine+2)*1))),deltaTime) 
                                --MW_animatorProgressSave: RightArm,-0.5,5,0,4,90,90,0,4,0.5,0,0,1,0,90,2,4,0,5,2,4,-90,-90,2,4,Head,0,0,2,4,-90,-5,0,4,-3,-0.5,0,1,0,4,2,4,0,0,0,4,180,0,0,1,RightLeg,0.5,-6,2,4,90,90,2,4,0,0,0,1,0,90,4,4,0,-6,4,4,-90,-90,4,4,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,0.5,-5,0,4,-90,90,0,4,0.5,0,0,1,0,-90,2,4,0,-5,2,4,90,90,2,1,Torso,0,-.3,2,4,-90,5,0,4,0,0.5,0,1,0,-5,2,4,0,.3,0,4,180,0,0,1,LeftLeg,-0.5,6,2,4,90,-90,2,4,0,0,0,1,0,-90,4,4,0,6,4,4,90,90,4,4,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                            elseif mode == "equinox" then
                                walkSpeed = 40
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*5),0.3 * sin((sine+2)*5)),angles(-2.356194490192345-0.08726646259971647*sin((sine+1)*5),0,3.141592653589793+0.08726646259971647*sin(sine*2.5))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7,0.3),angles(-0.5235987755982988-0.17453292519943295*sin((sine+4)*5),0.3490658503988659,0)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.5+0.3*sin((sine+1)*5),-0.3),angles(-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659,0)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*5),0,3.141592653589793-0.08726646259971647*sin(sine*2.5))),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                                --MW_animatorProgressSave: Torso,0,0,0,1,-135,-5,1,5,0,0.3,0,5,0,0,0,1,0,0.3,2,5,180,5,0,2.5,LeftArm,-1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,30,-20,1,5,0,-0.2,1,5,-30,10,2,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,-30,-10,4,5,-0.7,0,0,5,20,0,0,1,0.3,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,-30,10,0,5,-0.5,0.3,1,5,-20,0,0,1,-0.3,0,0,1,0,0,0,1,Head,0,0,0,1,-60,-5,0,5,1,0,0,1,0,0,0,1,0,0,0,1,180,-5,0,2.5,RightArm,1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,-30,20,1,5,0,-0.2,1,5,30,-10,2,5
                            elseif mode == "Invisible" then
                                walkSpeed = 16
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1000,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                                --MW_animatorProgressSave: Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,1400,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1

                            elseif mode == "Creature" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,1.5-0.5*sin((sine+0.5)*10),-1+0.5*sin((sine+0.25)*10)),angles(1.5707963267948966-0.7853981633974483*sin((sine+0.5)*10),0,0)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,-0.5),angles(0.17453292519943295*sin((sine+1)*20),0,3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1.5+0.5*sin((sine+0.5)*10),-0.5+0.5*sin((sine+0.25)*10)),angles(1.5707963267948966+0.5235987755982988*sin(sine*10),-0.08726646259971647,0)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,1.5+0.5*sin((sine+0.5)*10),-1-0.5*sin((sine+0.25)*10)),angles(1.5707963267948966+0.7853981633974483*sin((sine+0.5)*10),0,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.6+0.2*sin(sine*20),-0.1 * sin(sine*20)),angles(-3.141592653589793+0.08726646259971647*sin((sine+0.5)*20),0,3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1.5-0.5*sin((sine+0.5)*10),-0.5-0.5*sin((sine+0.25)*10)),angles(1.5707963267948966-0.5235987755982988*sin(sine*10),0.08726646259971647,0)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1,0,0,2,90,-45,0.5,10,1.5,-0.5,0.5,10,0,0,0,2,-1,0.5,0.25,10,0,0,0,2,Head,0,0,0,2,0,10,1,20,1.5,0,0,2,0,0,0,2,-0.5,0,0,2,180,0,0,2,RightLeg,0.5,0,0,2,90,30,0,10,-1.5,0.5,0.5,10,-5,0,0,2,-0.5,0.5,0.25,10,0,0,0,2,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,2,90,45,0.5,10,1.5,0.5,0.5,10,0,0,0,2,-1,-0.5,0.25,10,0,0,0,2,Torso,0,0,0,2,-180,5,0.5,20,-0.6,0.2,0,20,0,0,0,2,,-0.1,0,20,180,0,0,2,LeftLeg,-0.5,0,0,2,90,-30,0,10,-1.5,-0.5,0.5,10,5,0,0,2,-0.5,-0.5,0.25,10,0,0,0,2,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                            elseif mode == "ERRAH" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),1,-0.8),angles(1.7453292519943295+0.17453292519943295*sin(sine*5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),-0.17453292519943295*sin((sine+1)*2.5))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953+0.5235987755982988*sin(sine*105),-0.17453292519943295+0.5235987755982988*sin(sine*106),3.141592653589793+0.5235987755982988*sin(sine*107))),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(0.6981317007977318-0.17453292519943295*sin((sine+1)*2.5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295+0.08726646259971647*sin(sine*5))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,1+0.1*sin((sine+1)*2.5),-0.8),angles(2.0943951023931953-0.17453292519943295*sin(sine*105),0.6981317007977318+0.17453292519943295*sin(sine*106),1.2217304763960306+0.17453292519943295*sin(sine*107))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*2.5),2+0.3*sin(sine*5),0.2 * sin(sine*2.5)),angles(2.0943951023931953-0.17453292519943295*sin((sine+1)*5),0.17453292519943295*sin(sine*2.5),3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(0.5235987755982988-0.2617993877991494*sin((sine+1)*2.5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,100,10,0,5,1,0,0,1,30,20,0,2.5,-0.8,0,0,1,0,-10,1,2.5,Head,0,0,0,1,-120,30,0,105,1,0,0,1,-10,30,0,106,0,0,0,1,180,30,0,107,RightLeg,0.5,0,0,1,40,-10,1,2.5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,5,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.,0,0,1,120,-10,0,105,1,0.1,1,2.5,40,10,0,106,-0.8,0,0,1,70,10,0,107,Torso,0,0.3,0,2.5,120,-10,1,5,2,0.3,0,5,0,10,0,2.5,0,0.2,0,2.5,180,0,0,1,LeftLeg,-0.5,0,0,1,30,-15,1,2.5,-1,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                            elseif mode == "Unknown" then
                                walkSpeed = 30
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.1,-0.8+0.1*sin((sine+1)*2.5),-0.5),angles(-0.6981317007977318+0.17453292519943295*sin((sine+2)*2),1.3089969389957472,0.2617993877991494)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,-0.2),angles(-0.6981317007977318,0.08726646259971647*sin((sine+2)*2.5),3.490658503988659)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,3-0.4*sin(sine*2),0),angles(-2.6179938779914944+0.05235987755982989*sin((sine+0.5)*2.5),-0.17453292519943295+0.05235987755982989*sin((sine+0.5)*2.5),2.792526803190927)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.2,-0.9+0.1*sin((sine+1.3)*2.5),0),angles(-0.8726646259971648+0.17453292519943295*sin((sine+2)*-2),-1.3089969389957472,-0.22689280275926285)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1-0.1*sin((sine+2)*2.5),-0.2),angles(2.0943951023931953+0.17453292519943295*sin((sine+0.5)*2.5),-0.17453292519943295,-0.5235987755982988)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.6,0.3-0.1*sin((sine+2)*2.5),-0.2),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime) 
                                --MW_animatorProgressSave: RightLeg,1.1,0,0,0.5,-40,10,2,2,-0.8,0.1,1,2.5,75,0,0,0.5,-0.5,0,0,0.5,15,0,0,0.5,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,Head,0,0,0,0.5,-40,0,0,0.5,1,0,0,0.5,0,5,2,2.5,-0.2,0,0,0.5,200,0,0,0.5,Torso,0,0,0,0.5,-150,3,0.5,2.5,3,-0.4,0,2,-10,3,0.5,2.5,0,0,0,0.5,160,0,0,0.5,LeftLeg,-1.2,0,0,0,-50,10,2,-2,-0.9,0.1,1.3,2.5,-75,0,0,0,-0.,,0,0.5,-13,0,0,4,LeftArm,-1.5,0,0,0.5,120,10,0.5,2.5,1,-0.1,2,2.5,-10,0,0,0.5,-0.2,0,0,0.5,-30,0,4,1.25,RightArm,1.6,0,0,0.5,-50,0,0,0,0.3,-0.1,2,2.5,-20,0,0,0,-0.2,0,0,0.5,-20,-10,4,0
                                                                                  
                            elseif mode == "siezrure funnier" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1),3.141592653589793+174532.90774614044*sin(sine*1))),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*25),1+3*sin(sine*20),1 * sin(sine*17)),angles(-1.5707963267948966-174532.90774614044*sin(sine*1),-174532.90774614044*sin(sine*1),3.141592653589793-174532.90774614044*sin(sine*1))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1,0,0,1,0,9999999,0,1,0.5,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Head,0,0,0,1,-90,9999999,0,1,1,0,0,1,0,9999999,0,1,0,0,0,1,180,9999999,0,1,RightLeg,1,0,0,1,0,9999999,0,1,-1,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,9999999,0,1,0.5,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Torso,0,1,,25,-90,-9999999,0,1,1,3,,20,0,-9999999,0,1,0,1,0,17,180,-9999999,0,1,LeftLeg,-1,0,0,1,0,9999999,0,1,-1,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                            elseif mode == "siezrure 2" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*52))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-2.5,0),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*53))),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,52,-0.5,0,0,1,0,20,0,53,Head,0,0,0,1,-90,20,0,51,1,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,RightLeg,0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,52,0.5,0,0,1,0,20,0,53,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,53,-0.5,0,0,1,0,20,0,52,Torso,0,0,0,1,0,20,0,51,-2.5,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,LeftLeg,-0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,53,0.5,0,0,1,0,20,0,53,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                            elseif mode == "Sonic" then
                                walkSpeed = 60
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.8+0.2*sin((sine+1)*20),0.3+0.3*sin((sine+1)*40),0),angles(-0.8726646259971648+0.3490658503988659*sin((sine+1)*40),-0.3490658503988659-0.5235987755982988*sin((sine+1)*20),0.5235987755982988)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*40),-0.17453292519943295*sin(sine*20),3.141592653589793-0.17453292519943295*sin(sine*20))),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.5*sin((sine+0.5)*20),0.3-0.5*sin((sine+1)*20)),angles(1.7453292519943295*sin((sine+1)*20),0,0)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.8+0.2*sin((sine+1)*20),0.3+0.3*sin((sine+1)*40),0),angles(-0.8726646259971648+0.3490658503988659*sin((sine+1)*40),0.3490658503988659-0.5235987755982988*sin((sine+1)*20),-0.5235987755982988)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*40),0.5 * sin((sine+1)*40)),angles(-2.181661564992912-0.17453292519943295*sin((sine+1)*40),0.08726646259971647*sin(sine*20),3.141592653589793+0.17453292519943295*sin(sine*20))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.5*sin((sine+0.5)*20),0.3+0.5*sin((sine+1)*20)),angles(-1.7453292519943295*sin((sine+1)*20),0,0)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1.8,0.2,1,20,-50,20,1,40,0.3,0.3,1,40,-20,-30,1,20,0,0,0,1,30,0,0,20,Head,0,0,0,1,-60,-5,0,40,1,0,0,1,0,-10,0,20,0,0,0,1,180,-10,0,20,RightLeg,0.5,0,0,1,0,100,1,20,-1,0.5,0.5,20,0,0,0,1,0.3,-0.5,1,20,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.8,0.2,1,20,-50,20,1,40,0.3,0.3,1,40,20,-30,1,20,0,0,0,1,-30,0,0,20,Torso,0,0,0,1,-125,-10,1,40,0,0.3,0,40,0,5,0,20,0,0.5,1,40,180,10,0,20,LeftLeg,-0.5,0,0,1,0,-100,1,20,-1,-0.5,0.5,20,0,0,0,1,0.3,0.5,1,20,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                            elseif mode == "S T A R" then
                                walkSpeed = 16
                                RightHip.C0 = RightHip.C0:Lerp(cf(1, -1 - 0.05 * math.cos(sine / 25), 0) * angles(math.rad(0), math.rad(90), math.rad(0)) * angles(math.rad(-5), math.rad(0), math.rad(-20)), 0.1)
                                LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1 - 0.05 * math.cos(sine / 25), 0) * angles(math.rad(0), math.rad(-90), math.rad(0)) * angles(math.rad(-5), math.rad(0), math.rad(20)), 0.1)
                                RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0, 0 + 0.05 * math.cos(sine / 25)) * angles(math.rad(-10), math.rad(0), math.rad(0)), 0.1)
                                Neck.C0 = Neck.C0:Lerp(cfMul(Neck.C0, angles(math.rad(-2.5), math.rad(0), math.rad(0))), 0.1)
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1.45, 0.5 + 0.1 * math.cos(sine / 25), 0) * angles(math.rad(-5), math.rad(0), math.rad(25)), 0.1)
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1.45, 0.5 + 0.1 * math.cos(sine / 25), 0) * angles(math.rad(-5), math.rad(0), math.rad(-25)), 0.1)
                            elseif mode == "Pogo Stick" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,1.5707963267948966-0.5235987755982988*sin(sine*10))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966-0.3490658503988659*sin(sine*10),0,3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,-1.5707963267948966+0.5235987755982988*sin(sine*10))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1.2+2*sin((sine+1)*10),0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,0,0,1,-0.5,0,0,1,90,-30,0,10,Head,0,0,0,1,-90,-20,,10,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,,0,1,-0.5,0,0,1,-90,30,0,10,Torso,0,0,0,1,-90,0,0,1,1.2,2,1,10,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                            elseif mode == "fishy business" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(0,1.5707963267948966,0)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(10 * sin(sine*3),1+5*sin(sine*10),10 * sin(sine*5)),angles(-1.5707963267948966+1.7453292519943295*sin(sine*5),1.7453292519943295*sin(sine*3),3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,10,0,3,-90,100,0,5,1,5,0,10,0,100,0,3,,10,0,5,180,,0,4,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                            elseif mode == "Twerk" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                
                            elseif mode == "spaghetti" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+1*sin((sine+1)*5),1.5,1 * sin((sine+2)*5)),angles(1.5707963267948966,1.5707963267948966,1.5707963267948966)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(3 * sin((sine+2)*5),5,3 * sin((sine+3)*5)),angles(-1.5707963267948966+0.3490658503988659*sin((sine+3)*5),0.3490658503988659*sin((sine+2)*5),3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+1*sin((sine+1)*5),-1,1 * sin((sine+2)*5)),angles(0,1.5707963267948966,0)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5+2*sin((sine+2)*5),4.5,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*5),2,1 * sin((sine+1)*5)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+2*sin((sine+2)*5),-3,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,-0.5,1,1,5,90,0,0,1,1.5,0,0,1,90,0,3,5,0,1,2,5,90,0,0,1,Head,0,3,2,5,-90,20,3,5,5,0,0,1,0,20,2,5,0,3,3,5,180,0,0,1,RightLeg,0.5,1,1,5,0,0,0,1,-1,0,0,1,90,0,0,1,0,1,2,5,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,0.5,2,2,5,0,0,0,1,4.5,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Torso,0,1,0,5,-90,0,0,1,2,0,0,1,0,0,0,1,0,1,1,5,180,0,0,1,LeftLeg,-0.5,2,2,5,0,0,0,1,-3,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                
                            elseif mode == "Nazi Swastika" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0,0.5,0),angles(0,1.5707963267948966,3.141592653589793)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,-0.6981317007977318,3.141592653589793),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.5,0.5,0.5),angles(0,-3.141592653589793,1.5707963267948966)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(3.5 * sin((sine+1.5)*0.625),3 * sin((sine+4)*0.625),0),angles(0.5235987755982988+2.0943951023931953*sin((sine+30)*0.625),0.5235987755982988+2.0943951023931953*sin((sine+400)*0.625),0)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,0,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0,-0.5,0.5),angles(0,-31.41592653589793,1.5707963267948966)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,0,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-40,0,0,1,0,0,0,1,180,0,0,1,SlickBackYakuzaBlack_Handle,-3.552713678800501e-15,0,0,1,180,0,0,1,0.3807339668273926,0,0,1,0,0,0,1,0.21092987060546875,0,0,1,180,0,0,1,LeftArm,-0.5,0,0,1,0,0,0,1,0.5,0,0,1,-180,0,0,1,0.5,0,0,1,90,0,0,1,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,LongHair_Handle,-0.00004900000203633681,0,0,1,0,0,0,1,1.10490083694458,0,0,1,0,0,0,1,-0.4286848306655884,0,0,1,0,0,0,1,Head,0,3.5,1.5,0.625,30,120,30,0.625,0,3,4,0.625,30,120,400,0.625,0,0,0.5,0.625,0,0,0,5,LeftLeg,-1,0,0,1,0,0,0,1,,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,,0,0,1,0,0,0,1,-0.5,0,0,1,-1800,0,0,1,0.5,0,0,1,90,0,0,1
                            elseif mode == "spaghetti" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+1*sin((sine+1)*5),1.5,1 * sin((sine+2)*5)),angles(1.5707963267948966,1.5707963267948966,1.5707963267948966)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(3 * sin((sine+2)*5),5,3 * sin((sine+3)*5)),angles(-1.5707963267948966+0.3490658503988659*sin((sine+3)*5),0.3490658503988659*sin((sine+2)*5),3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+1*sin((sine+1)*5),-1,1 * sin((sine+2)*5)),angles(0,1.5707963267948966,0)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5+2*sin((sine+2)*5),4.5,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*5),2,1 * sin((sine+1)*5)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+2*sin((sine+2)*5),-3,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,-0.5,1,1,5,90,0,0,1,1.5,0,0,1,90,0,3,5,0,1,2,5,90,0,0,1,Head,0,3,2,5,-90,20,3,5,5,0,0,1,0,20,2,5,0,3,3,5,180,0,0,1,RightLeg,0.5,1,1,5,0,0,0,1,-1,0,0,1,90,0,0,1,0,1,2,5,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,0.5,2,2,5,0,0,0,1,4.5,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Torso,0,1,0,5,-90,0,0,1,2,0,0,1,0,0,0,1,0,1,1,5,180,0,0,1,LeftLeg,-0.5,2,2,5,0,0,0,1,-3,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                
                            elseif mode == "spaghetti" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+1*sin((sine+1)*5),1.5,1 * sin((sine+2)*5)),angles(1.5707963267948966,1.5707963267948966,1.5707963267948966)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(3 * sin((sine+2)*5),5,3 * sin((sine+3)*5)),angles(-1.5707963267948966+0.3490658503988659*sin((sine+3)*5),0.3490658503988659*sin((sine+2)*5),3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+1*sin((sine+1)*5),-1,1 * sin((sine+2)*5)),angles(0,1.5707963267948966,0)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5+2*sin((sine+2)*5),4.5,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*5),2,1 * sin((sine+1)*5)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+2*sin((sine+2)*5),-3,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,-0.5,1,1,5,90,0,0,1,1.5,0,0,1,90,0,3,5,0,1,2,5,90,0,0,1,Head,0,3,2,5,-90,20,3,5,5,0,0,1,0,20,2,5,0,3,3,5,180,0,0,1,RightLeg,0.5,1,1,5,0,0,0,1,-1,0,0,1,90,0,0,1,0,1,2,5,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,0.5,2,2,5,0,0,0,1,4.5,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Torso,0,1,0,5,-90,0,0,1,2,0,0,1,0,0,0,1,0,1,1,5,180,0,0,1,LeftLeg,-0.5,2,2,5,0,0,0,1,-3,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                
                            elseif mode == "Classic r6" then
                                walkSpeed = 16
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(2.6179938779914944+0.3490658503988659*sin((sine+1)*8),1.5707963267948966,0)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(2.6179938779914944+0.3490658503988659*sin(sine*8),-1.5707963267948966,0)),deltaTime) 
                                --MW_animatorProgressSave: RightArm,1,0,0,1,150,20,1,8,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,0,0,0,8,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,0,0,0,8,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,150,20,0,8,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1
                            elseif mode == "CHAOS" then
                                walkSpeed = 11
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.9198621771937625+0.08726646259971647*sin((sine+2)*5),0.17453292519943295*sin(sine*100),3.141592653589793+0.17453292519943295*sin(sine*99))),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin(sine*2.5),0.2 * sin((sine+0.5)*2.5)),angles(0.17453292519943295-0.5235987755982988*sin((sine+0.5)*2.5),0,0)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4+0.1*sin(sine*2.5),0.3-0.3*sin(sine*2.5),-0.7+0.2*sin(sine*2.5)),angles(0.3490658503988659-0.5235987755982988*sin(sine*2.5),0.3490658503988659*sin(sine*101),0.17453292519943295*sin(sine*2.5))),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.4+0.1*sin(sine*2.5),0.3+0.3*sin(sine*2.5),-0.7-0.2*sin(sine*2.5)),angles(0.3490658503988659+0.5235987755982988*sin(sine*2.5),0.3490658503988659*sin(sine*100),0.17453292519943295*sin(sine*2.5))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.2*sin(sine*2.5),-0.2 * sin((sine+0.5)*2.5)),angles(0.17453292519943295+0.5235987755982988*sin((sine+0.5)*2.5),0,0)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1 * sin(sine*5),0),angles(-1.9198621771937625,0,3.141592653589793)),deltaTime) 
                                --MW_animatorProgressSave: Head,0,0,0,1,-110,5,2,5,1,0,0,1,0,10,0,100,0,0,0,1,180,10,0,99,RightLeg,0.5,0,0,1,10,-30,0.5,2.5,-1,0.2,0,2.5,0,0,0,1,0,0.2,0.5,2.5,0,0,0,1,RightArm,1.4,0.1,0,2.5,20,-30,0,2.5,0.3,-0.3,0,2.5,0,20,0,101,-0.7,0.2,0,2.5,0,10,0,2.5,LeftArm,-1.4,0.1,0,2.5,20,30,0,2.5,0.3,0.3,0,2.5,0,20,0,100,-0.7,-0.2,0,2.5,0,10,0,2.5,LeftLeg,-0.5,0,0,1,10,30,0.5,2.5,-1,-0.2,0,2.5,0,0,0,1,0,-0.2,0.5,2.5,0,0,0,1,Torso,0,0,0,1,-110,0,0,1,0,-0.1,0,5,0,0,0,1,0,0,0,1,180,0,0,1
            
                            elseif mode == "Chase" then
                                walkSpeed = 30
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.8,0.5),angles(-0.5235987755982988,-0.08726646259971647,0.08726646259971647)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.3,1+0.3*sin((sine+1)*10),-0.5),angles(2.2689280275926285+0.2617993877991494*sin((sine+1)*20),-0.5235987755982988,-0.08726646259971647*sin((sine+1)*10))),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.3,1-0.3*sin((sine+1)*10),-0.5),angles(2.2689280275926285+0.2617993877991494*sin((sine+1)*20),0.5235987755982988,-0.08726646259971647*sin((sine+1)*10))),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.8,0.5),angles(-0.5235987755982988,0.08726646259971647,-0.08726646259971647)),deltaTime) 
                                RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.7453292519943295,0.17453292519943295*sin(sine*10),3.141592653589793+0.3490658503988659*sin(sine*10)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.2217304763960306+0.17453292519943295*sin((sine+2)*20),0.3490658503988659*sin((sine+1)*10),3.141592653589793-0.17453292519943295*sin(sine*10))),deltaTime) 
                            elseif mode == "AMOGUS" then 
                                walkSpeed = 16
                                RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.05-0.1*sin(sine*5),-0.1 * sin((sine+1)*5)),angles(-1.2217304763960306+0.08726646259971647*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                                RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.1*sin(sine*5),0.5),angles(-0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                                Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-0.4-0.1*sin((sine+1)*5),-0.5+0.05*sin((sine+2)*5)),angles(-1.9198621771937625-0.08726646259971647*sin((sine+2)*5),0,3.141592653589793)),deltaTime) 
                                RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.25,0.4-0.05*sin((sine+1)*5),0.5),angles(0.08726646259971647,0.17453292519943295,0)),deltaTime) 
                                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.25,0.4-0.05*sin((sine+1)*5),0.5),angles(0.08726646259971647,-0.17453292519943295,0)),deltaTime) 
                                LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*5),0.5),angles(-0.5235987755982988-0.3490658503988659*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                                --MW_animatorProgressSave: Torso,0,0,0,1,-70,5,1,5,-0.05,-0.1,0,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,-30,-20,1,5,-1,0.1,0,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,Head,0,0,0,1,-110,-5,2,5,-0.4,-0.1,1,5,0,0,0,1,-0.5,0.05,2,5,180,0,0,1,RightArm,0.25,0,0,1,5,0,0,1,0.4,-0.05,1,5,10,0,0,1,0.5,0,0,1,0,0,0,1,LeftArm,-0.25,0,0,1,5,0,0,1,0.4,-0.05,1,5,-10,0,0,1,0.5,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,-30,-20,1,5,-1,0.1,0,5,5,0,0,1,0.5,0,0,1,-3,0,0,1
                                                                                    
                    elseif mode == "Jerking Off" then
                        walkSpeed = 16
                        RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0, 0) * euler(-1.4835298641951802 + fw * 0.1, rt * -0.05, -3.141592653589793), deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.4,-1),angles(0.6981317007977318+0.2617993877991494*sin(sine*15),0,-0.8726646259971648)),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), -1.6580627893946132 + 0.06981317007977318 * sin((sine + 0.25) * 4), 1.5707963267948966), deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.3962634015954636, 0, -3.141592653589793 - rt), deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), 1.6580627893946132 - 0.06981317007977318 * sin((sine + 0.25) * 4), -1.5707963267948966), deltaTime) 
                    elseif mode == "Chest Lay" then
                        walkSpeed = 16
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1.3,1.2),angles(-2.897246558310587+0.2617993877991494*sin(sine*-6),-2.0943951023931953+0.13962634015954636*sin(sine*5),-0.5235987755982988+0.06981317007977318*sin(sine*2))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,0.7+0.1*sin(sine*4)),angles(0.8726646259971648+0.10471975511965978*sin(sine*5),0.06981317007977318*sin(sine*4),3.141592653589793-0.12217304763960307*sin(sine*-5))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1.2,0.8),angles(-2.705260340591211+0.2617993877991494*sin(sine*-6),1.7453292519943295+0.13962634015954636*sin(sine*5),0.8726646259971648+0.15707963267948966*sin(sine*2))),deltaTime) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1,0.9),angles(2.9670597283903604+1.0471975511965976*sin(sine*6),-0.08726646259971647*sin(sine*2.5),0.17453292519943295)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,1,0.9),angles(2.9670597283903604+0.6981317007977318*sin(sine*-6),-0.10471975511965978*sin(sine*-2.5),-0.17453292519943295)),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.6+0.1*sin(sine*1.2),0),angles(2.4085543677521746+0.10471975511965978*sin(sine*5),0.05235987755982989*sin(sine*1),3.141592653589793)),deltaTime) 
                        --MW_animatorProgressSave: LeftLeg,-1,0,0,1,-166,15,0,-6,-1.3,0,0,1,-120,8,0,5,1.2,0,0,1,-30,4,0,2,Head,0,0,0,4,50,6,0,5,1.5,0,0,4,0,4,0,4,0.7,0.1,0,4,180,-7,0,-5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-155,15,0,-6,-1.2,0,0,1,100,8,0,5,0.8,0,0,1,50,9,0,2,LeftArm,-1.5,0,0,2.5,170,60,0,6,1,0,0,2.5,0,-5,0,2.5,0.9,0,0,2.5,10,0,0,2.5,RightArm,1.5,0,0,-2.5,170,40,0,-6,1,0,0,-2.5,0,-6,0,-2.5,0.9,0,0,-2.5,-10,0,0,-2.5,Torso,0,0,0,1,138,6,0,5,-1.6,0.1,0,1.2,0,3,0,1,0,0,0,1,180,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1
    
                    elseif mode == "Back Handstand" then 
                        walkSpeed = 12
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.7,1.2,0.9+0.04*sin(sine*3)),angles(-2.0943951023931953,-0.6981317007977318,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.65+0.03*sin(sine*3),0),angles(-0.22689280275926285+0.017453292519943295*sin(sine*3),-15.707963267948966,3.141592653589793)),deltaTime) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.7,1.2,0.9+0.04*sin(sine*3)),angles(-2.0943951023931953,1.0471975511965976,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.5707963267948966,1.2217304763960306,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.5707963267948966,-1.2217304763960306,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                        Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-0.5235987755982988,0.17453292519943295*sin(sine*1),3.141592653589793+0.5235987755982988*sin(sine*1))),deltaTime) 
        
        
                            elseif mode == "fe creepy crawler" then
                                walkSpeed = 16
                        Neck.C0 = Neck.C0:Lerp(cf(0, 0, 0.5) * euler(0, 0, 3.141592653589793), 0.2) 
                        RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -1.4, 0) * euler(3.141592653589793, 0, -3.141592653589793), 0.2) 
                        LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 1.5, 0.3) * euler(1.7453292519943295, 0, -0.17453292519943295), 0.2) 
                        RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 1.5, 0.3) * euler(1.7453292519943295, 0, 0.17453292519943295), 0.2) 
                        LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1.5, 0.8) * euler(1.3962634015954636, 0, -0.17453292519943295), 0.2) 
                        RightHip.C0 = RightHip.C0:Lerp(cf(1, -1.5, 0.8) * euler(1.3962634015954636, 0, 0.17453292519943295), 0.2) 
                    
                    else
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0, 0) * euler(-1.4835298641951802 + fw * 0.1, rt * -0.05, -3.141592653589793), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 0.5, 0) * euler(4.014257279586958 - 0.08726646259971647 * sin((sine + 0.5) * 4), 1.7453292519943295 + 0.08726646259971647 * sin((sine + 0.25) * 4), -1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), -1.6580627893946132 + 0.06981317007977318 * sin((sine + 0.25) * 4), 1.5707963267948966), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.5, 0) * euler(4.014257279586958 - 0.08726646259971647 * sin((sine + 0.5) * 4), -1.7453292519943295 - 0.08726646259971647 * sin((sine + 0.25) * 4), 1.5707963267948966), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.3962634015954636, 0, -3.141592653589793 - rt), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), 1.6580627893946132 - 0.06981317007977318 * sin((sine + 0.25) * 4), -1.5707963267948966), deltaTime) 
                    --Torso,0,0,0,4,-85,0,0,4,0,0,0,4,0,0,0,4,0,0,0,4,-180,0,0,4,RightArm,1,0,0,4,230,-5,0.5,4,0.5,0,0,4,100,5,0.25,4,0,0,0,4,-90,0,0,4,LeftLeg,-1,0,0,4,90,-5,0.5,4,-1,0,0,4,-95,4,0.25,4,0,0,0,4,90,0,0,4,LeftArm,-1,0,0,4,230,-5,0.5,4,0.5,0,0,4,-100,-5,0.25,4,0,0,0,4,90,0,0,4,Head,0,0,0,4,-80,0,0.5,4,1,0,0,4,0,0,0.25,4,0,0,0,4,-180,0,0,4,RightLeg,1,0,0,4,90,-5,0.5,4,-1,0,0,4,95,-4,0.25,4,0,0,0,4,-90,0,0,4
                    end
        else 
                if mode == "Shavine Script" then 
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.8+0.2*sin((sine+2)*5),-0.5),angles(0.17453292519943295+0.3490658503988659*sin((sine+2)*5),0,1.3962634015954636+0.08726646259971647*sin((sine+3)*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-0.3+0.1*sin((sine+2)*5),-0.5),angles(-0.6981317007977318+0.17453292519943295*sin((sine+3)*5),0.3490658503988659,-0.17453292519943295)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.7453292519943295+0.08726646259971647*sin(sine*5),0,3.141592653589793),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.4835298641951802+0.17453292519943295*sin((sine+3)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.4,-0.9,0.3),angles(0.17453292519943295+0.17453292519943295*sin((sine+2)*5),-0.3490658503988659,0.17453292519943295)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.8+0.2*sin((sine+1)*5),-0.5),angles(0.17453292519943295+0.3490658503988659*sin((sine+1)*5),0,-1.3962634015954636+0.08726646259971647*sin((sine+2)*5))),deltaTime) 
                elseif mode == "Hawk Tuah" then
                    walkSpeed = 16
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,-0.2+0.1*sin(sine*4)),angles(-1.4835298641951802+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),0.17453292519943295,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.3,0),angles(-2.007128639793479+0.12217304763960307*sin(sine*4),0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),-1.5707963267948966,0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.7,-0.8,-0.2+0.2*sin(sine*4)),angles(-1.1344640137963142+0.12217304763960307*sin(sine*-4),-0.17453292519943295,0)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.1,0),angles(2.443460952792061+0.29670597283903605*sin(sine*-4),1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,-85,7,0,4,1,0,0,1,0,0,0,1,-0.2,0.1,0,4,180,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,RightLeg,0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,10,0,0,1,-0.2,0.2,0,4,0,0,0,1,Torso,0,0,0,1,-115,7,0,4,-1.3,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,140,17,0,-4,0.1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,LeftLeg,-0.7,0,0,1,-65,7,0,-4,-0.8,0,0,1,-10,0,0,1,-0.2,0.2,0,4,0,0,0,1,RightArm,1,0,0,1,140,17,0,-4,0.1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, -0.7, -1.7) * CFrame.Angles(0, math.rad(180), 0)
                    end
                elseif mode == "Thrust On Face" then
                    walkSpeed = 16
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,-0.3490658503988659)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+2)*5),0,0.3490658503988659)),deltaTime) 
                    --MW_animatorProgressSave: Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1.5,0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,-30,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1.5,-0.3,2,0,60,-15,2,5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.Head.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 1, -1) * CFrame.Angles(0, math.rad(180), 0)
                    end
                elseif mode == "Back Fuck" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(1.0471975511965976-0.2617993877991494*sin((sine+3)*-5),0,0.3490658503988659)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(2.6179938779914944+0.2617993877991494*sin((sine+1)*-5),0,-0.3490658503988659)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295-0.3490658503988659*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.2*sin((sine+1)*5),0.5),angles(-0.5235987755982988*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1,-0.1 * sin((sine+1)*5)),angles(-1.5707963267948966+0.2617993877991494*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    --MW_animatorProgressSave: LeftArm,-1.5,-0.3,2,0,60,-15,3,-5,0.4,-0.3,2,0,0,30,2,0,-0.5,0.4,1,0,20,0,0,0,RightArm,1.5,0,2,0,150,15,1,-5,0.4,-0.3,2,0,0,0,2,0,-0.5,0.4,1,0,-20,-5,0,0,Head,0,0,0,1,-100,-20,1,5,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,AnonymousHood_Handle,-6.617444900424222e-24,0,0,1,0,0,0,1,0.4000000059604645,0,0,1,0,0,0,1,0.06400000303983688,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,LeftLeg,-0.5,0,0,1,0,-30,1,5,-1,0.2,1,5,5,0,0,1,0.5,0,0,1,-3,0,0,1,Torso,0,0,0,1,-90,15,1,5,-0.1,0,1,5,0,0,0,1,0,-0.1,1,5,180,0,0,1
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, 1)
                    end
                elseif mode == "Lap Dance" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                    local TargetPlayer = GetPlayer(Targetnms)
                    if TargetPlayer then
                        local targetCFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
                        plr.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, -1)
                    end

                elseif mode == "Creature" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,1.5-0.5*sin((sine+0.5)*10),-1+0.5*sin((sine+0.25)*10)),angles(1.5707963267948966-0.7853981633974483*sin((sine+0.5)*10),0,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,-0.5),angles(0.17453292519943295*sin((sine+1)*20),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1.5+0.5*sin((sine+0.5)*10),-0.5+0.5*sin((sine+0.25)*10)),angles(1.5707963267948966+0.5235987755982988*sin(sine*10),-0.08726646259971647,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,1.5+0.5*sin((sine+0.5)*10),-1-0.5*sin((sine+0.25)*10)),angles(1.5707963267948966+0.7853981633974483*sin((sine+0.5)*10),0,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.6+0.2*sin(sine*20),-0.1 * sin(sine*20)),angles(-3.141592653589793+0.08726646259971647*sin((sine+0.5)*20),0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1.5-0.5*sin((sine+0.5)*10),-0.5-0.5*sin((sine+0.25)*10)),angles(1.5707963267948966-0.5235987755982988*sin(sine*10),0.08726646259971647,0)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,2,90,-45,0.5,10,1.5,-0.5,0.5,10,0,0,0,2,-1,0.5,0.25,10,0,0,0,2,Head,0,0,0,2,0,10,1,20,1.5,0,0,2,0,0,0,2,-0.5,0,0,2,180,0,0,2,RightLeg,0.5,0,0,2,90,30,0,10,-1.5,0.5,0.5,10,-5,0,0,2,-0.5,0.5,0.25,10,0,0,0,2,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,2,90,45,0.5,10,1.5,0.5,0.5,10,0,0,0,2,-1,-0.5,0.25,10,0,0,0,2,Torso,0,0,0,2,-180,5,0.5,20,-0.6,0.2,0,20,0,0,0,2,,-0.1,0,20,180,0,0,2,LeftLeg,-0.5,0,0,2,90,-30,0,10,-1.5,-0.5,0.5,10,5,0,0,2,-0.5,-0.5,0.25,10,0,0,0,2,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "Corruption" then
                    walkSpeed = 16
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0.17453292519943295-0.3490658503988659*sin(sine*5),1.5707963267948966,0)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.4,-0.5),angles(-0.3490658503988659*sin(sine*5),0,0.17453292519943295)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.4,-0.5),angles(0.5235987755982988*sin(sine*5),0,-0.17453292519943295)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.07 * sin(sine*5),0),angles(-1.7453292519943295+0.03490658503988659*sin(sine*3),0.0017453292519943296*sin((sine+2)*3),3.141592653589793+0.03490658503988659*sin(sine*3))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0.17453292519943295+0.3490658503988659*sin(sine*5),-1.5707963267948966,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.7453292519943295+0.010471975511965976*sin(sine*5),0.03490658503988659*sin((sine+2)*4),3.141592653589793+0.06981317007977318*sin(sine*3))),deltaTime) 
                    --MW_animatorProgressSave: RightLeg,1,0,0,1,10,-20,0,5,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,RightArm,1.5,0,0,0,0,-20,0,5,0.4,-0.1,0,0,0,0,0,0,-0.5,0.1,0,0,10,0,0,0,LeftArm,-1.5,0,0,0,0,30,0,5,0.4,0.1,0,0,0,0,0,0,-0.5,-0.1,0,0,-10,0,0,0,Torso,0,0,0,10,-100,2,0,3,0,-0.07,0,5,0,0.1,2,3,0,0,0,1,180,2,0,3,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,10,20,0,5,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-100,0.6,0,5,1,0,0,1,0,2,2,4,0,0,0,1,180,4,0,3
                elseif mode == "Tornado" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+5*sin(sine*4),0.5,5 * sin((sine+2)*4)),angles(1.5707963267948966+1.5707963267948966*sin(sine*4),1.5707963267948966*sin((sine+2)*4),-1.5707963267948966-1.5707963267948966*sin((sine+2)*4))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-3-0.5*sin(sine*1),0),angles(-1.5707963267948966-0.08726646259971647*sin(sine*4),0.06981317007977318*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5-6*sin((sine+2)*4),0,-6 * sin((sine+4)*4)),angles(1.5707963267948966+1.5707963267948966*sin((sine+2)*4),1.5707963267948966*sin((sine+4)*4),-1.5707963267948966-1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(-0.3 * sin((sine+2)*4),0.5 * sin(sine*1),0.3 * sin(sine*4)),angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),-0.08726646259971647*sin((sine+2)*4),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+6*sin((sine+2)*4),0,6 * sin((sine+4)*4)),angles(1.5707963267948966-1.5707963267948966*sin((sine+2)*4),-1.5707963267948966*sin((sine+4)*4),1.5707963267948966+1.5707963267948966*sin((sine+4)*4))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5-5*sin(sine*4),0.5,-5 * sin((sine+2)*4)),angles(-1.5707963267948966+1.5707963267948966*sin(sine*4),-1.5707963267948966*sin((sine+2)*4),1.5707963267948966+1.5707963267948966*sin((sine+2)*1))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,-0.5,5,0,4,90,90,0,4,0.5,0,0,1,0,90,2,4,0,5,2,4,-90,-90,2,4,Head,0,0,2,4,-90,-5,0,4,-3,-0.5,0,1,0,4,2,4,0,0,0,4,180,0,0,1,RightLeg,0.5,-6,2,4,90,90,2,4,0,0,0,1,0,90,4,4,0,-6,4,4,-90,-90,4,4,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,0.5,-5,0,4,-90,90,0,4,0.5,0,0,1,0,-90,2,4,0,-5,2,4,90,90,2,1,Torso,0,-.3,2,4,-90,5,0,4,0,0.5,0,1,0,-5,2,4,0,.3,0,4,180,0,0,1,LeftLeg,-0.5,6,2,4,90,-90,2,4,0,0,0,1,0,-90,4,4,0,6,4,4,90,90,4,4,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "equinox" then
                    walkSpeed = 40
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*5),0.3 * sin((sine+2)*5)),angles(-2.356194490192345-0.08726646259971647*sin((sine+1)*5),0,3.141592653589793+0.08726646259971647*sin(sine*2.5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7,0.3),angles(-0.5235987755982988-0.17453292519943295*sin((sine+4)*5),0.3490658503988659,0)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.5+0.3*sin((sine+1)*5),-0.3),angles(-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*5),0,3.141592653589793-0.08726646259971647*sin(sine*2.5))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                    --MW_animatorProgressSave: Torso,0,0,0,1,-135,-5,1,5,0,0.3,0,5,0,0,0,1,0,0.3,2,5,180,5,0,2.5,LeftArm,-1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,30,-20,1,5,0,-0.2,1,5,-30,10,2,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,-30,-10,4,5,-0.7,0,0,5,20,0,0,1,0.3,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,-30,10,0,5,-0.5,0.3,1,5,-20,0,0,1,-0.3,0,0,1,0,0,0,1,Head,0,0,0,1,-60,-5,0,5,1,0,0,1,0,0,0,1,0,0,0,1,180,-5,0,2.5,RightArm,1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,-30,20,1,5,0,-0.2,1,5,30,-10,2,5
                elseif mode == "Bacon God" then
                    walkSpeed = 40
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*5),0.3 * sin((sine+2)*5)),angles(-2.356194490192345-0.08726646259971647*sin((sine+1)*5),0,3.141592653589793+0.08726646259971647*sin(sine*2.5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.7,0.3),angles(-0.5235987755982988-0.17453292519943295*sin((sine+4)*5),0.3490658503988659,0)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.5+0.3*sin((sine+1)*5),-0.3),angles(-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*5),0,3.141592653589793-0.08726646259971647*sin(sine*2.5))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.7,0.4-0.3*sin((sine+2)*5),-0.2 * sin((sine+1)*5)),angles(-0.17453292519943295-0.3490658503988659*sin((sine+1)*5),-0.5235987755982988+0.3490658503988659*sin((sine+1)*5),0.5235987755982988-0.17453292519943295*sin((sine+2)*5))),deltaTime) 
                    --MW_animatorProgressSave: Torso,0,0,0,1,-135,-5,1,5,0,0.3,0,5,0,0,0,1,0,0.3,2,5,180,5,0,2.5,LeftArm,-1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,30,-20,1,5,0,-0.2,1,5,-30,10,2,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,-30,-10,4,5,-0.7,0,0,5,20,0,0,1,0.3,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,0.5,0,0,1,-30,10,0,5,-0.5,0.3,1,5,-20,0,0,1,-0.3,0,0,1,0,0,0,1,Head,0,0,0,1,-60,-5,0,5,1,0,0,1,0,0,0,1,0,0,0,1,180,-5,0,2.5,RightArm,1.7,0,0,1,-10,-20,1,5,0.4,-0.3,2,5,-30,20,1,5,0,-0.2,1,5,30,-10,2,5
                elseif mode == "Unknown" then
                    walkSpeed = 30
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.1,-0.8+0.1*sin((sine+1)*2.5),-0.5),angles(-0.6981317007977318+0.17453292519943295*sin((sine+2)*2),1.3089969389957472,0.2617993877991494)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,-0.2),angles(-0.6981317007977318,0.08726646259971647*sin((sine+2)*2.5),3.490658503988659)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,3-0.4*sin(sine*2),0),angles(-2.6179938779914944+0.05235987755982989*sin((sine+0.5)*2.5),-0.17453292519943295+0.05235987755982989*sin((sine+0.5)*2.5),2.792526803190927)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.2,-0.9+0.1*sin((sine+1.3)*2.5),0),angles(-0.8726646259971648+0.17453292519943295*sin((sine+2)*-2),-1.3089969389957472,-0.22689280275926285)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1-0.1*sin((sine+2)*2.5),-0.2),angles(2.0943951023931953+0.17453292519943295*sin((sine+0.5)*2.5),-0.17453292519943295,-0.5235987755982988)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.6,0.3-0.1*sin((sine+2)*2.5),-0.2),angles(-0.8726646259971648,-0.3490658503988659,-0.3490658503988659)),deltaTime) 
                    --MW_animatorProgressSave: RightLeg,1.1,0,0,0.5,-40,10,2,2,-0.8,0.1,1,2.5,75,0,0,0.5,-0.5,0,0,0.5,15,0,0,0.5,angelwings_Handle,0,0,0,1,0,0,0,1,-1.50518798828125,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,Head,0,0,0,0.5,-40,0,0,0.5,1,0,0,0.5,0,5,2,2.5,-0.2,0,0,0.5,200,0,0,0.5,Torso,0,0,0,0.5,-150,3,0.5,2.5,3,-0.4,0,2,-10,3,0.5,2.5,0,0,0,0.5,160,0,0,0.5,LeftLeg,-1.2,0,0,0,-50,10,2,-2,-0.9,0.1,1.3,2.5,-75,0,0,0,-0.,,0,0.5,-13,0,0,4,LeftArm,-1.5,0,0,0.5,120,10,0.5,2.5,1,-0.1,2,2.5,-10,0,0,0.5,-0.2,0,0,0.5,-30,0,4,1.25,RightArm,1.6,0,0,0.5,-50,0,0,0,0.3,-0.1,2,2.5,-20,0,0,0,-0.2,0,0,0.5,-20,-10,4,0
                elseif mode == "Invisible" then
                    walkSpeed = 16
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1400,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    --MW_animatorProgressSave: Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,1400,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1                   
                elseif mode == "ERRAH" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),1,-0.8),angles(1.7453292519943295+0.17453292519943295*sin(sine*5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),-0.17453292519943295*sin((sine+1)*2.5))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953+0.5235987755982988*sin(sine*105),-0.17453292519943295+0.5235987755982988*sin(sine*106),3.141592653589793+0.5235987755982988*sin(sine*107))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(0.6981317007977318-0.17453292519943295*sin((sine+1)*2.5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295+0.08726646259971647*sin(sine*5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,1+0.1*sin((sine+1)*2.5),-0.8),angles(2.0943951023931953-0.17453292519943295*sin(sine*105),0.6981317007977318+0.17453292519943295*sin(sine*106),1.2217304763960306+0.17453292519943295*sin(sine*107))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*2.5),2+0.3*sin(sine*5),0.2 * sin(sine*2.5)),angles(2.0943951023931953-0.17453292519943295*sin((sine+1)*5),0.17453292519943295*sin(sine*2.5),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(0.5235987755982988-0.2617993877991494*sin((sine+1)*2.5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,100,10,0,5,1,0,0,1,30,20,0,2.5,-0.8,0,0,1,0,-10,1,2.5,Head,0,0,0,1,-120,30,0,105,1,0,0,1,-10,30,0,106,0,0,0,1,180,30,0,107,RightLeg,0.5,0,0,1,40,-10,1,2.5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,5,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.,0,0,1,120,-10,0,105,1,0.1,1,2.5,40,10,0,106,-0.8,0,0,1,70,10,0,107,Torso,0,0.3,0,2.5,120,-10,1,5,2,0.3,0,5,0,10,0,2.5,0,0.2,0,2.5,180,0,0,1,LeftLeg,-0.5,0,0,1,30,-15,1,2.5,-1,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "Dragged away" then
                    walkSpeed = 25
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4-0.1*sin(sine*2.5),0.5,0.8),angles(-2.443460952792061+0.2617993877991494*sin((sine+1)*5),0.5235987755982988+0.3490658503988659*sin(sine*2.5),0.3490658503988659*sin(sine*2.5))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-2.0943951023931953,-0.17453292519943295+0.08726646259971647*sin(sine*5),3.141592653589793+0.3490658503988659*sin(sine*5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,-0.5),angles(0.6981317007977318+0.3490658503988659*sin((sine+1)*5),-0.3490658503988659+0.17453292519943295*sin((sine+1)*2.5),-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.7+0.1*sin((sine+1)*2.5),-0.5),angles(1.0471975511965976-0.17453292519943295*sin(sine*5),-0.5235987755982988+0.17453292519943295*sin(sine*5),-0.3490658503988659+0.17453292519943295*sin(sine*5))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.2 * sin(sine*2.5),-1.7+0.1*sin(sine*5),0.2 * sin(sine*2.5)),angles(-2.0943951023931953+0.2617993877991494*sin((sine+1)*5),0.17453292519943295*sin(sine*2.5),0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*2.5),0.1 * sin(sine*5)),angles(0.8726646259971648+0.3490658503988659*sin((sine+1)*5),0.3490658503988659,-0.17453292519943295-0.08726646259971647*sin(sine*5))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.4,-0.1,0,2.5,-140,15,1,5,0.5,0,0,1,30,20,0,2.5,0.8,0,0,1,,20,0,2.5,Head,0,0,0,1,-120,0,0,5,1,0,0,1,-10,5,0,5,0,0,0,1,180,20,0,5,RightLeg,0.5,0,0,1,40,20,1,5,-1,0,0,1,-20,10,1,2.5,-0.5,0,0,1,-10,-5,0,5,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1,0,0,1,60,-10,0,5,0.7,0.1,1,2.5,-30,10,0,5,-0.5,0,0,1,-20,10,0,5,Torso,0,0.2,0,2.5,-120,15,1,5,-1.7,0.1,0,5,0,10,0,2.5,0,0.2,0,2.5,,0,0,1,LeftLeg,-0.5,0,0,1,50,20,1,5,-1,0.1,0,2.5,20,0,0,1,0,0.1,0,5,-10,-5,0,5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                                     
                elseif mode == "siezrure funnier" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1),3.141592653589793+174532.90774614044*sin(sine*1))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(174532.90774614044*sin(sine*1),1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*25),1+3*sin(sine*20),1 * sin(sine*17)),angles(-1.5707963267948966-174532.90774614044*sin(sine*1),-174532.90774614044*sin(sine*1),3.141592653589793-174532.90774614044*sin(sine*1))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(174532.90774614044*sin(sine*1),-1.5707963267948966+174532.90774614044*sin(sine*1),174532.90774614044*sin(sine*1))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,0,9999999,0,1,0.5,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Head,0,0,0,1,-90,9999999,0,1,1,0,0,1,0,9999999,0,1,0,0,0,1,180,9999999,0,1,RightLeg,1,0,0,1,0,9999999,0,1,-1,0,0,1,90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,9999999,0,1,0.5,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Torso,0,1,,25,-90,-9999999,0,1,1,3,,20,0,-9999999,0,1,0,1,0,17,180,-9999999,0,1,LeftLeg,-1,0,0,1,0,9999999,0,1,-1,0,0,1,-90,9999999,0,1,0,0,0,1,0,9999999,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "siezrure 2" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966+0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),0.3490658503988659*sin(sine*53))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5,-0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*52))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-2.5,0),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*52),3.141592653589793+0.3490658503988659*sin(sine*53))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1,0.5),angles(0.3490658503988659*sin(sine*51),0.3490658503988659*sin(sine*53),0.3490658503988659*sin(sine*53))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,52,-0.5,0,0,1,0,20,0,53,Head,0,0,0,1,-90,20,0,51,1,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,RightLeg,0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,52,0.5,0,0,1,0,20,0,53,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.5,0,0,1,0,20,0,51,0.5,0,0,1,0,20,0,53,-0.5,0,0,1,0,20,0,52,Torso,0,0,0,1,0,20,0,51,-2.5,0,0,1,0,20,0,52,0,0,0,1,180,20,0,53,LeftLeg,-0.5,0,0,1,0,20,0,51,-1,0,0,1,0,20,0,53,0.5,0,0,1,0,20,0,53,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
                elseif mode == "Sonic" then
                    walkSpeed = 60
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.8+0.2*sin((sine+1)*20),0.3+0.3*sin((sine+1)*40),0),angles(-0.8726646259971648+0.3490658503988659*sin((sine+1)*40),-0.3490658503988659-0.5235987755982988*sin((sine+1)*20),0.5235987755982988)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976-0.08726646259971647*sin(sine*40),-0.17453292519943295*sin(sine*20),3.141592653589793-0.17453292519943295*sin(sine*20))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.5*sin((sine+0.5)*20),0.3-0.5*sin((sine+1)*20)),angles(1.7453292519943295*sin((sine+1)*20),0,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.8+0.2*sin((sine+1)*20),0.3+0.3*sin((sine+1)*40),0),angles(-0.8726646259971648+0.3490658503988659*sin((sine+1)*40),0.3490658503988659-0.5235987755982988*sin((sine+1)*20),-0.5235987755982988)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,0.3 * sin(sine*40),0.5 * sin((sine+1)*40)),angles(-2.181661564992912-0.17453292519943295*sin((sine+1)*40),0.08726646259971647*sin(sine*20),3.141592653589793+0.17453292519943295*sin(sine*20))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.5*sin((sine+0.5)*20),0.3+0.5*sin((sine+1)*20)),angles(-1.7453292519943295*sin((sine+1)*20),0,0)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.8,0.2,1,20,-50,20,1,40,0.3,0.3,1,40,-20,-30,1,20,0,0,0,1,30,0,0,20,Head,0,0,0,1,-60,-5,0,40,1,0,0,1,0,-10,0,20,0,0,0,1,180,-10,0,20,RightLeg,0.5,0,0,1,0,100,1,20,-1,0.5,0.5,20,0,0,0,1,0.3,-0.5,1,20,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,64,0,0,0,64,0.09050845354795456,0,0,64,0,0,0,64,-0.07476425170898438,0,0,64,0,0,0,64,LeftArm,-1.8,0.2,1,20,-50,20,1,40,0.3,0.3,1,40,20,-30,1,20,0,0,0,1,-30,0,0,20,Torso,0,0,0,1,-125,-10,1,40,0,0.3,0,40,0,5,0,20,0,0.5,1,40,180,10,0,20,LeftLeg,-0.5,0,0,1,0,-100,1,20,-1,-0.5,0.5,20,0,0,0,1,0.3,0.5,1,20,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,64,0,0,0,64,1.2424559593200684,0,0,64,0,0,0,64,-0.352630615234375,0,0,64,0,0,0,64
    
                elseif mode == "Twerk" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.2,0.5,-0.7),angles(0.6981317007977318-0.5235987755982988*sin(sine*20),0.3490658503988659,-0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.0471975511965976,-0.3490658503988659*sin(sine*20),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.3,-1.5+0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,-0.17453292519943295,0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.2,0.5,-0.7),angles(0.6981317007977318+0.5235987755982988*sin(sine*20),-0.3490658503988659,0.5235987755982988+0.3490658503988659*sin(sine*20))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0.3 * sin(sine*20),-0.6,0),angles(-2.2689280275926285+0.17453292519943295*sin(sine*10),0.17453292519943295*sin(sine*20),3.141592653589793+0.3490658503988659*sin(sine*20))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.3,-1.5-0.3*sin(sine*20),0.3+0.3*sin(sine*10)),angles(1.2217304763960306,0.17453292519943295,-0.3490658503988659+0.3490658503988659*sin(sine*20))),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.2,0,0,1,40,-30,0,20,0.5,0,0,1,20,0,0,1,-0.7,0,0,1,-30,20,0,20,Head,0,0,0,1,-60,0,0,1,1,0,0,1,,-20,0,20,0,0,0,1,180,0,0,1,RightLeg,0.3,0,0,1,70,0,0,1,-1.5,0.3,0,20,-10,0,0,1,0.3,0.3,0,10,20,20,0,20,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.2,0,0,1,40,30,0,20,0.5,0,0,1,-20,0,0,1,-0.7,0,0,1,30,20,0,20,Torso,,0.3,0,20,-130,10,0,10,-0.6,0,0,1,0,10,0,20,0,0,0,1,180,20,0,20,LeftLeg,-0.3,0,0,1,70,0,0,1,-1.5,-0.3,0,20,10,0,0,1,0.3,0.3,0,10,-20,20,0,20,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "Pogo Stick" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,1.5707963267948966-0.5235987755982988*sin(sine*10))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966-0.3490658503988659*sin(sine*10),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,0.5+0.3*sin((sine+1)*10),-0.5),angles(0,0,-1.5707963267948966+0.5235987755982988*sin(sine*10))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,1.2+2*sin((sine+1)*10),0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(0,-1,0.5),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,0,0,1,-0.5,0,0,1,90,-30,0,10,Head,0,0,0,1,-90,-20,,10,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1.5,0,0,1,0,0,0,1,0.5,0.3,1,10,0,,0,1,-0.5,0,0,1,-90,30,0,10,Torso,0,0,0,1,-90,0,0,1,1.2,2,1,10,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,,0,0,1,0,0,0,1,-1,0,0,1,0,0,0,1,0.5,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "fishy business" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(10 * sin(sine*3),1+5*sin(sine*10),10 * sin(sine*5)),angles(-1.5707963267948966+1.7453292519943295*sin(sine*5),1.7453292519943295*sin(sine*3),3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,-1,0,0,1,0,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,,10,0,3,-90,100,0,5,1,5,0,10,0,100,0,3,,10,0,5,180,,0,4,LeftLeg,-1,0,0,1,0,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
                elseif mode == "spaghetti" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(-0.5+1*sin((sine+1)*5),1.5,1 * sin((sine+2)*5)),angles(1.5707963267948966,1.5707963267948966,1.5707963267948966)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(3 * sin((sine+2)*5),5,3 * sin((sine+3)*5)),angles(-1.5707963267948966+0.3490658503988659*sin((sine+3)*5),0.3490658503988659*sin((sine+2)*5),3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5+1*sin((sine+1)*5),-1,1 * sin((sine+2)*5)),angles(0,1.5707963267948966,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(0.5+2*sin((sine+2)*5),4.5,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(1 * sin(sine*5),2,1 * sin((sine+1)*5)),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5+2*sin((sine+2)*5),-3,2 * sin((sine+3)*5)),angles(0,-1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,-0.5,1,1,5,90,0,0,1,1.5,0,0,1,90,0,3,5,0,1,2,5,90,0,0,1,Head,0,3,2,5,-90,20,3,5,5,0,0,1,0,20,2,5,0,3,3,5,180,0,0,1,RightLeg,0.5,1,1,5,0,0,0,1,-1,0,0,1,90,0,0,1,0,1,2,5,0,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,128,0,0,0,128,0.09050845354795456,0,0,128,0,0,0,128,-0.07476425170898438,0,0,128,0,0,0,128,LeftArm,0.5,2,2,5,0,0,0,1,4.5,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Torso,0,1,0,5,-90,0,0,1,2,0,0,1,0,0,0,1,0,1,1,5,180,0,0,1,LeftLeg,-0.5,2,2,5,0,0,0,1,-3,0,0,1,-90,0,0,1,0,2,3,5,0,0,0,1,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,128,0,0,0,128,1.2424559593200684,0,0,128,0,0,0,128,-0.352630615234375,0,0,128,0,0,0,128
    
                elseif mode == "Classic r6" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.5,0),angles(2.6179938779914944+0.3490658503988659*sin((sine+1)*8),1.5707963267948966,0)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1,0),angles(0,1.5707963267948966,0)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.5707963267948966,0,3.141592653589793)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1,0.5,0),angles(2.6179938779914944+0.3490658503988659*sin(sine*8),-1.5707963267948966,0)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,1,0,0,1,150,20,1,8,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,0,0,0,8,-1,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,0,0,0,8,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,180,0,0,1,LeftArm,-1,0,0,1,150,20,0,8,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1
                elseif mode == "Nazi Swastika" then
                    walkSpeed = 16
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0,0.5,0),angles(0,1.5707963267948966,3.141592653589793)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(angles(-1.5707963267948966,-0.6981317007977318,3.141592653589793),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.5,0.5,0.5),angles(0,-3.141592653589793,1.5707963267948966)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(3.5 * sin((sine+1.5)*0.625),3 * sin((sine+4)*0.625),0),angles(0.5235987755982988+2.0943951023931953*sin((sine+30)*0.625),0.5235987755982988+2.0943951023931953*sin((sine+400)*0.625),0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,0,0),angles(0,-1.5707963267948966,0)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0,-0.5,0.5),angles(0,-31.41592653589793,1.5707963267948966)),deltaTime) 
                    --MW_animatorProgressSave: RightArm,0,0,0,1,0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-40,0,0,1,0,0,0,1,180,0,0,1,SlickBackYakuzaBlack_Handle,-3.552713678800501e-15,0,0,1,180,0,0,1,0.3807339668273926,0,0,1,0,0,0,1,0.21092987060546875,0,0,1,180,0,0,1,LeftArm,-0.5,0,0,1,0,0,0,1,0.5,0,0,1,-180,0,0,1,0.5,0,0,1,90,0,0,1,Hair4Accessory_Handle,0.01747131533920765,0,0,1,0,0,0,1,0.5561122894287109,0,0,1,0,0,0,1,-0.2338876724243164,0,0,1,0,0,0,1,hair_Handle,-0.04859161376953125,0,0,1,0,0,0,1,0.47028207778930664,0,0,1,0,0,0,1,-0.260406494140625,0,0,1,0,0,0,1,LongHair_Handle,-0.00004900000203633681,0,0,1,0,0,0,1,1.10490083694458,0,0,1,0,0,0,1,-0.4286848306655884,0,0,1,0,0,0,1,Head,0,3.5,1.5,0.625,30,120,30,0.625,0,3,4,0.625,30,120,400,0.625,0,0,0.5,0.625,0,0,0,5,LeftLeg,-1,0,0,1,0,0,0,1,,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,,0,0,1,0,0,0,1,-0.5,0,0,1,-1800,0,0,1,0.5,0,0,1,90,0,0,1
                elseif mode == "CHAOS" then
                    walkSpeed = 11
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.9198621771937625+0.08726646259971647*sin((sine+2)*5),0.17453292519943295*sin(sine*100),3.141592653589793+0.17453292519943295*sin(sine*99))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.2*sin(sine*2.5),0.2 * sin((sine+0.5)*2.5)),angles(0.17453292519943295-0.5235987755982988*sin((sine+0.5)*2.5),0,0)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.4+0.1*sin(sine*2.5),0.3-0.3*sin(sine*2.5),-0.7+0.2*sin(sine*2.5)),angles(0.3490658503988659-0.5235987755982988*sin(sine*2.5),0.3490658503988659*sin(sine*101),0.17453292519943295*sin(sine*2.5))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.4+0.1*sin(sine*2.5),0.3+0.3*sin(sine*2.5),-0.7-0.2*sin(sine*2.5)),angles(0.3490658503988659+0.5235987755982988*sin(sine*2.5),0.3490658503988659*sin(sine*100),0.17453292519943295*sin(sine*2.5))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1-0.2*sin(sine*2.5),-0.2 * sin((sine+0.5)*2.5)),angles(0.17453292519943295+0.5235987755982988*sin((sine+0.5)*2.5),0,0)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.1 * sin(sine*5),0),angles(-1.9198621771937625,0,3.141592653589793)),deltaTime) 
                    --MW_animatorProgressSave: Head,0,0,0,1,-110,5,2,5,1,0,0,1,0,10,0,100,0,0,0,1,180,10,0,99,RightLeg,0.5,0,0,1,10,-30,0.5,2.5,-1,0.2,0,2.5,0,0,0,1,0,0.2,0.5,2.5,0,0,0,1,RightArm,1.4,0.1,0,2.5,20,-30,0,2.5,0.3,-0.3,0,2.5,0,20,0,101,-0.7,0.2,0,2.5,0,10,0,2.5,LeftArm,-1.4,0.1,0,2.5,20,30,0,2.5,0.3,0.3,0,2.5,0,20,0,100,-0.7,-0.2,0,2.5,0,10,0,2.5,LeftLeg,-0.5,0,0,1,10,30,0.5,2.5,-1,-0.2,0,2.5,0,0,0,1,0,-0.2,0.5,2.5,0,0,0,1,Torso,0,0,0,1,-110,0,0,1,0,-0.1,0,5,0,0,0,1,0,0,0,1,180,0,0,1
                elseif mode == "Jerking Off" then 
                    walkSpeed = 16
                        RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0, 0) * euler(-1.6580627893946132 + fw * 0.1, rt * -0.05, -3.141592653589793), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1,0.4,-1),angles(0.6981317007977318+0.2617993877991494*sin(sine*15),0,-0.8726646259971648)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), -1.6580627893946132 + 0.06981317007977318 * sin((sine + 0.25) * 4), 1.5707963267948966), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.5, 0) * euler(4.014257279586958 - 0.08726646259971647 * sin((sine + 0.5) * 4), -1.7453292519943295 - 0.08726646259971647 * sin((sine + 0.25) * 4), 1.5707963267948966), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.7453292519943295, 0, -3.141592653589793 - rt), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), 1.6580627893946132 - 0.06981317007977318 * sin((sine + 0.25) * 4), -1.5707963267948966), deltaTime) 
                elseif mode == "Chase" then
                    walkSpeed = 30
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-0.8,0.5),angles(-0.5235987755982988,-0.08726646259971647,0.08726646259971647)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.3,1+0.3*sin((sine+1)*10),-0.5),angles(2.2689280275926285+0.2617993877991494*sin((sine+1)*20),-0.5235987755982988,-0.08726646259971647*sin((sine+1)*10))),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.3,1-0.3*sin((sine+1)*10),-0.5),angles(2.2689280275926285+0.2617993877991494*sin((sine+1)*20),0.5235987755982988,-0.08726646259971647*sin((sine+1)*10))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-0.8,0.5),angles(-0.5235987755982988,0.08726646259971647,-0.08726646259971647)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(angles(-2.443460952792061,0.17453292519943295*sin(sine*10),3.141592653589793+0.3490658503988659*sin(sine*10)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-1.2217304763960306+0.17453292519943295*sin((sine+2)*20),0.3490658503988659*sin((sine+1)*10),3.141592653589793-0.17453292519943295*sin(sine*10))),deltaTime) 
                elseif mode == "AMOGUS" then 
                    walkSpeed = 16
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.05-0.1*sin(sine*5),-0.1 * sin((sine+1)*5)),angles(-1.9198621771937625+0.08726646259971647*sin((sine+1)*5),0,3.141592653589793)),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(0.5,-1+0.1*sin(sine*5),0.5),angles(0.5235987755982988-0.3490658503988659*sin((sine+1)*5),-0.08726646259971647,0.05235987755982989)),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,-0.4-0.1*sin((sine+1)*5),-0.5+0.05*sin((sine+2)*5)),angles(-1.9198621771937625-0.08726646259971647*sin((sine+2)*5),0,3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.25,0.4-0.05*sin((sine+1)*5),0.5),angles(0.08726646259971647,0.17453292519943295,0)),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.25,0.4-0.05*sin((sine+1)*5),0.5),angles(0.08726646259971647,-0.17453292519943295,0)),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-0.5,-1+0.1*sin(sine*5),0.5),angles(0.5235987755982988-0.3490658503988659*sin((sine+1)*5),0.08726646259971647,-0.05235987755982989)),deltaTime) 
                    --MW_animatorProgressSave: Torso,0,0,0,1,-110,5,1,5,-0.05,-0.1,0,5,0,0,0,1,0,-0.1,1,5,180,0,0,1,RightLeg,0.5,0,0,1,30,-20,1,5,-1,0.1,0,5,-5,0,0,1,0.5,0,0,1,3,0,0,1,Head,0,0,0,1,-110,-5,2,5,-0.4,-0.1,1,5,0,0,0,1,-0.5,0.05,2,5,180,0,0,1,RightArm,0.25,0,0,1,5,0,0,1,0.4,-0.05,1,5,10,0,0,1,0.5,0,0,1,0,0,0,1,LeftArm,-0.25,0,0,1,5,0,0,1,0.4,-0.05,1,5,-10,0,0,1,0.5,0,0,1,0,0,0,1,LeftLeg,-0.5,0,0,1,30,-20,1,5,-1,0.1,0,5,5,0,0,1,0.5,0,0,1,-3,0,0,1
                                                                                  
                elseif mode == "Chest Lay" then
                    walkSpeed = 16
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1,-1.3,1.2),angles(-2.897246558310587+0.2617993877991494*sin(sine*-6),-2.0943951023931953+0.13962634015954636*sin(sine*5),-0.5235987755982988+0.06981317007977318*sin(sine*2))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1.5,0.7+0.1*sin(sine*4)),angles(0.8726646259971648+0.10471975511965978*sin(sine*5),0.06981317007977318*sin(sine*4),3.141592653589793-0.12217304763960307*sin(sine*-5))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1,-1.2,0.8),angles(-2.705260340591211+0.2617993877991494*sin(sine*-6),1.7453292519943295+0.13962634015954636*sin(sine*5),0.8726646259971648+0.15707963267948966*sin(sine*2))),deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-1.5,1,0.9),angles(2.9670597283903604+1.0471975511965976*sin(sine*6),-0.08726646259971647*sin(sine*2.5),0.17453292519943295)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(1.5,1,0.9),angles(2.9670597283903604+0.6981317007977318*sin(sine*-6),-0.10471975511965978*sin(sine*-2.5),-0.17453292519943295)),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-1.6+0.1*sin(sine*1.2),0),angles(2.4085543677521746+0.10471975511965978*sin(sine*5),0.05235987755982989*sin(sine*1),3.141592653589793)),deltaTime) 
                    --MW_animatorProgressSave: LeftLeg,-1,0,0,1,-166,15,0,-6,-1.3,0,0,1,-120,8,0,5,1.2,0,0,1,-30,4,0,2,Head,0,0,0,4,50,6,0,5,1.5,0,0,4,0,4,0,4,0.7,0.1,0,4,180,-7,0,-5,Accessory(Hair.002Accessory)_Handle,-0.00103759765625,0,0,1,0,0,0,1,1.2424559593200684,0,0,1,0,0,0,1,-0.352630615234375,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-155,15,0,-6,-1.2,0,0,1,100,8,0,5,0.8,0,0,1,50,9,0,2,LeftArm,-1.5,0,0,2.5,170,60,0,6,1,0,0,2.5,0,-5,0,2.5,0.9,0,0,2.5,10,0,0,2.5,RightArm,1.5,0,0,-2.5,170,40,0,-6,1,0,0,-2.5,0,-6,0,-2.5,0.9,0,0,-2.5,-10,0,0,-2.5,Torso,0,0,0,1,138,6,0,5,-1.6,0.1,0,1.2,0,3,0,1,0,0,0,1,180,0,0,1,Accessory(guyfawkesmask_goth)_Handle,0.00007629393803654239,0,0,1,0,0,0,1,0.09050845354795456,0,0,1,0,0,0,1,-0.07476425170898438,0,0,1,0,0,0,1
                elseif mode == "Back Handstand" then 
                    walkSpeed = 12                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cfMul(cf(-0.7,1.2,0.9+0.04*sin(sine*3)),angles(-2.0943951023931953,-0.6981317007977318,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    RootJoint.C0 = RootJoint.C0:Lerp(cfMul(cf(0,-0.65+0.03*sin(sine*3),0),angles(-0.22689280275926285+0.017453292519943295*sin(sine*3),-15.707963267948966,3.141592653589793)),deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cfMul(cf(0.7,1.2,0.9+0.04*sin(sine*3)),angles(-2.0943951023931953,1.0471975511965976,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cfMul(cf(1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.5707963267948966,1.2217304763960306,-0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cfMul(cf(-1.3,-1.2,0.6+0.04*sin(sine*3)),angles(-1.5707963267948966,-1.2217304763960306,0.05235987755982989*sin(sine*0.4))),deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cfMul(cf(0,1,0),angles(-0.5235987755982988,0.17453292519943295*sin(sine*1),3.141592653589793+0.5235987755982988*sin(sine*1))),deltaTime) 
        
        
                elseif mode == "fe creepy crawler" then
                    walkSpeed = 16
                Neck.C0 = Neck.C0:Lerp(cf(0, 0, 0.5) * euler(0, 0, 3.141592653589793), 0.2) 
                RootJoint.C0 = RootJoint.C0:Lerp(cf(0, -1.4, 0) * euler(3.141592653589793, 0, -3.141592653589793), 0.2) 
                LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 1.5, 0.3) * euler(1.7453292519943295, 0, -0.17453292519943295), 0.2) 
                RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 1.5, 0.3) * euler(1.7453292519943295, 0, 0.17453292519943295), 0.2) 
                LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1.5, 0.8) * euler(1.3962634015954636, 0, -0.17453292519943295), 0.2) 
                RightHip.C0 = RightHip.C0:Lerp(cf(1, -1.5, 0.8) * euler(1.3962634015954636, 0, 0.17453292519943295), 0.2) 
                
                else
                    RootJoint.C0 = RootJoint.C0:Lerp(cf(0, 0, 0) * euler(-1.6580627893946132 + fw * 0.1, rt * -0.05, -3.141592653589793), deltaTime) 
                    RightShoulder.C0 = RightShoulder.C0:Lerp(cf(1, 0.5, 0) * euler(4.014257279586958 - 0.08726646259971647 * sin((sine + 0.5) * 4), 1.7453292519943295 + 0.08726646259971647 * sin((sine + 0.25) * 4), -1.5707963267948966), deltaTime) 
                    LeftHip.C0 = LeftHip.C0:Lerp(cf(-1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), -1.6580627893946132 + 0.06981317007977318 * sin((sine + 0.25) * 4), 1.5707963267948966), deltaTime) 
                    LeftShoulder.C0 = LeftShoulder.C0:Lerp(cf(-1, 0.5, 0) * euler(4.014257279586958 - 0.08726646259971647 * sin((sine + 0.5) * 4), -1.7453292519943295 - 0.08726646259971647 * sin((sine + 0.25) * 4), 1.5707963267948966), deltaTime) 
                    Neck.C0 = Neck.C0:Lerp(cf(0, 1, 0) * euler(-1.7453292519943295, 0, -3.141592653589793 - rt), deltaTime) 
                    RightHip.C0 = RightHip.C0:Lerp(cf(1, -1, 0) * euler(1.5707963267948966 - 0.08726646259971647 * sin((sine + 0.5) * 4), 1.6580627893946132 - 0.06981317007977318 * sin((sine + 0.25) * 4), -1.5707963267948966), deltaTime) 
                    --Torso,0,0,0,4,-95,0,0,4,0,0,0,4,0,0,0,4,0,0,0,4,-180,0,0,4,RightArm,1,0,0,4,230,-5,0.5,4,0.5,0,0,4,100,5,0.25,4,0,0,0,4,-90,0,0,4,LeftLeg,-1,0,0,4,90,-5,0.5,4,-1,0,0,4,-95,4,0.25,4,0,0,0,4,90,0,0,4,LeftArm,-1,0,0,4,230,-5,0.5,4,0.5,0,0,4,-100,-5,0.25,4,0,0,0,4,90,0,0,4,Head,0,0,0,4,-100,0,0.5,4,1,0,0,4,0,0,0.25,4,0,0,0,4,-180,0,0,4,RightLeg,1,0,0,4,90,-5,0.5,4,-1,0,0,4,95,-4,0.25,4,0,0,0,4,-90,0,0,4
                    end
                
                end
    
            end
        end)
    
        
    
    end)

    local function onCharacterDeath()
        if R6reanimated then
            R6reanimated = false
        local character = plr.Character or plr.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            respawnPosition = humanoidRootPart.CFrame 
            wait(0.1)
            walkSpeeder = 16
        end
        Message("Character has died!", "R6 Reanimate Inactive", 5)
    elseif R15reanimated then
            R15reanimated = false
            local character = plr.Character or plr.CharacterAdded:Wait()
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                respawnPosition = humanoidRootPart.CFrame 
                wait(0.1)
                walkSpeeder = 16
            end
            Message("Character has died!", "R6 Reanimate Inactive", 5)
        elseif not R15reanimated or not R6reanimated then
            local character = plr.Character or plr.CharacterAdded:Wait()
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                respawnPosition = humanoidRootPart.CFrame 
                wait(0.1)
                walkSpeeder = 16
                        end
            Message("Character has died!", "Respawning...", 5)

    end
end
    local function onCharacterAdded(character)
        
        character:WaitForChild("Humanoid").Died:Connect(onCharacterDeath)
    
        
        if respawnPosition then
            character:WaitForChild("HumanoidRootPart").CFrame = respawnPosition
            wait(1)
            respawnPosition = nil

        end
    end
    
    
    plr.CharacterAdded:Connect(onCharacterAdded)
    
    
    if plr.Character then
        onCharacterAdded(plr.Character)
    end

R15:CreateButton("R15 Reanimate", function(R15reanimatedTrue)
        if R6reanimated or plr.Character.Humanoid.Health == 0 then
            Message("Error R6 Reanimate Status:", "Active", 5)
            return 
        end
        if R15reanimated or plr.Character.Humanoid.Health == 0 then
            Message("R15 Reanimate Status:", "Active", 5)
            return 
        end
        R15reanimated = true
        local v3_net, v3_808 = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)    
        local function getNetlessVelocity(realPartVelocity)
            local mag = realPartVelocity.Magnitude
            if mag > 0 then
                local unit = realPartVelocity.Unit
                if unit.Y ~= 0 then
                    return unit * (0.0 / unit.Y)  
                end
            end
            return v3_net + realPartVelocity * v3_808
        end
        
        game.ReplicatedStorage:WaitForChild("RagdollEvent"):FireServer()
        
        
        local simradius = "shp" 
        local simrad = 0 
        local healthHide = false 
        local reclaim = true 
        
        local novoid = true 
        local physp = nil 
        
        local noclipAllParts = false 
        local antiragdoll = false 
        local newanimate = true 
        local discharscripts = false 
        local hatcollide = false 
        local humState16 = true 
        local addtools = false 
        local hedafterneck = true 
        local loadtime = game:GetService("Players").RespawnTime + 0.5 
        local method = 3 
        
        local alignmode = 4 
        local flingpart = "HumanoidRootPart" 
        
        local lp = game:GetService("Players").LocalPlayer
        local rs, ws, sg = game:GetService("RunService"), game:GetService("Workspace"), game:GetService("StarterGui")    
        local stepped, heartbeat, renderstepped = rs.Stepped, rs.Heartbeat, rs.RenderStepped
        local twait, tdelay, rad, inf, abs, clamp = task.wait, task.delay, math.rad, math.huge, math.abs, math.clamp
        local cf, v3 = CFrame.new, Vector3.new
        local angles = CFrame.Angles
        local v3_0, cf_0 = v3(0, 0, 0), cf(0, 0, 0)
        
        local c = lp.Character
        if not (c and c.Parent) then
            return
        end
        
        c:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (c and c.Parent) then
                c = nil
            end
        end)
        
        local clone, destroy, getchildren, getdescendants, isa = c.Clone, c.Destroy, c.GetChildren, c.GetDescendants, c.IsA
        
        local function gp(parent, name, className)
            if typeof(parent) == "Instance" then
                for i, v in pairs(getchildren(parent)) do
                    if (v.Name == name) and isa(v, className) then
                        return v
                    end
                end
            end
            return nil
        end
        
        local fenv = getfenv()
        local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
        local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.setsimrad or fenv.set_sim_rad
        
        healthHide = healthHide and ((method == 0) or (method == 3)) and gp(c, "Head", "BasePart")
        
        local reclaim, lostpart = reclaim and c.PrimaryPart, nil
        
        local function align(Part0, Part1)
            local att0 = Instance.new("Attachment")
            att0.Position, att0.Orientation, att0.Name = v3_0, v3_0, "att0_" .. Part0.Name
            local att1 = Instance.new("Attachment")
            att1.Position, att1.Orientation, att1.Name = v3_0, v3_0, "att1_" .. Part1.Name
        
            if alignmode == 4 then
                local hide = false
                if Part0 == healthHide then
                    healthHide = false
                    tdelay(0, function()
                        while twait(2.9) and Part0 and c do
                            hide = #Part0:GetConnectedParts() == 1
                            twait(0.1)
                            hide = false
                        end
                    end)
                end
        
                local rot = rad(0.05)
                local con0, con1 = nil, nil
                con0 = stepped:Connect(function()
                    if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
                    Part0.RotVelocity = Part1.RotVelocity
                end)
                local lastpos = Part0.Position
                con1 = heartbeat:Connect(function(delta)
                    if not (Part0 and Part1 and att1) then return con0:Disconnect() and con1:Disconnect() end
                    if (not Part0.Anchored) and (Part0.ReceiveAge == 0) then
                        if lostpart == Part0 then
                            lostpart = nil
                        end
                        rot = -rot
                        local newcf = Part1.CFrame * att1.CFrame * angles(0, 0, rot)
                        if Part1.Velocity.Magnitude > 0.01 then
                            Part0.Velocity = getNetlessVelocity(Part1.Velocity)
                        else
                            Part0.Velocity = getNetlessVelocity((newcf.Position - lastpos) / delta)
                        end
                        lastpos = newcf.Position
                        if lostpart and (Part0 == reclaim) then
                            newcf = lostpart.CFrame
                        elseif hide then
                            newcf += v3(0, 3000, 0)
                        end
                        if novoid and (newcf.Y < ws.FallenPartsDestroyHeight + 0.1) then
                            newcf += v3(0, ws.FallenPartsDestroyHeight + 0.1 - newcf.Y, 0)
                        end
                        Part0.CFrame = newcf
                    elseif (not Part0.Anchored) and (abs(Part0.Velocity.X) < 45) and (abs(Part0.Velocity.Y) < 25) and (abs(Part0.Velocity.Z) < 45) then
                        lostpart = Part0
                    end
                end)
            else
                Part0.CustomPhysicalProperties = physp
            end
        
            att0:GetPropertyChangedSignal("Parent"):Connect(function()
                Part0 = att0.Parent
                if not isa(Part0, "BasePart") then
                    att0 = nil
                    if lostpart == Part0 then
                        lostpart = nil
                    end
                    Part0 = nil
                end
            end)
            att0.Parent = Part0
        
            att1:GetPropertyChangedSignal("Parent"):Connect(function()
                Part1 = att1.Parent
                if not isa(Part1, "BasePart") then
                    att1 = nil
                    Part1 = nil
                end
            end)
            att1.Parent = Part1
        end
        
        local function respawnrequest()
            local ccfr, c = ws.CurrentCamera.CFrame, lp.Character
            lp.Character = nil
            lp.Character = c
            local con = nil
            con = ws.CurrentCamera.Changed:Connect(function(prop)
                if (prop ~= "Parent") and (prop ~= "CFrame") then
                    return
                end
                ws.CurrentCamera.CFrame = ccfr
                con:Disconnect()
            end)
        end
        
        local destroyhum = (method == 4) or (method == 5)
        local breakjoints = (method == 0) or (method == 4)
        local antirespawn = (method == 0) or (method == 2) or (method == 3)
        
        hatcollide = hatcollide and (method == 0)
        
        addtools = addtools and lp:FindFirstChildOfClass("Backpack")
        
        if type(simrad) ~= "number" then simrad = 1000 end
        if shp and (simradius == "shp") then
            tdelay(0, function()
                while c do
                    shp(lp, "SimulationRadius", simrad)
                    heartbeat:Wait()
                end
            end)
        elseif ssr and (simradius == "ssr") then
            tdelay(0, function()
                while c do
                    ssr(simrad)
                    heartbeat:Wait()
                end
            end)
        end
        
        if antiragdoll then
            antiragdoll = function(v)
                if isa(v, "HingeConstraint") or isa(v, "BallSocketConstraint") then
                    v.Parent = nil
                end
            end
            for i, v in pairs(getdescendants(c)) do
                antiragdoll(v)
            end
            c.DescendantAdded:Connect(antiragdoll)
        end
        
        if antirespawn then
            respawnrequest()
        end
        
        if method == 0 then
            twait(loadtime)
            if not c then
                return
            end
        end
        
        if discharscripts then
            for i, v in pairs(getdescendants(c)) do
                if isa(v, "LocalScript") then
                    v.Disabled = true
                end
            end
        elseif newanimate then
            local animate = gp(c, "Animate", "LocalScript")
            if animate and (not animate.Disabled) then
                animate.Disabled = true
            else
                newanimate = false
            end
        end
        
        if addtools then
            for i, v in pairs(getchildren(addtools)) do
                if isa(v, "Tool") then
                    v.Parent = c
                end
            end
        end
        
        pcall(function()
            settings().Physics.AllowSleep = false
            settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
        end)
        
        local OLDscripts = {}
        
        for i, v in pairs(getdescendants(c)) do
            if v.ClassName == "Script" then
                OLDscripts[v.Name] = true
            end
        end
        
        local scriptNames = {}
        
        for i, v in pairs(getdescendants(c)) do
            if isa(v, "BasePart") then
                local newName, exists = tostring(i), true
                while exists do
                    exists = OLDscripts[newName]
                    if exists then
                        newName = newName .. "_"    
                    end
                end
                table.insert(scriptNames, newName)
                Instance.new("Script", v).Name = newName
            end
        end
        
        local hum = c:FindFirstChildOfClass("Humanoid")
        if hum then
            for i, v in pairs(hum:GetPlayingAnimationTracks()) do
                v:Stop()
            end
        end
        c.Archivable = true
        local cl = clone(c)
        if hum and humState16 then
            hum:ChangeState(Enum.HumanoidStateType.Physics)
            if destroyhum then
                twait(1.6)
            end
        end
        if destroyhum then
            pcall(destroy, hum)
        end
        
        if not c then
            return
        end
        
        local head, torso, root = gp(c, "Head", "BasePart"), gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart"), gp(c, "HumanoidRootPart", "BasePart")
        if hatcollide then
            pcall(destroy, torso)
            pcall(destroy, root)
            pcall(destroy, c:FindFirstChildOfClass("BodyColors") or gp(c, "Health", "Script"))
        end
        
        local model = Instance.new("Model", c)
        model:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (model and model.Parent) then
                model = nil
            end
        end)
        
        for i, v in pairs(getchildren(c)) do
            if v ~= model then
                if addtools and isa(v, "Tool") then
                    for i1, v1 in pairs(getdescendants(v)) do
                        if v1 and v1.Parent and isa(v1, "BasePart") then
                            local bv = Instance.new("BodyVelocity")
                            
                            bv.Velocity, bv.MaxForce, bv.P, bv.Name = v3_0, v3(1000, 1000, 1000), 1250, "bv_" .. v.Name
                            bv.Parent = v1
                        end
                    end
                end
                v.Parent = model
            end
        end
        
        if breakjoints then
            model:BreakJoints()
        else
            if head and torso then
                for i, v in pairs(getdescendants(model)) do
                    if isa(v, "JointInstance") then
                        local save = false
                        if (v.Part0 == torso) and (v.Part1 == head) then
                            save = true
                        end
                        if (v.Part0 == head) and (v.Part1 == torso) then
                            save = true
                        end
                        if save then
                            if hedafterneck then
                                hedafterneck = v
                            end
                        else
                            pcall(destroy, v)
                        end
                    end
                end
            end
            if method == 3 then
                task.delay(loadtime, pcall, model.BreakJoints, model)
            end
        end
        
        cl.Parent = ws
        for i, v in pairs(getchildren(cl)) do
            v.Parent = c
        end
        pcall(destroy, cl)
        
        local uncollide, noclipcon = nil, nil
        if noclipAllParts then
            uncollide = function()
                if c then
                    for i, v in pairs(getdescendants(c)) do
                        if isa(v, "BasePart") then
                            v.CanCollide = false
                        end
                    end
                else
                    noclipcon:Disconnect()
                end
            end
        else
            uncollide = function()
                if model then
                    for i, v in pairs(getdescendants(model)) do
                        if isa(v, "BasePart") then
                            v.CanCollide = false
                        end
                    end
                else
                    noclipcon:Disconnect()
                end
            end
        end
        noclipcon = stepped:Connect(uncollide)
        uncollide()
        
        for i, scr in pairs(getdescendants(model)) do
            if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
                local Part0 = scr.Parent
                if isa(Part0, "BasePart") then
                    for i1, scr1 in pairs(getdescendants(c)) do
                        if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
                            local Part1 = scr1.Parent
                            if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
                                align(Part0, Part1)
                                pcall(destroy, scr)
                                pcall(destroy, scr1)
                                break
                            end
                        end
                    end
                end
            end
        end
        
        for i, v in pairs(getdescendants(c)) do
            if v and v.Parent and (not v:IsDescendantOf(model)) then
                if isa(v, "Decal") then
                elseif isa(v, "BasePart") then
                    v.Anchored = false
                elseif isa(v, "ForceField") then
                    v.Visible = false
                elseif isa(v, "Sound") then
                    v.Playing = false
                elseif isa(v, "BillboardGui") or isa(v, "SurfaceGui") or isa(v, "ParticleEmitter") or isa(v, "Fire") or isa(v, "Smoke") or isa(v, "Sparkles") then
                    v.Enabled = false
                end
            end
        end
        
        if newanimate then
            local animate = gp(c, "Animate", "LocalScript")
            if animate then
                animate.Disabled = false
            end
        end
        
        if addtools then
            for i, v in pairs(getchildren(c)) do
                if isa(v, "Tool") then
                    v.Parent = addtools
                end
            end
        end
        
        local hum0, hum1 = model:FindFirstChildOfClass("Humanoid"), c:FindFirstChildOfClass("Humanoid")
        if hum0 then
            hum0:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (hum0 and hum0.Parent) then
                    hum0 = nil
                end
            end)
        end
        if hum1 then
            hum1:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (hum1 and hum1.Parent) then
                    hum1 = nil
                end
            end)
        
            ws.CurrentCamera.CameraSubject = hum1
            local camSubCon = nil
            local function camSubFunc()
                camSubCon:Disconnect()
                if c and hum1 then
                    ws.CurrentCamera.CameraSubject = hum1
                end
            end
            camSubCon = renderstepped:Connect(camSubFunc)
        
            if hum0 then
                hum1.Jump = hum0.Jump
            else
                respawnrequest()
            end
        end
       
        local function setTransparency(model, transparencyValue)
            for _, descendant in ipairs(model:GetDescendants()) do
                if descendant:IsA("BasePart") then
                    descendant.Transparency = transparencyValue
                end
            end
        end
        
        
        setTransparency(plr.Character.Model, 1)
        
        local rb = Instance.new("BindableEvent", c)
        rb.Event:Connect(function()
            pcall(destroy, rb)
            sg:SetCore("ResetButtonCallback", true)
            if destroyhum then
                if c then c:BreakJoints() end
                return
            end
            if model and hum0 and (hum0.Health > 0) then
                model:BreakJoints()
                hum0.Health = 0
            end
            if antirespawn then
                respawnrequest()
            end
        end)
        
        sg:SetCore("ResetButtonCallback", rb)
        
        tdelay(0, function()
            while c do
                if hum0 and hum1 then
                    hum1.Jump = hum0.Jump
                end
                wait()
            end
            sg:SetCore("ResetButtonCallback", true)
        end)
        
        
        local R15toR6 = false 
        if R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15) then
            
            
        end
        
        
        local torso1 = torso
        torso = gp(c, "Torso", "BasePart") or ((not R15toR6) and gp(c, torso.Name, "BasePart"))
        if (typeof(hedafterneck) == "Instance") and head and torso and torso1 then
            local conNeck, conTorso, conTorso1 = nil, nil, nil
            local aligns = {}
            local function enableAligns()
                if conNeck then conNeck:Disconnect() end
                if conTorso then conTorso:Disconnect() end
                if conTorso1 then conTorso1:Disconnect() end
                for i, v in pairs(aligns) do
                    v.Enabled = true
                end
            end
            conNeck = hedafterneck.Changed:Connect(function(prop)
                if table.find({"Part0", "Part1", "Parent"}, prop) then
                    enableAligns()
                end
            end)
            conTorso = torso:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
            conTorso1 = torso1:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
            for i, v in pairs(getdescendants(head)) do
                if isa(v, "AlignPosition") or isa(v, "AlignOrientation") then
                    i = tostring(i)
                    aligns[i] = v
                    v:GetPropertyChangedSignal("Parent"):Connect(function()
                        aligns[i] = nil
                    end)
                    v.Enabled = false
                end
            end
        end
        
        local flingpart0 = gp(model, flingpart, "BasePart") or gp(gp(model, flingpart, "Accessory"), "Handle", "BasePart")
        local flingpart1 = gp(c, flingpart, "BasePart") or gp(gp(c, flingpart, "Accessory"), "Handle", "BasePart")
        
        local fling = function() end
        if flingpart0 and flingpart1 then
            flingpart0:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (flingpart0 and flingpart0.Parent) then
                    flingpart0 = nil
                    fling = function() end
                end
            end)
            flingpart0.Archivable = true
            flingpart1:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (flingpart1 and flingpart1.Parent) then
                    flingpart1 = nil
                    fling = function() end
                end
            end)
            local att0 = gp(flingpart0, "att0_" .. flingpart0.Name, "Attachment")
            local att1 = gp(flingpart1, "att1_" .. flingpart1.Name, "Attachment")
            if att0 and att1 then
                att0:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not (att0 and att0.Parent) then
                        att0 = nil
                        fling = function() end
                    end
                end)
                att1:GetPropertyChangedSignal("Parent"):Connect(function()
                    if not (att1 and att1.Parent) then
                        att1 = nil
                        fling = function() end
                    end
                end)
                local lastfling = nil
                local mouse = lp:GetMouse()
                fling = function(target, duration, rotVelocity)
                    if typeof(target) == "Instance" then
                        if isa(target, "BasePart") then
                            target = target.Position
                        elseif isa(target, "Model") then
                            target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                            if target then
                                target = target.Position
                            else
                                return
                            end
                        elseif isa(target, "Humanoid") then
                            target = target.Parent
                            if not (target and isa(target, "Model")) then
                                return
                            end
                            target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                            if target then
                                target = target.Position
                            else
                                return
                            end
                        else
                            return
                        end
                    elseif typeof(target) == "CFrame" then
                        target = target.Position
                    elseif typeof(target) ~= "Vector3" then
                        target = mouse.Hit
                        if target then
                            target = target.Position
                        else
                            return
                        end
                    end
                    if target.Y < ws.FallenPartsDestroyHeight + 5 then
                        target = v3(target.X, ws.FallenPartsDestroyHeight + 5, target.Z)
                    end
                    lastfling = target
                    if type(duration) ~= "number" then
                        duration = tonumber(duration) or 0.5
                    end
                    if typeof(rotVelocity) ~= "Vector3" then
                        rotVelocity = v3(0, 0, 0)
                    end
                    if not (target and flingpart0 and flingpart1 and att0 and att1) then
                        return
                    end
                    flingpart0.Archivable = true
                    local flingpart = clone(flingpart0)
                    flingpart.Transparency = 1
                    flingpart.CanCollide = false
                    flingpart.Name = "flingpart_" .. flingpart0.Name
                    flingpart.Anchored = true
                    flingpart.Velocity = v3_0
                    flingpart.RotVelocity = v3_0
                    flingpart.Position = target
                    flingpart:GetPropertyChangedSignal("Parent"):Connect(function()
                        if not (flingpart and flingpart.Parent) then
                            flingpart = nil
                        end
                    end)
                    flingpart.Parent = flingpart1
                    if flingpart0.Transparency > 0.5 then
                        flingpart0.Transparency = 0.5
                    end
                    att1.Parent = flingpart
                    local con = nil
                    local rotchg = v3(0, rotVelocity.Unit.Y * -1000, 0)
                    con = heartbeat:Connect(function(delta)
                        if target and (lastfling == target) and flingpart and flingpart0 and flingpart1 and att0 and att1 then
                            flingpart.Orientation += rotchg * delta
                            flingpart0.RotVelocity = rotVelocity
                        else
                            con:Disconnect()
                        end
                    end)
                    if alignmode ~= 4 then
                        local con = nil
                        con = renderstepped:Connect(function()
                            if flingpart0 and target then
                                flingpart0.RotVelocity = v3_0
                            else
                                con:Disconnect()
                            end
                        end)
                    end
                    twait(duration)
                    if lastfling ~= target then
                        if flingpart then
                            if att1 and (att1.Parent == flingpart) then
                                att1.Parent = flingpart1
                            end
                            pcall(destroy, flingpart)
                        end
                        return
                    end
                    target = nil
                    if not (flingpart and flingpart0 and flingpart1 and att0 and att1) then
                        return
                    end
                    flingpart0.RotVelocity = v3_0
                    att1.Parent = flingpart1
                    pcall(destroy, flingpart)
                end
            end
        end
    end)
    local StopAnim = true
    local AnimationActive = false
    local CurrentAnimationID = nil
    
    
    R15:CreateBox("Animation ID", "string", function(AnimationID)
        if not R15reanimated then
            Message("Error:", "Invalid Animation", 5)
            return
        end
    
        
        if AnimationActive then
            StopAnim = true
            AnimationActive = false
            
            
            wait(0.5) 
        end
    
        
        StopAnim = false
        AnimationActive = true
    
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
    
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local head = character:WaitForChild("Head")
        local leftFoot = character:WaitForChild("LeftFoot")
        local leftHand = character:WaitForChild("LeftHand")
        local leftLowerArm = character:WaitForChild("LeftLowerArm")
        local leftLowerLeg = character:WaitForChild("LeftLowerLeg")
        local leftUpperArm = character:WaitForChild("LeftUpperArm")
        local leftUpperLeg = character:WaitForChild("LeftUpperLeg")
        local lowerTorso = character:WaitForChild("LowerTorso")
        local rightFoot = character:WaitForChild("RightFoot")
        local rightHand = character:WaitForChild("RightHand")
        local rightLowerArm = character:WaitForChild("RightLowerArm")
        local rightLowerLeg = character:WaitForChild("RightLowerLeg")
        local rightUpperArm = character:WaitForChild("RightUpperArm")
        local rightUpperLeg = character:WaitForChild("RightUpperLeg")
        local upperTorso = character:WaitForChild("UpperTorso")
    
        
        local Joints = {
            ["Torso"] = rootPart:FindFirstChild("RootJoint"),
            ["Head"] = head:FindFirstChild("Neck"),
            ["LeftUpperArm"] = leftUpperArm:FindFirstChild("LeftShoulder"),
            ["RightUpperArm"] = rightUpperArm:FindFirstChild("RightShoulder"),
            ["LeftUpperLeg"] = leftUpperLeg:FindFirstChild("LeftHip"),
            ["RightUpperLeg"] = rightUpperLeg:FindFirstChild("RightHip"),
            ["LeftFoot"] = leftFoot:FindFirstChild("LeftAnkle"),
            ["RightFoot"] = rightFoot:FindFirstChild("RightAnkle"),
            ["LeftHand"] = leftHand:FindFirstChild("LeftWrist"),
            ["RightHand"] = rightHand:FindFirstChild("RightWrist"),
            ["LeftLowerArm"] = leftLowerArm:FindFirstChild("LeftElbow"),
            ["RightLowerArm"] = rightLowerArm:FindFirstChild("RightElbow"),
            ["LeftLowerLeg"] = leftLowerLeg:FindFirstChild("LeftKnee"),
            ["RightLowerLeg"] = rightLowerLeg:FindFirstChild("RightKnee"),
            ["LowerTorso"] = lowerTorso:FindFirstChild("Root"),
            ["UpperTorso"] = upperTorso:FindFirstChild("Waist"),
        }
    
        
        if character:FindFirstChild("Humanoid") and character.Humanoid:FindFirstChild("Animator") then
            character.Humanoid.Animator.Parent = nil
        end
        if character:FindFirstChild("Animate") then
            character.Animate.Enabled = false
        end
    
        local NeededAssets = game:GetObjects("rbxassetid://" .. AnimationID)[1]
        local TweenService = game:GetService('TweenService')
        local speed = 55
        CurrentAnimationID = AnimationID
    
        
        while AnimationActive do
            if StopAnim then
                AnimationActive = false 
                break
            end
        
            local keyframes = NeededAssets:GetKeyframes() 
            for ii, frame in pairs(keyframes) do
                if StopAnim then break end
                
                
                local duration = keyframes[ii + 1] and keyframes[ii + 1].Time - frame.Time or task.wait(1 / 120)
                duration = duration / (R15animationSpeed / 0.65) 
    
                if keyframes[ii - 1] then
                    task.wait((frame.Time - keyframes[ii - 1].Time) * (R15animationSpeed / 0.65)) 
                end
    
                for _, v in pairs(frame:GetDescendants()) do
                    if Joints[v.Name] then
                        TweenService:Create(Joints[v.Name], TweenInfo.new(duration), {Transform = v.CFrame}):Play()
                    end
                end
            end
            task.wait(1 / 120)
        end
    end)
    
    local MarketplaceService = game:GetService("MarketplaceService")
    
    local r15AnimationList = {
        
    }
    
    local animationNames = {}
    local animationMap = {}
    
    
    for _, animationId in ipairs(r15AnimationList) do
        local success, productInfo = pcall(MarketplaceService.GetProductInfo, MarketplaceService, animationId)
    
        if success then
            table.insert(animationNames, productInfo.Name)
            animationMap[productInfo.Name] = animationId  
        else
            print("Error fetching animation info for ID " .. animationId .. ": " .. tostring(productInfo))
        end
    end
    
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    
    local currentAnimation = nil
    local SavedAnimationsFile = {}
    local SavedAnimationsFileValues = {}
    local dropdownOptions = {}

    local function saveConfig()
        if isfile("HaxterFelix/R15Animations.txt") then
            delfile("HaxterFelix/R15Animations.txt")
        end
    
        writefile("HaxterFelix/R15Animations.txt", HttpService:JSONEncode(SavedAnimationsFile))
    end
    
    if not isfile("HaxterFelix") then
        makefolder("HaxterFelix")
    end
    
    local ValuesOfR15Animations = {}
    
    function loadConfig()
        local configPath = "HaxterFelix/R15Animations.txt"
        local defaultConfig = {
            SavedAnimationsFile = {},
            ValuesOfR15Animations = {}
        }
    
        if isfile(configPath) then
            local fileContent = readfile(configPath)
            
            local lines = {}
            for line in fileContent:gmatch("[^\r\n]+") do
                table.insert(lines, line)
            end
    
            
            for _, line in ipairs(lines) do
                local animID, name = line:match("^(%d+) = (.+)$")
                if animID and name then
                    SavedAnimationsFile[tonumber(animID)] = name
                    ValuesOfR15Animations[name] = tonumber(animID)
                end
            end
    
            for _, name in pairs(SavedAnimationsFile) do
                table.insert(dropdownOptions, name)
            end
        else
            
            SavedAnimationsFile = defaultConfig.SavedAnimationsFile
            ValuesOfR15Animations = defaultConfig.ValuesOfR15Animations
            print("Configuration file created with default values.")
        end
    end
    
    
    function selectAnimation(id)
        local animationName = SavedAnimationsFile[id]
        if animationName then
            print("Selected Animation ID: " .. id)
            print("Animation Name: " .. animationName)
        else
            print("Animation not found.")
        end
    end
    

    
    loadConfig()

R15:CreateButton("Save Animation", function()
    local animationID = CurrentAnimationID
    local animationName = MarketplaceService:GetProductInfo(animationID).Name

    if animationID and animationName and not ValuesOfR15Animations[animationName] then
        
        SavedAnimationsFile[animationID] = animationName
        ValuesOfR15Animations[animationName] = animationID

        
        local fileContent = ""
        for id, name in pairs(SavedAnimationsFile) do
            fileContent = fileContent .. id .. " = " .. name .. "\n"
        end
        writefile("HaxterFelix/R15Animations.txt", fileContent)

        print("Animation saved: " .. animationID .. " - " .. animationName)

        
        for name, value in pairs(ValuesOfR15Animations) do
            print("Saved Animation: " .. name .. " = " .. value)
        end
    else
        print("Animation already saved or invalid.")
    end
end)
R15:CreateButton("Stop Animation", function(StopAnimation)
    if not R15reanimated then 
        Message("Error:", "Please Reanimate", 5)
        return 
    end
    if not AnimationActive then 
        Message("Error:", "No Animation Playing", 5)
        return 
    end
    AnimationActive = false
    StopAnim = true
    local Animator = Instance.new('Animator', plr.Character.Humanoid)
    wait(0.05)
    plr.Character.Animate.Enabled = true
end)

local BuiltInAnimationsR15 = {
    ["bust a move"] = 15120502730,
    ["Dice"] = 14846465116,
    ["Agassy"] = 15569359960,
    ["Wa Da Da"] = 17590216758,
    ["Samsara"] = 17483159067,
    ["fundy jig"] = 10724859471,
    ["chikiri bai bai"] = 140291985636707,
    ["Sugar Rush Ride"] = 16817943406,
    ["Vapu Vapu"] = 16995605441,
    ["surfin' Bird (Peter griffin dance)"] = 130091927678906,
    ["Simpa V2"] = 12453892230,
    ["scenario"] = 8924083749,
    ["Bhangra Boogie"] = 108017084992975,
    ["Raining Tacos"] = 18996306719,
    ["Kaito Is An Alien"] = 18829447419,
    ["Sheesh"] = 16987826572,
    ["Tra Tra"] = 18231426297,
    ["Americano"] = 8601286610,
    ["Shoot!"] = 15954541522,
    ["YooHoo"] = 15795602834,
    ["Sickick Mind Games"] = 115672975245116,
    ["bubble gum 1 new jeans"] = 18331822907,
    ["Silent Hacker"] = 16826813658,
    ["Round 6"] = 86785215843177,
    ["NA"] = 131666011040524,
    ["goofy goober"] = 73981202280803,
    ["Drop It Like It's Hot"] = 15178362342,
    ["Hush Rush"] = 17743368730,
    ["GGUM"] = 131137139811722,
    ["Killing Me"] = 15926567988,
    ["Horizon"] = 16906389402,
    ["Endless Flow"] = 99816916718811,
    ["California Girls"] = 125389830710791,
    ["Typa Girl"] = 15786367515,
    ["Slide Now Now"] = 8230248004,
    ["bumble bee"] = 13964477190,
    ["Springy"] = 133890078327190,
    ["hug me more"] = 7042423417,
    ["Moongazer"] = 135064031952812,
    ["Hope"] = 15511861196,
    ["Starship ( nicki minaj )"] = 17598989892,
    ["Puppet Show"] = 15437172661,
    ["The Girls II"] = 14950069955,
    ["Smooth Criminal V2"] = 18402405089,
    ["More & More"] = 15957779312,
    ["POP!"] = 15954524008,
    ["Macarena"] = 8917320260,
    ["Money trees"] = 14458875200,
    ["BrooklynBloodPop!"] = 15309391511,
    ["Kitty Cat MEME"] = 18121561293,
    ["Boney Bounce"] = 83470324180522,
    ["Hate Rodrigo"] = 14758497233,
    ["Planetary"] = 109054885000137,
    ["Tyla Dance"] = 18218681238,
    ["Entranced"] = 18950264768,
    ["Poker Face II"] = 18710870010,
    ["oddloop"] = 18715249701,
    ["Funk do bounce"] = 132545638708993,
    ["Cash Dance"] = 7041113269,
    ["The Dogg"] = 108340529144175,
    ["Stranger"] = 16121568289,
    ["Loco"] = 14950828704,
    ["Cuff It ( Beyonce )"] = 11115365773,
    ["WiggleWiggle"] = 17439999314,
    ["calm down"] = 88277560473596,
    ["Make A Wish"] = 9355351062,
    ["Shawn Stitches"] = 130634896001082,
    ["5sec Youngblood"] = 109971524835248,
    ["I'm Bad"] = 18766790249,
    ["Money"] = 15088152079,
    ["Poppin' Shakin'"] = 17171828067,
    ["maria hwasa"] = 15489358017,
    ["to the beat"] = 18553190141,
    ["Brooklyn pop"] = 17244348290,
    ["Go Mufasa (Fortnite)"] = 134887103409831,
    ["Not A Devil"] = 125983101461360,
    ["crank that"] = 7974313986,
    ["Bang"] = 15879246434,
    ["workit"] = 9395049509,
    ["Shut Down"] = 16817391887,
    ["How That Taste"] = 18651813895,
    ["Drive Me Crazy"] = 17353959998,
    ["Magnetic"] = 17078018782,
    ["Slum Anthem II"] = 17744858894,
    ["Shout"] = 16906627656,
    ["All Night"] = 16491251704,
    ["Heart 111"] = 18399954129,
    ["How You Like That II"] = 14204478463,
    ["I Am"] = 14758520223,
    ["Exclusive"] = 17068780580,
    ["LALISA"] = 15101980014,
    ["Mesmerizer (Miku) (TT Ver.)"] = 17640486421,
    ["Oh Shhh"] = 137052510169731,
    ["laid back shuffle"] = 8791067671,
    ["jerk off"] = 85510928563896,
    ["entranced"] = 18442013842,
    ["Ta Ta Ta 2"] = 91368017589759,
    ["More"] = 15926531281,
    ["Moonlight"] = 14360382400,
    ["Oka Ramman"] = 17753542254,
    ["Weird ass breakdancing"] = 7070158948,
    ["Korean Cheerleader"] = 18829377057,
    ["Fearless"] = 9604542135,
    ["reanimated"] = 16698541440,
    ["I Like It"] = 17672349928,
    ["Kitsch"] = 15957486812,
    ["Waka Waka"] = 13431512360,
    ["Suki Suki Suki"] = 18946025428,
    ["Starry Night"] = 82009339442151,
    ["Ageage Again Hatsune Miku"] = 18268996078,
    ["Gum"] = 15319042831,
    ["Waka Waka V2"] = 15381915476,
    ["I'm not cool"] = 16671546299,
    ["See you again (Alt Intro)"] = 80273071705993,
    ["Leat Nya Arigato2"] = 138814469709630,
    ["laugh it up (fortnite)"] = 7728179704,
    ["Koi Dance"] = 18723607032,
    ["Push ups"] = 16069644453,
    ["Queencard"] = 14390206440,
    ["APTs"] = 108794829512642,
    ["Perfect Score"] = 139292073803836,
    ["Best Mates"] = 16438166755,
    ["Ashley, look at me!"] = 14372384250,
    ["Summer"] = 13270529922,
    ["trance"] = 13461610584,
    ["mufasa"] = 8459864580,
    ["get Sturdier"] = 137959340008695,
    ["Ring x Ring"] = 15507689525,
    ["ASAP"] = 9183680092,
    ["keep up"] = 80586234339889,
    ["Shake it off"] = 18952701833,
    ["Pumba Pumba"] = 18348715399,
    ["Griddy"] = 8916572099,
    ["The Eve"] = 15314740242,
    ["Smeeze"] = 16590977782,
    ["Coffin"] = 79063099216179,
    ["Japanese Phonk"] = 18862724630,
    ["The Dance LAROI"] = 75239905741750,
    ["small swastika"] = 93170225110433,
    ["Pandora"] = 15995791226,
    ["Get It"] = 15710919135,
    ["mysterious game (W)"] = 17742094115,
    ["Gyatt For Nerizzler"] = 18845819589,
    ["Spicy"] = 14230856023,
    ["Hype Boy"] = 14690505486,
    ["feeling"] = 15726185881,
    ["Shimmer ( fortnite )"] = 16395739858,
    ["beat it mj"] = 13842485756,
    ["Halloween Beast"] = 12540868623,
    ["Prince of Egypt"] = 107105561095138,
    ["Lojay Monalisa"] = 109905892550009,
    ["Bizcochito"] = 14569032479,
    ["million dollar baby"] = 114436352552828,
    ["2Pac Want it"] = 78088451215023,
    ["I Have Nothing To Say"] = 18725268714,
    ["Be Gone"] = 18552943923,
    ["WORM"] = 7160307855,
    ["bird surf"] = 13350319593,
    ["Pink Venom"] = 14360487641,
    ["head banger (fortnite)"] = 117390128696430,
    ["the dogg"] = 91400732124578,
    ["Back It Up"] = 18846379978,
    ["Betty ( Young Gravy )"] = 14708830118,
    ["Double Team"] = 18125445041,
    ["Rage"] = 9460050005,
    ["SG"] = 9715503915,
    ["tidy"] = 6657942302,
    ["big swastika ( Use Inf15Thin )"] = 94631359696320,
    ["Dolphin"] = 15634547372,
    ["Miley"] = 71785961342293,
    ["Look At Me"] = 17069753179,
    ["Galileo"] = 15254328512,
    ["Da Da Da II"] = 18546573714,
    ["WAIT LOVE ME LIKE I LOVE YOU"] = 113197266804415,
    ["Brotherswing"] = 17077991948,
    ["Move"] = 17831074021,
    ["California Love"] = 138556155553928,
    ["Nomi BLAH"] = 76529954844846,
    ["Pop like this"] = 18319061287,
    ["73951437995752 = soar above 8 bit shuffle"] = 96286540144205,
    ["Shape of you"] = 12626260779,
    ["the gmod dance"] = 6724020367,
    ["Me Too Meghan Trainor"] = 75314008595895,
    ["drip baby monster"] = 76921735783226,
    ["mewing"] = 16407490278,
    ["Chk Chk Boom 2"] = 89053989634034,
    ["Beautiful Liar"] = 17831045411,
    ["bloodpop"] = 7059119363,
    ["Baby II"] = 18209522583,
    ["worm"] = 7160307855,
    ["Boney Bounce ( Imagine Dragons )"] = 18523013797,
    ["Pantropiko x Day & Night"] = 18332625539,
    ["MTG Last Night"] = 18218852741,
    ["ENOUGH!"] = 17102029049,
    ["Swag Beat"] = 115733505136871,
    ["Easter Bunny"] = 16906355065,
    ["I Like To Move It"] = 127449912339458,
    ["Alcohol Free"] = 15507151401,
    ["La Mama"] = 18445553677,
    ["nya arigato"] = 16038410193,
    ["Cha Cha Cha"] = 15051520958,
    ["9mm ( Memphis Cult )"] = 18319003563,
    ["Ai Ai Ai Mega Prince"] = 18125672887,
    ["The Idol"] = 14709052794,
    ["bachata"] = 17506547188,
    ["Say So"] = 14034144806,
    ["Boombayah"] = 15254273286,
    ["Let Me See You"] = 17744917114,
    ["Let It Out"] = 11822727177,
    ["sturdy"] = 13688011089,
    ["Lazer Blast"] = 107994227175066,
    ["Alibi"] = 18125236590,
    ["Don't Stop"] = 15319061382,
    ["Hold On Tight"] = 16020395771,
    ["KEEP UP"] = 80586234339889,
    ["what u waiting for"] = 14365221876,
    ["NTTL"] = 93580979672065,
    ["Pump It Up"] = 107556241253371,
    ["Amaarae Luv Money"] = 122157693129395,
    ["Big Boy ( SZA )"] = 12293673630,
    ["limbo (full dance)"] = 120733760127293,
    ["bibi fogosa"] = 18946055933,
    ["Ringo"] = 14977014999,
    ["Sturdy"] = 137959340008695,
    ["Shooting Stars"] = 12871295658,
    ["culture festival dance"] = 14905552064,
    ["walking on a dream"] = 11771777726,
    ["Jelebi Baby"] = 17510005422,
    ["wepa"] = 120150910792279,
    ["Classic ( MKTO )"] = 11132358957,
    ["Electro Shuffle"] = 9116910876,
    ["Alien Alien Hastune Miku"] = 18264990211,
    ["Rockabye"] = 18724951218,
    ["no pole"] = 77504522238611,
    ["teach me how to dougie"] = 7619764422,
    ["Arona"] = 116975656514108,
    ["Converse High"] = 15569468810,
    ["Unforgiven"] = 14354058855,
    ["Swalla"] = 18740808703,
    ["nasty girl"] = 18148041233,
    ["Malatanghulu2"] = 106868003915523,
    ["Pocket Locket"] = 128618231080047,
    ["Jumpshot"] = 98925895870667,
    ["move ya body"] = 109551168484965,
    ["Candy Pop"] = 15954541522,
    ["bye bye bye"] = 74459902656965,
    ["Marikit Sa Dilim"] = 16906666026,
    ["Crazy"] = 17353843330,
    ["Chihiro MTG"] = 18148386362,
    ["egg dance ( acu saya)"] = 14765075073,
    ["backshots"] = 107788763755159,
    ["Fast Forward"] = 15103490862,
    ["Boom Pow"] = 14458113330,
    ["push 2 start"] = 121825287394407,
    ["Spring Day"] = 16582791937,
    ["Swastika"] = 93170225110433,
    ["Triste com T"] = 124604199171592,
    ["kehlani"] = 114471402037782,
    ["Popular (The Weeknd)"] = 15643535842,
    ["Lovesick Girl"] = 14337920126,
    ["Cure For Me"] = 16995704851,
    ["Long Way 2 Go"] = 16989628401,
    ["just dance"] = 11456890837,
    ["SKZ Giant"] = 82086620169755,
    ["Netflix Mingle"] = 138292957837319,
    ["Ditto"] = 14306647474,
    ["Flowers"] = 14360321360,
    ["Happy Dog"] = 110780464467650,
    ["Apple Dance 2"] = 18946844622,
    ["Miku Live"] = 106824740739069,
    ["caffeinated"] = 94939091699336,
    ["Neko Kaburi Na"] = 18835807145,
    ["shower"] = 16119477663,
    ["Boom Pow V2"] = 117311939807627,
    ["embrace it"] = 72117290471362,
    ["SturdyV2"] = 137959340008695,
    ["As Long As You Huat"] = 18998207468,
    ["hug"] = 113001288211277,
    ["not my problem"] = 102637131613028,
    ["move it"] = 16040069769,
    ["pump up the jam v2 (fortnite)"] = 7932729883,
    ["Wannabe II"] = 14908291589,
    ["Steady (fortnite)"] = 16998593072,
    ["Outlaw"] = 82746341617847,
    ["Poki"] = 18975457695,
    ["phon hon"] = 7350048609,
    ["Hatsune Miku (Not a Devil)"] = 15648765742,
    ["lia kim (In For It (XODDIAC Remix))"] = 8111230734,
    ["Baddie"] = 15254578171,
    ["Arona Dance ( Justin Timberlake )"] = 116975656514108,
    ["Armageddon"] = 18863495250,
    ["gta dance"] = 18743035691,
    ["Timber ( Nightcore )"] = 95495006115572,
    ["Texas Hold' Em"] = 16625502258,
    ["TOMBOY"] = 17558055394,
    ["Maria"] = 16302946151,
    ["Buss It"] = 17745190428,
    ["Car Shearer"] = 12540702251,
    ["Problem2"] = 102637131613028,
    ["Like OOH AHH"] = 15711239792,
    ["Impurities"] = 15252093658,
    ["Sigma Boy"] = 92757660068329,
    ["Markiplier"] = 17101949137,
    ["Dumb Dumb"] = 15747119564,
    ["SLIM SHADY"] = 18553150120,
    ["world revolve"] = 13830784695,
    ["back on 74 static loop"] = 16928174772,
    ["Veggie"] = 132295464457565,
    ["Don't Go Insane"] = 18336940634,
    ["DEEP"] = 14456866502,
    ["Kashii Cat Loving"] = 126746495297624,
    ["Leapin'"] = 16768403667,
    ["SÃ£o Amores"] = 18952949480,
    ["Ding Dong Song"] = 18246278810,
    ["It Won't Kill Ya"] = 17746371710,
    ["Fast Feet"] = 80217482934917,
    ["Dancing King"] = 15710689397,
    ["cumbia"] = 17027401228,
    ["out west"] = 18553123644,
    ["Accendio"] = 17659639868,
    ["Starlift"] = 18532446643,
    ["crackdown"] = 11963139897,
    ["WAKA WAKA V2"] = 15381915476,
    ["IDOL"] = 104706018817755,
    ["Lo fi"] = 96519329274556,
    ["caramelldansen"] = 11537222385,
    ["See Me In A Crown"] = 18973179163,
    ["Boogie Down"] = 18552972055,
    ["planetary vibe ( fortnite?)"] = 109054885000137,
    ["Smack Yo"] = 131474670923668,
    ["Ride It"] = 6863561770,
    ["Lucky Girl Syndrome"] = 17518983536,
    ["The Girls"] = 14745099838,
    ["hugo"] = 18502971000,
    ["get into it"] = 87699422365632,
    ["Mirotic"] = 17362134841,
    ["poppy love (Automotivo Xm, Taka Taka Taka TÃ¡)"] = 16114220538,
    ["empty pockets"] = 92704844080002,
    ["Toothless dance"] = 16214133435,
    ["Big Dawgs"] = 84090608993841,
    ["Conga"] = 11671788551,
    ["bring it around"] = 120219890159884,
    ["GANGNAM STYLE"] = 18553011864,
    ["Bye Bye Bye TTVer. NCYNC"] = 85224768751872,
    ["Stronger"] = 16827186637,
    ["Boogie Bomb"] = 13911360811,
    ["conga 2"] = 91965031391808,
    ["Jubi Slide Slick Back"] = 107444119659023,
    ["Point and Strut"] = 18532500355,
    ["Candy ( Doja Cat )"] = 11376739013,
    ["Attraction"] = 73737524314910,
    ["Igaku"] = 16922809079,
    ["Bad Reputation"] = 17772959723,
    ["Blanktape Turuan"] = 132716888916327,
    ["swaysway"] = 16455261259,
    ["kazotsky kick"] = 14053223573,
    ["Dimensional"] = 105194991903514,
    ["electro shuffle"] = 9116910876,
    ["Oh my god"] = 17509688608,
    ["Stuck ( Cardi B )"] = 17450628542,
    ["pretty girls walk like this"] = 130360947990784,
    ["KISS"] = 17769582250,
    ["Me (Rap)"] = 16121871257,
    ["djlox Throat"] = 84405181207305,
    ["Shake That Brass"] = 17591333595,
    ["Bibi Fogosa"] = 18946055933,
    ["Attention"] = 15786493717,
    ["Element"] = 18995977824,
    ["Tinnitus"] = 13539158026,
    ["Call me maybe!"] = 15712992592,
    ["Big Dwags"] = 84090608993841,
    ["werk it"] = 101390058814762,
    ["Mc Chicken Dance"] = 14709031676,
    ["Chili"] = 15306601096,
    ["Did it first"] = 104924566284253,
    ["Company Jig"] = 18319231655,
    ["TT"] = 16492220339,
    ["Snake Groove"] = 92227709240709,
    ["bad romance"] = 8224425641,
    ["Poppy"] = 14913019144,
    ["Meme Funk"] = 18642062621,
    ["Walkin' Pretty"] = 114254689551646,
    ["ET"] = 17302883077,
    ["Albatraoz"] = 14888226433,
    ["How Sweet"] = 17846925892,
    ["Cake II"] = 14711370865,
    ["Nobody Knows"] = 17266485887,
    ["Say So Doja"] = 114695517684366,
    ["Chase Love Hard"] = 16214805483,
    ["Permission To Dance"] = 17659577567,
    ["did it first"] = 104924566284253,
    ["Untouchable"] = 17570890409,
    ["Like Crazy"] = 17243081974,
    ["Good Night Lady"] = 17589330422,
    ["Dream Of You"] = 15701655961,
    ["Orange Banana"] = 17589018491,
    ["la chona"] = 13344857664,
    ["Adios"] = 15183462851,
    ["shake it!"] = 18829181240,
    ["Stay Up"] = 124500473772133,
    ["lazerblast2"] = 9634449536,
    ["PAKU"] = 18648976965,
    ["It's Gonna Be Me"] = 17505818113,
    ["Airplane pt 2"] = 17175043979,
    ["untouchable"] = 17570890409,
    ["Hey Now"] = 15086241806,
    ["OMG"] = 14360424066,
    ["not my problem (TT Ver,)"] = 72370557332861,
    ["Theme song"] = 103889663436383,
    ["Ai no Uta (Love Song Hatsune Miku"] = 15840094536,
    ["Fast Flex"] = 110332761819297,
    ["Blue Bood"] = 17437097964,
    ["Runaway"] = 16927669445,
    ["Igloo"] = 72705631233287,
    ["JJ Lin No Money"] = 99637974405359,
    ["duranguense"] = 18605670236,
    ["conga2"] = 14053147989,
    ["Don't Worry"] = 17744212701,
    ["Talk Dirty"] = 14840663266,
    ["Fancy"] = 15254438022,
    ["Filter"] = 15769956533,
    ["El gatito tuyo te perdio"] = 18347159703,
    ["Top Or Cliff"] = 15109594086,
    ["MariahC Want 4 xmas"] = 15569415780,
    ["shift (Government Hooker)"] = 11537224630,
    ["Love Shot"] = 15042011356,
    ["Goated"] = 18969257806,
    ["Ma Ma Ma II"] = 18846154606,
    ["Muerto Gang"] = 14629614834,
    ["Tuca Tuca"] = 18443210308,
    ["Real Slim Shady"] = 101228736701257,
    ["Uptown Funk"] = 17669452796,
    ["Alibi III"] = 18639586999,
    ["Next Level"] = 73666718896602,
    ["BELLAKEO"] = 17837503282,
    ["Kuru Kuru Kururin"] = 18848216027,
    ["Snake"] = 9604765491,
    ["Skidibi V2"] = 16757369666,
    ["waiting for love"] = 72053710295476,
    ["Rude Boy V2"] = 16827397883,
    ["Grl Gvng"] = 15314684858,
    ["Guerrilla"] = 15427967206,
    ["No Speak Americano"] = 18536691886,
    ["JAYWALKING (Fortnite)"] = 10970927618,
    ["Drop in"] = 16354653832,
    ["Did It First"] = 104924566284253,
    ["Back On 74"] = 108088087568172,
    ["El Alfa ESTE"] = 138723007840035,
    ["bood up groove2"] = 124488874502945,
    ["Tap Out"] = 134470031827136,
    ["Fingertip"] = 15710794282,
    ["Last Forever"] = 18863701920,
    ["Brites Moves"] = 18950197254,
    ["Moonlit"] = 81834617503414,
    ["Waiting for love"] = 72053710295476,
    ["Bounce When She Walks"] = 14450671075,
    ["MAITAKE"] = 93130440754306,
    ["Hiiragi Tetoris"] = 125058040803530,
    ["Cheshire"] = 14845155835,
    ["Red1"] = 105435600557305,
    ["Typa Girl (Intro)"] = 14690394983,
    ["Crab Rave"] = 16754281220,
    ["RinV Good"] = 97064449863633,
    ["Me too"] = 15095641158,
    ["never gonna"] = 8987754704,
    ["fresh"] = 9116897929,
    ["Pull Up (Fortnite)"] = 16067281468,
    ["Snoop Walk"] = 132477655284495,
    ["Tobii Bad Girls"] = 85827618059547,
    ["Hana"] = 86261625089100,
    ["1001 Night ( chipz )"] = 11788695409,
    ["Bad Guy1"] = 77288355613525,
    ["Eunoia"] = 13006438318,
    ["Rockstar (Pull Up)"] = 14214317091,
    ["barbi"] = 14340896214,
    ["The Posh Boy"] = 17591075030,
    ["Line Dance (Cowboy Style)"] = 132677020616387,
    ["World"] = 15178283482,
    ["APT"] = 133626763080954,
    ["Talk That Talk"] = 15053175546,
    ["HEYA"] = 17439113373,
    ["walking on water stray kids"] = 115841027119899,
    ["the dance laroi"] = 75239905741750,
    ["just know"] = 72713542992987,
    ["I'm Out"] = 112938518545551,
    ["Love Kyun Wanted"] = 18711007163,
    ["Cake"] = 14758473677,
    ["Your Number"] = 18953075358,
    ["Barbi"] = 14340896214,
    ["Wannabe"] = 14837825883,
    ["renai circulation"] = 14881809061,
    ["PC24"] = 87214454379601,
    ["Gigantic O.T.N"] = 17509790527,
    ["jumpstyle"] = 127818220981023,
    ["Make Me"] = 140183892184019,
    ["WaveWay"] = 124625882154906,
    ["Rabbit Hole"] = 17080368789,
    ["moster mash (judas)"] = 11537307923,
    ["Tyler Sticky2"] = 134909729564479,
    ["SeanK Beat It"] = 72963340508086,
    ["Work remix ( A2AP Ferg )"] = 17569379378,
    ["Feelin' Jaunty (Fortnite)"] = 136570900168732,
    ["How Sweet pt2"] = 18331463874,
    ["HIP"] = 17832633275,
    ["Line Dancin"] = 101369357281876,
    ["alors on danse"] = 9331423748,
    ["Bumblebee"] = 13834565433,
    ["GTA Dance"] = 18743035691,
    ["str8 geeked"] = 17517363640,
    ["Two Of Hearts"] = 17755576058,
    ["Build a B ( Bella Poarch )"] = 9486452377,
    ["jabbaswitchaway"] = 8229514367,
    ["Don No Pole"] = 77504522238611,
    ["Hey Ho"] = 17669297584,
    ["Rose"] = 12977552708,
    ["Stay"] = 12792347172,
    ["JT SwagBack"] = 95939066860595,
    ["Ring The Alarm"] = 15104827793,
    ["Splash Damage"] = 18995334538,
    ["Pose"] = 15437793544,
    ["lazer blast"] = 9634449536,
    ["Smooth Criminal"] = 8036951540,
    ["dancin domino"] = 16225686844,
    ["fishin (fortnite)"] = 7305746986,
    ["Tiramisu Cake"] = 18400161233,
    ["fin dance"] = 7345196641,
    ["xaviersobased gyroscopic chicken dance"] = 101026742303947,
    ["Baam"] = 16826181626,
    ["You Right"] = 17831711725,
    ["Hammer Time"] = 17589891310,
    ["Red Lights1"] = 79483595485043,
    ["Been Like This"] = 18740994665,
    ["SequÃªncia ColocadÃ£o"] = 17512666760,
    ["Social Path"] = 14950111063,
    ["Dancin"] = 9716509653,
    ["To the Beat"] = 87827626059676,
    ["Scream & Shout II"] = 16827533892,
    ["Fucking Running ðŸ”¥"] = 12712457641,
    ["GTA"] = 18743035691,
    ["apple pie"] = 105838805709195,
    ["Run"] = 91085526067649,
    ["Stupid In Love"] = 16995583000,
    ["Don't Talk To Me"] = 17598993954,
    ["Crank That"] = 18605306382,
    ["Jubi Slide"] = 98252061243403,
    ["Gasolina"] = 15052732044,
    ["About Damn Time ( Lizzo )"] = 14881386891,
    ["ill show you kda"] = 17493553085,
    ["Heel Click Breakdown"] = 18441999758,
    ["JJAM"] = 128058242953208,
    ["Midas Touch"] = 17362739079,
    ["Speed"] = 92687809152911,
    ["Charmer"] = 14456520068,
    ["Boss Bitch Doja (Short)"] = 119148916755003,
    ["Shake It Off"] = 18952701833,
    ["Maps"] = 138580335785363,
    ["I Wanna Be Your follower"] = 18641984949,
    ["Toosie Slide"] = 135788271145619,
    ["Night Out"] = 93771723828849,
    ["Oki Doki"] = 18993544375,
    ["Baby Don't Stop"] = 15086711293,
    ["Chicken Noodle Soup"] = 17446635891,
    ["Sheâ€™s From The Island"] = 17494079141,
    ["Breakthrough"] = 15710888621,
    ["Pop Like This"] = 18319061287,
    ["Young, Dumb, Stupid"] = 17266568423,
    ["youwantme"] = 8548895795,
    ["banana shake"] = 12458775009,
    ["Wednesday"] = 18766885785,
    ["Kill This Love 2"] = 16491833044,
    ["LeeHi HSKT"] = 121450977838587,
    ["rambunctious"] = 6955675746,
    ["hana"] = 11605072407,
    ["moongazer cafune"] = 135064031952812,
    ["who can it be now"] = 16668959434,
    ["Before U Go"] = 17353745726,
    ["Ui Mugibatake"] = 18147252039,
    ["Easy"] = 16755161447,
    ["INVU"] = 14709181461,
    ["Twerk"] = 77493234914180,
    ["Fright Funk1"] = 83544638023597,
    ["DDARA"] = 15745877593,
    ["finally 18"] = 15292484958,
    ["I Love My Body"] = 15044170099,
    ["Incredible"] = 17835044374,
    ["feeling lonely"] = 13854287308,
    ["Chicken Wing"] = 82157263166422,
    ["Champ's Clap"] = 18995451918,
    ["Doodle"] = 84463413551540,
    ["Dancin' Domino"] = 18522791385,
    ["Happy (Prod. Hedyy)"] = 18953456970,
    ["lalalala stray kids"] = 15806620298,
    ["milkshake"] = 14881128373,
    ["Wanna See Me"] = 132796690293567,
    ["BM WithSmile"] = 111205373680745,
    ["SWAG"] = 17741857313,
    ["Log in"] = 16669666941,
    ["Jump Around"] = 16987855733,
    ["Deep Explorer"] = 99986218616988,
    ["His & Hers"] = 109871383329975,
    ["Tacaca"] = 17669244192,
    ["Eve, Psyche & BW"] = 14143553486,
    ["floss"] = 9003921069,
    ["Circus Britney (Short)"] = 100087145914191,
    ["In My Bed"] = 111991313205546,
    ["ride the pony (fortnite)"] = 9848532804,
    ["Nobody"] = 15504654082,
    ["NINA Move Ya Body"] = 109551168484965,
    ["A Bar Song"] = 103000564408232,
    ["Bass Knight"] = 18236720385,
    ["Sheesh II"] = 17439802258,
    ["Bonde De Brunao"] = 123070087437440,
    ["MANTRA blackpink"] = 89669748199039,
    ["My Name V"] = 10783558665,
    ["Blast Move"] = 80025649457203,
    ["Seven 2"] = 16817182259,
    ["Cold Out"] = 90779822053049,
    ["goated"] = 18969257806,
    ["Better Things"] = 16423848646,
    ["Lion"] = 15178359180,
    ["Anpanman"] = 15507627471,
    ["Toca Toca"] = 14455340647,
    ["Russian Roulette"] = 16388655889,
    ["After Hours"] = 105935327122803,
    ["Shimmy Wiggle"] = 76082795493886,
    ["Take it Slow"] = 100551198874005,
    ["Fire"] = 10297929371,
    ["Tenge Tenge"] = 17069865343,
    ["spiderman"] = 8228461600,
    ["Ninja Re Bang Bang"] = 17736411198,
    ["My Bag"] = 15996204502,
    ["raise the roof"] = 14053240024,
    ["Slay"] = 14811111697,
    ["Anima Power"] = 18959257871,
    ["STICKY"] = 75744468276459,
    ["Wannabe space girls smooth"] = 14837825883,
    ["Mask Off (Fortnite)"] = 77901877634801,
    ["Love Me Like I Love You"] = 113197266804415,
    ["Cry For Me"] = 14958064290,
    ["billy bounce (fortnite)"] = 8917595127,
    ["Not My Problem"] = 102637131613028,
    ["payaso de rodeo"] = 12545258777,
    ["Can't Hold Us"] = 16754380841,
    ["no lie"] = 16004945481,
    ["all for you"] = 10593714954,
    ["Scientist"] = 15957626186,
    ["Daddy"] = 17753228224,
    ["water"] = 98024014077951,
    ["wavy"] = 11528196432,
    ["UP&DOWN"] = 17830998987,
    ["ZOO"] = 14287825206,
    ["Heel Click"] = 18863706004,
    ["alibi pt 3"] = 18639586999,
    ["So Hot"] = 15706683049,
    ["Smart"] = 16925912001,
    ["DominÃ³"] = 17842534573,
    ["Baby Mama"] = 99110766306643,
    ["all night"] = 12201164828,
    ["smeeze"] = 18553199244,
    ["CRAZY 2"] = 79445566802891,
    ["love it"] = 15319267118,
    ["9mm"] = 18319003563,
    ["lazerblast"] = 8673553968,
    ["McDonalds at 3am in the morning ðŸ¤¯"] = 7248304620,
    ["The Dip"] = 129512349496854,
    ["TGIF"] = 15044143466,
    ["POP STARS kda"] = 14640336821,
    ["Fierce Swag"] = 102877697069779,
    ["Thrift Shop"] = 16753653616,
    ["Crazy Over You"] = 16302880378,
    ["oops i did it again"] = 7975459663,
    ["Goodies"] = 134586304179871,
    ["My Pace"] = 16089778475,
    ["One More Time"] = 15316785104,
    ["kiss me more (full dance)"] = 94617877397435,
    ["GDRAGON POWER"] = 83561852796756,
    ["YOASOBI UNDEAD"] = 109658950870605,
    ["last forever"] = 14053226316,
    ["Mesmerizer (Teto) (TT Ver.)"] = 17640500579,
    ["Miruni"] = 87617771479225,
    ["0x1 = lovesong"] = 11453887849,
    ["Shake It Off Taylor Swift"] = 91466702175766,
    ["Side to Side Ariana"] = 89167567026358,
    ["Diva Beyonce (Short)"] = 82194151188683,
    ["Diva Beyonce TTVER (Short)"] = 97067183984361,
    ["Donatella Lady Gaga (short)"] = 82590597492786,
    ["Cupid Dance"] = 14458761918,
    ["BrunoM Bonde"] = 82716852623277,
    ["Beautiful Liar (Very Short Emote)"] = 122664841525078,
    ["Do Not Touch"] = 15428845859,
    ["Perfect Night"] = 15422072504,
    ["In Da Party"] = 81251164590970,
    ["TIKI TAKA"] = 17560001332,
    ["Eu Sento Gabu!"] = 17658071387,
    ["what you want"] = 95766349372405,
    ["Super Lady"] = 16302081447,
    ["raining tacos"] = 18996306719,
    ["September"] = 15111104059,
    ["sturdy v2"] = 11568745611,
    ["im diamond"] = 14053214985,
    ["The Silencer"] = 17089911412,
    ["go just go"] = 13990340012,
    ["CharlieP Dont Talk"] = 94461583739254,
    ["wanna see me"] = 113441681538430,
    ["Take The L"] = 16197768633,
    ["Sneakers"] = 12138500641,
    ["oki doki"] = 18993544375,
    ["Slide Stride"] = 140603204775430,
    ["GGBB"] = 14758568953,
    ["Just Dance"] = 14797592482,
    ["Umbrella"] = 17566237110,
    ["Fact Check"] = 16423407915,
    ["woo!ah!"] = 14690438699,
    ["Batter Up"] = 15553568636,
    ["Social Climber"] = 16827106432,
    ["good loyal thots"] = 17844752852,
    ["Bed Chem"] = 70614062353518,
    ["Impossible"] = 17589061583,
    ["cant take my eyes of you"] = 13681656916,
    ["Mysterious Game"] = 17742094115,
    ["The Renegade"] = 16067292716,
    ["The Boots"] = 17832398448,
    ["UP4"] = 117605822363146,
    ["cupid"] = 13830931839,
    ["DJHard Bashi Bashi"] = 115798738289130,
    ["Smooth Criminal II"] = 18402405089,
    ["Soatar"] = 16302177686,
    ["super shy pt 1"] = 18331640591,
    ["break free (full dance)"] = 121009670194194,
    ["Drunk Dazed"] = 15746942410,
    ["stay"] = 124384835195015,
    ["Pump it"] = 13842488942,
    ["kiss"] = 130415689601813,
    ["night out"] = 93771723828849,
    ["phonk music fr"] = 7232575007,
    ["Playing With Fire"] = 16995558532,
    ["34 35 Arana & Doja (Short)"] = 134549253904468,
    ["IVE Supernova Love"] = 136917630185596,
    ["Alibi ( Sevdaliza )"] = 18125236590,
    ["Meet at the next corner"] = 18648818158,
    ["smaSher Empurra"] = 137091690757651,
    ["Gucci Gucci"] = 18318203808,
    ["Dance The Night Away"] = 15437651094,
    ["That's what i like ( Bruno Mars )"] = 13025071715,
    ["starlit"] = 18532446643,
    ["Mash Up"] = 14649333000,
    ["Gangsta"] = 18133641617,
    ["Bad Remix"] = 16906283522,
    ["Heroes Tonight"] = 16927556629,
    ["SoMo 50Feet"] = 115380505264488,
    ["Prince Of Egypt"] = 16906415457,
    ["Having a Bath"] = 16995463809,
    ["Midnight Morning"] = 17080363745,
    ["flippin sexy"] = 7144733185,
    ["No Doubt"] = 16988711502,
    ["Super Shy"] = 15357058625,
    ["BBUSYEO"] = 9991485864,
    ["NEW WOMAN"] = 131721216910827,
    ["Sweet Crazy Love"] = 12977606310,
    ["Truth or Dare"] = 16988291254,
    ["Automotivo Satisfaction"] = 16986465327,
    ["rollie (fortnite)"] = 12386799815,
    ["JumpStyle"] = 17858431097,
    ["wednesday"] = 18766885785,
    ["laugh it up"] = 7728186360,
    ["Have You Seen My Bf"] = 17519408697,
    ["russian kick (kalinka)"] = 8749319208,
    ["Philly Goats Buckle Up"] = 91495711099103,
    ["I Win, You Lose"] = 17509887742,
    ["Clothes"] = 16827238817,
    ["monster shuffle"] = 9249757735,
    ["Dance therapy"] = 17753378250,
    ["Mine"] = 124492610127985,
    ["Made In Romania"] = 17759349644,
    ["Snoop's walk"] = 132477655284495,
    ["Slay Phonk"] = 17353600859,
    ["Hit Me Up"] = 17514363987,
    ["Just Know1"] = 72713542992987,
    ["conga1"] = 79002139027906,
    ["I Luv It"] = 17832763915,
    ["La Pepo"] = 18219213495,
    ["Safer"] = 18218538613,
    ["Dancing With A Stranger"] = 17598086026,
    ["My World"] = 16006724706,
    ["PR FERIR"] = 17843957556,
    ["Gangnam"] = 80398743560629,
    ["PTPOM"] = 16040382364,
    ["get started (Ð›ÐµÑ‚Ð¾)"] = 10734797398,
    ["Ai He"] = 18121645911,
    ["Empty Pockets ( Juice WRLD )"] = 92704844080002,
    ["Pirate"] = 9577608405,
    ["Float"] = 12256726178,
    ["Nasty"] = 18148041233,
    ["Rollie (fortnite) "] = 139528127590899,
    ["Embrace It"] = 72117290471362,
    ["Whiplash"] = 84761716541897,
    ["Baseline Bussiness"] = 18207659656,
    ["Let's Do It Again"] = 18121579426,
    ["Break Free Ariana (Short)"] = 121009670194194,
    ["7dnight Gwenchana"] = 133834197390854,
    ["like it to move it"] = 8669843909,
    ["Alibi II"] = 18319544101,
    ["Bouncing G5"] = 18210900028,
    ["orange justice"] = 11212163754,
    ["I I I"] = 18232085181,
    ["Bad Boy"] = 15959913476,
    ["WISE"] = 18238999192,
    ["Diamonds & Pearls"] = 18348287674,
    ["Qinghai Shake"] = 18443420661,
    ["YMCA"] = 13460810829,
    ["Blinding Lights (The Weekend)"] = 122487371511002,
    ["Toca Toca V2"] = 12916840571,
    ["5 20AM"] = 18441535557,
    ["Like A Rodeo"] = 18447913072,
    ["Roly Poly"] = 16120658006,
    ["Ain't Your Mama"] = 17830768930,
    ["Thirsty"] = 16906160228,
    ["Chihiro2"] = 134841267819107,
    ["Da Da Da Shuffle"] = 18546537798,
    ["zero two"] = 16010080310,
    ["peanut butter jelly time is"] = 5803901179,
    ["what you want prince of egypt"] = 95766349372405,
    ["Bust It Open"] = 17164318848,
    ["Poker face"] = 16753908131,
    ["Laufey from the start"] = 85444981015452,
    ["Darling"] = 18432613302,
    ["Dreams Come"] = 9249771813,
    ["Starlit"] = 18532446643,
    ["Don't talk anymore ( charlie puth )"] = 94461583739254,
    ["hustla"] = 139569192211929,
    ["sturdier"] = 137959340008695,
    ["7 rings action"] = 7585465294,
    ["Lay It Down II"] = 16986250768,
    ["Dadadada Tenshi"] = 18710950115,
    ["cleared"] = 17242654236,
    ["Low"] = 17755523209,
    ["pokedance"] = 75008276655552,
    ["Untouchable II"] = 16302111242,
    ["cant take my eyes off you"] = 13681656916,
    ["That That"] = 9577219971,
    ["Ishowspeed shake dat ass"] = 16455715993,
    ["Blah Blah Blah"] = 14648343355,
    ["el coco no"] = 14427504382,
    ["Hope World"] = 17832909398,
    ["Challenge"] = 83923307400471,
    ["The Squabble (fortnite)"] = 18553745388,
    ["Stuck"] = 10846690274,
    ["paranoia (league of legends)"] = 136926335172781,
    ["Lights Out"] = 18998437001,
    ["blood pop 2"] = 7110965223,
    ["Dung Lam Trai"] = 18649048765,
    ["NiziU Make Happy"] = 107018845763813,
    ["Giri Giri Dance"] = 18655870449,
    ["FUNKED UP"] = 18863712729,
    ["Melbourne Shuffle"] = 17588925114,
    ["Tell me"] = 18766916309,
    ["Hula Hoop"] = 12168870616,
    ["Lunar Party"] = 119703033043179,
    ["Naughty Boy"] = 15569786978,
    ["me after searching all this animations"] = 17766077997,
    ["GingaMingaYo"] = 12168640144,
    ["SpongeBob"] = 9937718701,
    ["7 Rings Ariana (Short)"] = 122850532460417,
    ["Woman II"] = 9183689189,
    ["HA HA!"] = 18846103241,
    ["Miku Beam"] = 91197982978353,
    ["Tyla PUSH 2"] = 122397638290852,
    ["ArianaG Last Christmas"] = 130115633688469,
    ["Independence"] = 19003847439,
    ["Skidibi"] = 16756613065,
    ["Beat It ( M.J )"] = 13842485756,
    ["Rich Tapout"] = 102480130402269,
    ["Espresso II"] = 18135222680,
    ["BB Belt"] = 79541061032796,
    ["Tyler Sticky"] = 82591052342579,
    ["Diva"] = 15635063518,
    ["Planetary Vibe"] = 16038898860,
    ["Action"] = 15437674680,
    ["Tauba Tauba"] = 116578687414020,
    ["Sacabambaspis"] = 18834774168,
    ["ice ice baby"] = 13564342612,
    ["crabby"] = 6546802195,
    ["expresso"] = 115573948686907,
    ["smooth winner"] = 7573570614,
    ["Timber1"] = 95495006115572,
    ["freestylin (fortnite)"] = 8670045630,
    ["Peek A Boo"] = 17188208710,
    ["beggin"] = 14052940722,
    ["surf bird"] = 15576917846,
    ["Psst, i see dead people ( Kendrick lamar )"] = 140660344990563,
    ["Royal"] = 17068825635,
    ["Q&A"] = 16995826438,
    ["tell your girlfriend"] = 17171629378,
    ["Feel It"] = 131709887164498,
    ["Motteke Sailor Fuku"] = 18723463754,
    ["Pajama Party Song"] = 16997154126,
    ["Candy"] = 16582854299,
    ["Jaywalking"] = 125238941692427,
    ["HeavyDirtySoul"] = 16927471657,
    ["Without You"] = 77766747777549,
    ["Gangnam V2"] = 8913898338,
    ["alibi pt1"] = 18125236590,
    ["Shimmer"] = 16845848053,
    ["pretty cool sit animation"] = 8720728883,
    ["Shaq"] = 116805820449516,
    ["Spicy Start"] = 122507653814221,
    ["ASmith Dancin"] = 139782974681210,
    ["take you to the moon"] = 110327316501717,
    ["Waiting For Love"] = 72053710295476,
    ["california girls"] = 10844909971,
    ["Espresso"] = 18146564147,
    ["Simpa"] = 12257423587,
    ["Mamushi"] = 18845906101,
    ["Lapdance"] = 18726264577,
    ["Gru Dance"] = 121765148647875,
    ["Woman ( Doja )"] = 14845112417,
    ["Chikiri bai bai"] = 140291985636707,
    ["Maximum Bounce"] = 74084616150320,
    ["Debochada"] = 76463210365083,
    ["Better When I'm Dancin'"] = 17598991805,
    ["Take It"] = 17068852940,
    ["Fantasy Faceoff"] = 136282125273244,
    ["Back In Vogue"] = 15178366587,
    ["Smooth Slide"] = 89487756791952,
    ["Leilt"] = 125395879083009,
    ["Sweet Shot"] = 133379233738041,
    ["The Black Cat Nero"] = 15042534606,
    ["Fast Fury"] = 130985777939088,
    ["De Yang Gatal Sa"] = 18443267622,
    ["Evil Plan"] = 18863717493,
    ["Hang Loose Celebration"] = 17090375482,
    ["Fan Dance"] = 12928948342,
    ["Culture Festival"] = 132419238573831,
    ["Dxrk Love"] = 10733121813,
    ["Slim Shady"] = 18553150120,
    ["Automotivo"] = 118464117733686,
    ["LOVE AGAIN (The Kid LAROI)"] = 89422288168329,
    ["sturdyV2 (Love Me, Hate Me k3lah)"] = 11664843153,
    ["Something Sweet"] = 117011995366745,
    ["monster mash"] = 75657221755215,
    ["Emergency2"] = 130675735022329,
    ["Yo Bunny"] = 18655830398,
    ["Mood"] = 98228401832445,
    ["simpa"] = 12453892230,
    ["Dusk Till Dawn"] = 15111178122,
    ["rust dance or ether gmod dance"] = 7919243971,
    ["Bird Call"] = 116815789865803,
    ["Jabba Loop V2"] = 8229514367,
    ["Ready For Love"] = 110272002917472,
    ["Pig Dance"] = 138988330656366,
    ["john Traffic"] = 71894922167975,
    ["Carolina"] = 78673618409072,
    ["Ashi Ashi"] = 16955531922,
    ["Helltaker"] = 18121692753,
    ["Brooklyn Pop"] = 8763979029,
    ["Halfway"] = 71475729633697,
    ["Pajama Party song"] = 16997154126,
    ["Cheerleader2"] = 71252630434744,
    ["Can Can"] = 123220715631267,
    ["Pulsebreaker"] = 129276303376319,
    ["Nxde"] = 16005012294,
    ["Marsh walk"] = 7514926048,
    ["HIT YA!"] = 14648380354,
    ["Backflip"] = 18550514533,
    ["Go Hard"] = 14840759624,
    ["Worth It II"] = 17831097892,
    ["roll and rock"] = 11056185537,
    ["Ask Me"] = 135228282276469,
    ["love Nwantiti (full song)"] = 136164088447421,
    ["I Ain't Afraid"] = 81315214408244,
    ["Monster Mash"] = 75657221755215,
    ["WAKA WAKA"] = 13431512360,
    ["caramelldansen v2"] = 7135503110,
    ["GOOD LOYAL THOTS II"] = 17844750472,
    ["Megan That Style"] = 118244079190674,
    ["Wait love me like I love you"] = 113197266804415,
    ["cupid FIFTY FIFTY"] = 13541314509,
    ["Reanimated1"] = 98469545127257,
    ["Paint The Town Red"] = 14901879394,
    ["SNOOPâ€™S WALK"] = 132477655284495,
    ["freewheelin"] = 17133023055,
    ["BBoom BBoom"] = 12008828114,
    ["Hot To Go"] = 85267023718407,
    ["Wife"] = 16388628018,
    ["I Can't Stop Me"] = 15437508723,
    ["Bananza"] = 12119868466,
    ["Hakari Dance"] = 18846734933,
    ["blurred lines"] = 11682931919,
    ["Thank you next!"] = 13772961479,
    ["Dream Feet"] = 72705907144448,
    ["rat meme"] = 77761218061941,
    ["Slave To The Rhythm"] = 16827642962,
    ["Jabba Switchway"] = 10646825705,
    ["APTv2"] = 133395265727090,
    ["september earth wind and fire"] = 15086356834,
    ["sway around"] = 11641870089,
    ["Shiitake"] = 129227624624368,
    ["Boing Swing"] = 83700935018360,
    ["Bunny Girl"] = 135330413860391,
    ["Faded Shuffle"] = 15065498244,
    ["FAERIE"] = 127885017128720,
    ["Da Da Da"] = 16040414349,
    ["Not My Problem V2"] = 93763021319191,
    ["Uchida 1"] = 18945973328,
    ["Simple Dimple"] = 15103544521,
    ["Vengeance"] = 17567602391,
    ["HEARTSTEEL Paranoia"] = 136926335172781,
    ["billy bounce"] = 8917592832,
    ["hakari dance"] = 18846734933,
    ["giri giri"] = 18655870449,
    ["TruththeBull HYPE ME UP"] = 139400505174036,
    ["Show Ya"] = 108448532674168,
    ["Chaos"] = 72779334811742,
    ["double step"] = 6872733496,
    ["punching"] = 16069488698,
    ["likey TWICE"] = 8826527896,
    ["Bloodline"] = 17832109114,
    ["outwest"] = 9848086412,
    ["Drama"] = 15569498104,
    ["The Worm Loop V2"] = 7160307855,
    ["deadpool (goofy)"] = 18851345656,
    ["Get Into It (Yuh) II"] = 17833304354,
    ["Ariana No Tears"] = 112734209857887,
    ["villian kda"] = 16031743040,
    ["Lost In Paradise"] = 18724677202,
    ["Confident"] = 18443885876,
    ["h3R3 MissYou"] = 133109803473958,
    ["The Way I Are"] = 16987792033,
    ["TTYL"] = 70816579313825,
    ["Counting Stars"] = 13762955662,
    ["bad girls like you"] = 85827618059547,
    ["Bag Work"] = 123725130872798,
    ["SpongeBob ( Jersey club )"] = 10980542151,
    ["LK Oncinhas"] = 75419590211428,
    ["Supernova"] = 17509367733,
    ["martial arts ( chinese tiktok meme dance)"] = 15945268429,
    ["Pogba Ela joga"] = 126871800781728,
    ["shuffle"] = 15783246823,
    ["All Eyes On Me"] = 15104893350,
    ["Show and Tell Melaine Martinez"] = 92138694362471,
    ["Rude Boy"] = 13539279783,
    ["Jiggle Jiggle"] = 103720979881624,
    ["Looking Good"] = 18863697075,
    ["LOSER = LOVER"] = 14884131961,
    ["Mesmerizer"] = 17669618226,
    ["To The Moon"] = 94655045117804,
    ["alibi pt2"] = 18319544101,
    ["mine"] = 81748769167697,
    ["Bim Bam Boom"] = 18552948159,
    ["melbourne shuffle"] = 17588925114,
    ["Love Me Like This"] = 15254167229,
    ["DJRUINA Bear"] = 125909896768791,
    ["Purr"] = 17243669137,
    ["Don't Cha"] = 98588383635359,
    ["Sparkle"] = 16214521576,
    ["Ta Ta Ta"] = 75826066577908,
    ["Forget Me Not"] = 119574283368193,
    ["how long (full dance)"] = 121009670194194,
    ["Dancery"] = 139819388139667,
    ["Set Me Free"] = 15432823630,
    ["Smack Yo V2"] = 137990521192304,
    ["lucid dreams"] = 78793542333839,
    ["The Quick Style"] = 103847619627425,
    ["glyphic"] = 14846105925,
    ["Cradles1"] = 132180762791625,
    ["Fine China"] = 18820121203,
    ["Fast Car"] = 124458006316301,
    ["Very Nice"] = 16924724555,
    ["Sugar"] = 16817904771,
    ["Trumpet Playing Boy"] = 16825494310,
    ["Debut"] = 102726205399656,
    ["GINTA KAMASE"] = 109039162634965,
    ["electro swing"] = 7839963379,
    ["Solo"] = 14907680676,
    ["ANTIFRAGILE"] = 15178352490,
    ["no name"] = 10646825705,
    ["Criss Cross"] = 83451553426933,
    ["Granada"] = 78293994761172,
    ["deposits"] = 7585369035,
    ["twerking"] = 91014640753525,
    ["Classy"] = 78428472180235,
    ["Abracadabra"] = 14957258734,
    ["I'll Show You"] = 15634516315,
    ["bubble gum 2 new jeans"] = 18331893728,
    ["Sage GasPedal"] = 136751837272445,
    ["Pretty Savage"] = 17164801888,
    ["Con Con Cat"] = 17742298800,
    ["bood up groove"] = 117084599446252,
    ["Boom"] = 15569628760,
    ["Bouncy"] = 14143674954,
    ["Without Me"] = 17505877209,
    ["jump in the cadillac"] = 7134341864,
    ["Popular (The Weekend)"] = 86671372479191,
    ["Run Away1"] = 135670294474657,
    ["Carefree"] = 17589995043,
    ["Love Love Love"] = 16120595987,
    ["Deja vÃ¹"] = 15746540104,
    ["Door open2"] = 8582811595,
    ["Doughnut"] = 15254341227,
    ["Stay Style"] = 93328147373779,
    ["BTBT"] = 11562114786,
    ["Win"] = 17079972610,
    ["super shy pt2"] = 18331705911,
    ["Go Big or Go Home"] = 15178354473,
    ["Say it Right"] = 14044620822,
    ["Desirable"] = 108818394598530,
    ["SPIDER MAN"] = 8228461600,
    ["goku party party"] = 14131164014,
    ["two of hearts"] = 17755562146,
    ["party girl"] = 11361819010,
    ["Luz Do Luar"] = 17743420847,
    ["Rude Boy II"] = 16827397883,
    ["MichaelPrince Finesse"] = 118856249569207,
    ["Seven"] = 14390424694,
    ["Samba De Wasshoi!"] = 18532929480,
    ["Oruam TROPA DO ORUAM"] = 107591803417714,
    ["Zoom"] = 17589910939,
    ["Paint The Town"] = 17079779758,
    ["BUMBAA"] = 90779822053049,
    ["push up"] = 14053240024,
    ["Maniac 2"] = 16826050749,
    ["Ambitious ( IZ )"] = 18863692098,
    ["im a mistery"] = 16038241530,
    ["Tucked"] = 18530609511,
    ["JUMPSTYLE"] = 127818220981023,
    ["Ghost Rule Hatsune Miku"] = 18768112767,
    ["Not Shy"] = 16582998069,
    ["Soltando PancadÃ£o"] = 18972490730,
    ["Mysterious"] = 15880335321,
    ["New Dance"] = 15880457949,
    ["Boo'd Up Groove"] = 14458113330,
    ["None of My Business"] = 15880405184,
    ["Megaverse"] = 15431172216,
    ["I Gotta Feeling"] = 17439759708,
    ["Zachz guli"] = 71078330743706,
    ["Bye Bye Bye"] = 18836343559,
    ["After Party"] = 11377193186,
    ["Village People YMCA"] = 78742010701451,
    ["Yes or Yes"] = 15957562949,
    ["Love Dive"] = 16299894030,
    ["Copines"] = 16197761072,
    ["Batte Forte"] = 102060121134651,
    ["New Jeans"] = 14907708508,
    ["Boy With Luv"] = 13361878864,
    ["Super Tuna"] = 17833000129,
    ["jaywalkin"] = 10970927618,
    ["Pop In 2"] = 123702667366431,
    ["Leaderboard"] = 137150638313235,
    ["Magnetic II"] = 17353634431,
    ["Lagday Phonk"] = 17353669376,
    ["Xoxo"] = 15569894153,
    ["Netflix Mingle2"] = 126736330036532,
    ["fly dance"] = 6948708906,
    ["Crazy Form"] = 15770022100,
    ["1 2 Fanclub"] = 17447261252,
    ["Come On"] = 17753450011,
    ["Million Dollar Baby"] = 17512824075,
    ["Fate"] = 17068636413,
    ["heel toe toprock"] = 14053176456,
    ["Coincidance"] = 15111134263,
    ["dumb feet"] = 14053155061,
    ["Handshake"] = 71243990877913,
    ["Blood Pop V2"] = 84481772145652,
    ["Robot"] = 12992899456,
    ["YMCA"] = 12992183809,
    ["Pixel Dance"] = 12992971601,
    ["Sweeping By"] = 12993411905,
    ["Getting Down"] = 12993465611,
    ["Samba1"] = 12992656048,
    ["Gangnam"] = 12992429932,
    ["Twist"] = 12992907026,
    ["Breakdown"] = 12992718451,
    ["ClassicJustice"] = 12993190722,
    ["House"] = 12992170853,
    ["Peter Parker"] = 12993056110,
    ["Free Flow"] = 12992701153,
    ["ChickenDance"] = 12993617382,
    ["HavingFun"] = 12993391346,
    ["Can Can"] = 12992104148,
    ["HokeyPokey"] = 12993340787,
    ["ShakeItOff"] = 12992391426,
    ["Hoolahoop"] = 12993590379,
    ["Sturdy1"] = 12994114440,
    ["Rumba"] = 12993576881,
    ["Floss"] = 12992769625,
    ["MatchMe"] = 12993362823,
    ["Scenario"] = 14486394967,
    ["SpeedDance"] = 13696910630,
    ["Mickey Mouse Dance"] = 17513850642,
    ["SmugDance"] = 14486336348,
    ["IJustWannaDance"] = 13872712172,
    ["A Little Bread"] = 18325622691,
    ["CherryDance"] = 13872720636,
    ["Stock Dancin"] = 15177954796,
    ["Boppin"] = 14486340206,
    ["Bunny Hop"] = 18325628382,
    ["Sturdy2"] = 13592143109,
    ["ShigureUiDance"] = 14969811713,
    ["On the floor"] = 15192307042,
    ["Dougie Dance"] = 17513857048,
    ["Poke Dance"] = 17513854059,
    ["Underneath The Tree"] = 15416326197,
    ["JustGo"] = 14486343502,
    ["Side to Side"] = 12993432864,
    ["DefaultDance"] = 12992848429,
    ["We Happy"] = 12993132263,
    ["Pumpernickel"] = 12992881462,
    ["AyeMan"] = 12993205713,
    ["LegTwister"] = 12993325715,
    ["Macarena"] = 12992463459,
    ["Jung Justice"] = 12993064748,
    ["Guitar"] = 12992788548,
    ["Blues Clues"] = 12993568743,
    ["Pon Pon"] = 12992690607,
    ["Smooth Moves"] = 12992696073,
    ["Slappa Dappa"] = 12992515489,
    ["Reanimated"] = 12992858874,
    ["Silly"] = 12992583689,
    ["ImWinning"] = 12992413589,
    ["GlitchedOut"] = 12993097815,
    ["Slitherin"] = 12992874866,
    ["LetsRock"] = 12992800469,
    ["Samba2"] = 12993492084,
    ["Calamity"] = 12992723009,
    ["Dab"] = 12992738380,
    ["SitUps"] = 12973940244,
    ["Beg"] = 12981033755,
    ["LeanSit"] = 12973730155,
    ["Wryyy Pose"] = 15177958229,
    ["Jumping Jacks"] = 12973049200,
    ["Taunt"] = 12974197433,
    ["Lay1"] = 12981946628,
    ["SideLay"] = 12973742305,
    ["LetsGo"] = 12973972241,
    ["TakeTheL"] = 12992890179,
    ["Square Up"] = 12981051256,
    ["Kneel1"] = 12973757683,
    ["The Voices"] = 12981003324,
    ["Woah Woah Woah"] = 12981111999,
    ["DoubleWave"] = 12974003029,
    ["Where"] = 12973928238,
    ["Monky"] = 12993166195,
    ["Push Ups"] = 12973009418,
    ["Spite"] = 12993158203,
    ["Sit1"] = 12973715032,
    ["Yawn"] = 12974021252,
    ["Kneel2"] = 12981891054,
    ["Lean"] = 12981904215,
    ["Squats"] = 12973683060,
    ["Hero Backflip"] = 12992762764,
    ["T Pose"] = 12992979140,
    ["Backflip"] = 12973697371,
    ["DarnIt"] = 12973990539,
    ["Sleep1"] = 12973772147,
    ["BlingBling"] = 12992816303,
    ["Flow"] = 12992151545,
    ["RollOver"] = 12993103917,
    ["Groovy"] = 12993125962,
    ["Slick"] = 12993146695,
    ["LegRaises"] = 12993302141,
    ["Pony"] = 12992866294,
    ["BillyBounce"] = 12993178627,
    ["Uprock"] = 12993420438,
    ["Maraschino"] = 12993291974,
    ["Flapper"] = 12992755815,
    ["Brooklyn"] = 12795700718,
    ["CantDance"] = 12992631866,
    ["OrangeJustice 2"] = 12992830553,
    ["Zany"] = 12993199503,
    ["Crackdown 2"] = 12992731029,
    ["Bepop"] = 12993530370,
    ["Luke"] = 12993221596,
    ["Caramel"] = 12993118751,
    ["HeadSpin"] = 12993370344,
    ["Griddy 2"] = 12994084238,
    ["Sans"] = 12992966286,
    ["Hype"] = 12992823050,
    ["Bobby"] = 12993069859,
    ["Electro Shuffle"] = 12992743526,
    ["Eagle"] = 12992749522,
    ["Freestylin"] = 12992776034,
    ["ElectroSwing"] = 12992808904,
    ["Boogie Bomb"] = 12992713431,
    ["PopLock"] = 12992840537,
    ["Yeet"] = 12993183328,
    ["Smug"] = 12993060513,
    ["BellyDance"] = 12992236070,
    ["Helicopter"] = 12984907623,
    ["Salsa"] = 12992318087,
    ["KatzotskyKick"] = 12993151887,
    ["Worm"] = 12992916476,
    ["Pogo"] = 12993137588,
    ["Wavey"] = 12992274628,
    ["Spooky"] = 12993142150,
    ["Muffin"] = 12993051982,
    ["Woop"] = 12991958176,
    ["Peanut"] = 12993089266,
    ["Fancy Feet"] = 12992927949,
    ["Jinkies"] = 12993171877,
    ["TPoseBoss"] = 12992983406,
    ["ActivityClient"] = 13187374025,
    ["Giddy Up!"] = 18207064730,
    ["Jolly Good Fun"] = 18252759871,
    ["Sporty"] = 18251364685,
    ["Cartwheel"] = 18251378271,
    ["Bling Bling"] = 18252949608,
    ["Squat Kick"] = 18252961180,
    ["Shuffle"] = 18252844685,
    ["Double Step"] = 18251216817,
    ["Happy Jump"] = 18251244903,
    ["Slick With It"] = 18251262436,
    ["Arm Wave"] = 18251007649,
    ["Neighbourhood Hero"] = 18252670050,
    ["GameBoy"] = 18251291687,
    ["POSE"] = 18252894702,
    ["Yeet on em"] = 18252780801,
    ["Side Dance"] = 18251167205,
    ["Side To Side"] = 83607279456969,
    ["Polite Step"] = 113172604668490,
    ["Emphasis"] = 122202628700622,
    ["Bopping"] = 133543463097020,
    ["Arcade Boy!"] = 99486557258847,
    ["Holding On"] = 76278053939773,
    ["Water"] = 121884945304657,
    ["Tea Cup"] = 133434442542783,
    ["Quick Pushups"] = 89316071915968,
    ["Balloon Boxing"] = 71267534676378,
    ["Hulk Smash"] = 97065657829519,
    ["Flip Stomp"] = 79916966297443,
    ["Zen Pop"] = 130209465607505,
    ["Smooth With It"] = 109118985961757,
    ["Get Funky"] = 85153706914026,
    ["Go Junior"] = 110109934211908,
    ["Swiftly"] = 118992399644481,
    ["Gentleman Bop2"] = 117133532805827,
    ["Shaking It!"] = 71579383325032,
    ["Timid Dancer"] = 126799635510744,
    ["Soloist"] = 111582613035904,
    ["Popping It!"] = 134141092249865,
    ["Gentleman Bop3"] = 115501945724779,
    ["Ups!"] = 101842110838673,
    ["Gentleman Bop"] = 114008246565640,
    ["Wave Dance1"] = 112543350678381,
    ["Hip Hop Artist"] = 90940773020622,
    ["Wave Dance2"] = 131919162349621,
    ["Heel Flick"] = 82351180313906,
    ["Slide With Me!"] = 96298328184518,
    ["Squat 1"] = 132444353180049,
    ["Hip Hop Artist2"] = 105236152350661,
    ["Balancin"] = 90068884911775,
    ["Always Fresh!"] = 72114877001375,
    ["Footwork"] = 89553904667469,
    ["Yippee!"] = 101230742996868,
    ["Wave Dance3"] = 83349414961969,
}

local BuiltInAnimationValues = {}
for name, value in pairs(BuiltInAnimationsR15) do
    BuiltInAnimationValues[value] = name
end

    R15:CreateDropdown("Built In Animations", BuiltInAnimationValues, function(BuiltInAnimationSR15elected)
        if not R15reanimated then
            Message("Error:", "Invalid Animation", 5)
            return
        end
        local AnimationValue = BuiltInAnimationsR15[BuiltInAnimationSR15elected] 


    if AnimationValue then
            if AnimationActive or not StopAnim then
                StopAnim = true
                AnimationActive = false
                
                
                wait(0.5) 
            end
    
            
    
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
    
            
            local rootPart = character:WaitForChild("HumanoidRootPart")
            local head = character:WaitForChild("Head")
            local leftFoot = character:WaitForChild("LeftFoot")
            local leftHand = character:WaitForChild("LeftHand")
            local leftLowerArm = character:WaitForChild("LeftLowerArm")
            local leftLowerLeg = character:WaitForChild("LeftLowerLeg")
            local leftUpperArm = character:WaitForChild("LeftUpperArm")
            local leftUpperLeg = character:WaitForChild("LeftUpperLeg")
            local lowerTorso = character:WaitForChild("LowerTorso")
            local rightFoot = character:WaitForChild("RightFoot")
            local rightHand = character:WaitForChild("RightHand")
            local rightLowerArm = character:WaitForChild("RightLowerArm")
            local rightLowerLeg = character:WaitForChild("RightLowerLeg")
            local rightUpperArm = character:WaitForChild("RightUpperArm")
            local rightUpperLeg = character:WaitForChild("RightUpperLeg")
            local upperTorso = character:WaitForChild("UpperTorso")
    
            
            local Joints = {
                ["Torso"] = rootPart:FindFirstChild("RootJoint"),
                ["Head"] = head:FindFirstChild("Neck"),
                ["LeftUpperArm"] = leftUpperArm:FindFirstChild("LeftShoulder"),
                ["RightUpperArm"] = rightUpperArm:FindFirstChild("RightShoulder"),
                ["LeftUpperLeg"] = leftUpperLeg:FindFirstChild("LeftHip"),
                ["RightUpperLeg"] = rightUpperLeg:FindFirstChild("RightHip"),
                ["LeftFoot"] = leftFoot:FindFirstChild("LeftAnkle"),
                ["RightFoot"] = rightFoot:FindFirstChild("RightAnkle"),
                ["LeftHand"] = leftHand:FindFirstChild("LeftWrist"),
                ["RightHand"] = rightHand:FindFirstChild("RightWrist"),
                ["LeftLowerArm"] = leftLowerArm:FindFirstChild("LeftElbow"),
                ["RightLowerArm"] = rightLowerArm:FindFirstChild("RightElbow"),
                ["LeftLowerLeg"] = leftLowerLeg:FindFirstChild("LeftKnee"),
                ["RightLowerLeg"] = rightLowerLeg:FindFirstChild("RightKnee"),
                ["LowerTorso"] = lowerTorso:FindFirstChild("Root"),
                ["UpperTorso"] = upperTorso:FindFirstChild("Waist"),
            }
    
            
            if character:FindFirstChild("Humanoid") and character.Humanoid:FindFirstChild("Animator") then
                character.Humanoid.Animator.Parent = nil
            end
            if character:FindFirstChild("Animate") then
                character.Animate.Enabled = false
            end
    
            local NeededAssets = game:GetObjects("rbxassetid://" .. AnimationValue)[1]
            local TweenService = game:GetService('TweenService')
            local speed = 55
            StopAnim = false
            AnimationActive = true
            
            while AnimationActive do
                if StopAnim then
                    AnimationActive = false 
                    break
                end
    
                local keyframes = NeededAssets:GetKeyframes() 
                for ii, frame in pairs(keyframes) do
                    if StopAnim then break end
                    
                    
                    local duration = keyframes[ii + 1] and keyframes[ii + 1].Time - frame.Time or task.wait(1 / 120)
                    duration = duration / (R15animationSpeed / 0.65) 
    
                    if keyframes[ii - 1] then
                        task.wait((frame.Time - keyframes[ii - 1].Time) * (R15animationSpeed / 0.65)) 
                    end
    
                    for _, v in pairs(frame:GetDescendants()) do
                        if Joints[v.Name] then
                            TweenService:Create(Joints[v.Name], TweenInfo.new(duration), {Transform = v.CFrame}):Play()
                        end
                    end
                end
                task.wait(1 / 120)
            end
        else
            print("Invalid animation ID.")
        end
    
    end)
local R15DropdownScript = R15:CreateDropdown("Saved Animations", dropdownOptions, function(SelectedR15Animation)
    if not R15reanimated then
        Message("Error:", "Invalid Animation", 5)
        return
    end
    
    
    local selectedAnimationID
    for id, name in pairs(SavedAnimationsFile) do
        if name == SelectedR15Animation then
            selectedAnimationID = id
            break
        end
    end

    if selectedAnimationID then
        print(selectedAnimationID)
        selectAnimation(selectedAnimationID)
        print(selectedAnimationID)

        if AnimationActive then
            StopAnim = true
            AnimationActive = false
            
            
            wait(0.5) 
        end

        

        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local head = character:WaitForChild("Head")
        local leftFoot = character:WaitForChild("LeftFoot")
        local leftHand = character:WaitForChild("LeftHand")
        local leftLowerArm = character:WaitForChild("LeftLowerArm")
        local leftLowerLeg = character:WaitForChild("LeftLowerLeg")
        local leftUpperArm = character:WaitForChild("LeftUpperArm")
        local leftUpperLeg = character:WaitForChild("LeftUpperLeg")
        local lowerTorso = character:WaitForChild("LowerTorso")
        local rightFoot = character:WaitForChild("RightFoot")
        local rightHand = character:WaitForChild("RightHand")
        local rightLowerArm = character:WaitForChild("RightLowerArm")
        local rightLowerLeg = character:WaitForChild("RightLowerLeg")
        local rightUpperArm = character:WaitForChild("RightUpperArm")
        local rightUpperLeg = character:WaitForChild("RightUpperLeg")
        local upperTorso = character:WaitForChild("UpperTorso")

        
        local Joints = {
            ["Torso"] = rootPart:FindFirstChild("RootJoint"),
            ["Head"] = head:FindFirstChild("Neck"),
            ["LeftUpperArm"] = leftUpperArm:FindFirstChild("LeftShoulder"),
            ["RightUpperArm"] = rightUpperArm:FindFirstChild("RightShoulder"),
            ["LeftUpperLeg"] = leftUpperLeg:FindFirstChild("LeftHip"),
            ["RightUpperLeg"] = rightUpperLeg:FindFirstChild("RightHip"),
            ["LeftFoot"] = leftFoot:FindFirstChild("LeftAnkle"),
            ["RightFoot"] = rightFoot:FindFirstChild("RightAnkle"),
            ["LeftHand"] = leftHand:FindFirstChild("LeftWrist"),
            ["RightHand"] = rightHand:FindFirstChild("RightWrist"),
            ["LeftLowerArm"] = leftLowerArm:FindFirstChild("LeftElbow"),
            ["RightLowerArm"] = rightLowerArm:FindFirstChild("RightElbow"),
            ["LeftLowerLeg"] = leftLowerLeg:FindFirstChild("LeftKnee"),
            ["RightLowerLeg"] = rightLowerLeg:FindFirstChild("RightKnee"),
            ["LowerTorso"] = lowerTorso:FindFirstChild("Root"),
            ["UpperTorso"] = upperTorso:FindFirstChild("Waist"),
        }

        
        if character:FindFirstChild("Humanoid") and character.Humanoid:FindFirstChild("Animator") then
            character.Humanoid.Animator.Parent = nil
        end
        if character:FindFirstChild("Animate") then
            character.Animate.Enabled = false
        end

        local NeededAssets = game:GetObjects("rbxassetid://" .. selectedAnimationID)[1]
        local TweenService = game:GetService('TweenService')
        local speed = 55
        StopAnim = false
        AnimationActive = true
        
        while AnimationActive do
            if StopAnim then
                AnimationActive = false 
                break
            end

            local keyframes = NeededAssets:GetKeyframes() 
            for ii, frame in pairs(keyframes) do
                if StopAnim then break end
                
                
                local duration = keyframes[ii + 1] and keyframes[ii + 1].Time - frame.Time or task.wait(1 / 120)
                duration = duration / (R15animationSpeed / 0.65) 

                if keyframes[ii - 1] then
                    task.wait((frame.Time - keyframes[ii - 1].Time) * (R15animationSpeed / 0.65)) 
                end

                for _, v in pairs(frame:GetDescendants()) do
                    if Joints[v.Name] then
                        TweenService:Create(Joints[v.Name], TweenInfo.new(duration), {Transform = v.CFrame}):Play()
                    end
                end
            end
            task.wait(1 / 120)
        end
    else
        print("Invalid animation ID.")
    end
end)


loadConfig()

    R6:CreateDropdown("HaxterFelix Animations", HaxterFelix, function(selectedHax)
        mode = selectedHax
        print("Selected Animation Mode: " .. mode)
end)

R6:CreateDropdown("Shavine Animations", Shavine, function(ShavinesModes)
        mode = ShavinesModes
        print("Selected Animation Mode: " .. mode)
    end)


    R6:CreateDropdown("Random Animations", Random, function(RandomModes)
        mode = RandomModes
        print("Selected Animation Mode: " .. mode)
    end)
           

    Animations:CreateToggle("Get Ingame Emotes GUI", function(IngameEmotes)
        getgenv().IngameEmotess = IngameEmotes
        while true do wait(0)
        if not getgenv().IngameEmotess then
            return end
            local LocalPlayer = Players.LocalPlayer
            local PlayerGui = LocalPlayer.PlayerGui
            
            if PlayerGui:FindFirstChild("Animations") == nil then
                
                local loganWS = game:FindFirstChild("LoganWS")
                if loganWS then
                    loganWS:Destroy() 
                end
    
            local animations = {
        ["Vip01"] = 124072584017964,
        ["Vip02"] = 121659384964277,
        ["Vip03"] = 137445502103066,
        ["VipA"] = 79206964158638,
        ["VipD"] = 117490893874984,
        ["VipH"] = 11137175775,
        ["VipM"] = 11137338685,
        ["VipN"] = 11136806744,
        ["VipT"] = 11136713233,
        ["VipU"] = 14852252548
                  } 
        --[[local player = game:GetService("Players").LocalPlayer
    
        
        local function findAllAnimationsInHierarchy(parent, animations)
            for _, child in pairs(parent:GetChildren()) do
                if child:IsA("Animation") then
                    
                    local animationName = child.Parent and child.Parent.Parent and child.Parent.Parent.Parent and child.Parent.Parent.Parent.Parent.Name
                    table.insert(animations, {Name = animationName, Id = child.AnimationId})
                else
                    findAllAnimationsInHierarchy(child, animations)
                end
            end
        end
    
        
        local animations = {}
    
        
        findAllAnimationsInHierarchy(player.PlayerGui, animations)
    
        
        local output = {}
    
        if #animations > 0 then
            for _, animation in pairs(animations) do
                
                local id = string.match(animation.Id, "%d+")
                table.insert(output, string.format('["%s"] = %s', animation.Name, id))
            end
    
            
            local finalOutput = table.concat(output, "\n")
    
            
            print(finalOutput)
            setclipboard(finalOutput)
        else
            print("No animations found.")
        end
        ]]--
    
                  
                  local function sortAnimations(animTable)
                      local sortedAnimations = {}
    
                      for name, id in pairs(animTable) do
                          table.insert(sortedAnimations, {name, id})
                      end
    
                      table.sort(sortedAnimations, function(a, b)
                          return a[1] < b[1]
                      end)
    
                      
                      local newSortedTable = {}
                      for _, v in ipairs(sortedAnimations) do
                          newSortedTable[v[1]] = v[2]
                      end
    
                      return newSortedTable
                  end
    
                  
                  animations = sortAnimations(animations)
    
                  
                  local LoganWS = Instance.new('Folder', game.CoreGui)
                  LoganWS.Name = 'LoganWS'
    
                  local buttonHolder = Instance.new('Folder', LoganWS)
                  buttonHolder.Name = "Buttons"
    
                  local Animations = Instance.new("ScreenGui")
                  local MainFrame = Instance.new("Frame")
                  local UIGradient = Instance.new("UIGradient")
                  local Title = Instance.new("TextLabel")
                  local SearchBox = Instance.new("TextBox")
                  local Container = Instance.new("ScrollingFrame")
                  local Button = Instance.new("TextButton")
                  local UIListLayout = Instance.new("UIListLayout")
                  local UIListLayout2 = Instance.new("UIListLayout")
                  local UIListLayout3 = Instance.new("UIListLayout")
                  local StopAnim = Instance.new("TextButton")
                  local PauseAnim = Instance.new("TextButton")
                  local ReplayAnim = Instance.new("TextButton")
                  local ReverseAnim = Instance.new("TextButton")
                  local Exit = Instance.new("TextButton")
                  local Mini = Instance.new("TextButton")
                  local titleFrame = Instance.new("Frame")
                  local slideFrame = Instance.new("Frame")
                  local SlideBar = Instance.new("Frame")
                  local SlideButton = Instance.new("TextButton")
                  local creds = Instance.new("TextLabel")
                  wait(0.3)
                  Animations.Name = "Animations"
                  Animations.Parent = plr:WaitForChild("PlayerGui")
    
                  MainFrame.Name = "MainFrame"
                  MainFrame.Parent = Animations
                  MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  MainFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
                  MainFrame.BorderSizePixel = 0
                  MainFrame.Position = UDim2.new(0.4, 584, 0.2, -74)
                  MainFrame.Size = UDim2.new(0.135, 0, 0.6, 0)
    
                  titleFrame.Name = "TitleFrame"
                  titleFrame.Parent = MainFrame
                  titleFrame.BorderSizePixel = 0
                  titleFrame.LayoutOrder = 0
                  titleFrame.BackgroundTransparency = 1
                  titleFrame.Size = UDim2.new(1, 0, 0.05, 0)
    
                  slideFrame.Name = "SlideFrame"
                  slideFrame.Parent = MainFrame
                  slideFrame.BorderSizePixel = 0
                  slideFrame.LayoutOrder = 3
                  slideFrame.BackgroundTransparency = 1
                  slideFrame.Size = UDim2.new(1, 0, 0.05, 0)
    
                  UIListLayout3.Parent = titleFrame
                  UIListLayout3.FillDirection = Enum.FillDirection.Horizontal
                  UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
    
                  UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 45, 113)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 34, 103))}
                  UIGradient.Parent = MainFrame
    
                  Title.Name = "Title"
                  Title.Parent = titleFrame
                  Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  Title.BackgroundTransparency = 1.000
                  Title.Size = UDim2.new(0.8, 0, 1, 0)
                  Title.Font = Enum.Font.GothamSemibold
                  Title.Text = "Emotes"
                  Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                  Title.TextScaled = true
                  Title.TextSize = 14.000
                  Title.TextWrapped = true
                  Title.LayoutOrder = 0
    
                  creds.Name = "Creds"
                  creds.Parent = MainFrame
                  creds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  creds.BackgroundTransparency = 1.000
                  creds.Size = UDim2.new(1, 0, 0.05, 0)
                  creds.Font = Enum.Font.GothamSemibold
                  creds.Text = "By HaxterFelix"
                  creds.TextColor3 = Color3.fromRGB(255, 255, 255)
                  creds.TextScaled = true
                  creds.TextSize = 14.000
                  creds.TextWrapped = true
                  creds.LayoutOrder = 8
    
                  SearchBox.Name = "SearchBox"
                  SearchBox.Parent = MainFrame
                  SearchBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  SearchBox.BackgroundTransparency = 0.750
                  SearchBox.BorderSizePixel = 0
                  SearchBox.Size = UDim2.new(1, 0, 0.045, 0)
                  SearchBox.Font = Enum.Font.GothamSemibold
                  SearchBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                  SearchBox.PlaceholderText = "Search bar..."
                  SearchBox.Text = ""
                  SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                  SearchBox.TextScaled = true
                  SearchBox.TextSize = 14.000
                  SearchBox.TextWrapped = true
                  SearchBox.LayoutOrder = 1
    
                  Container.Name = "Container"
                  Container.Parent = MainFrame
                  Container.Active = true
                  Container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  Container.BackgroundTransparency = 0.750
                  Container.BorderSizePixel = 0
                  Container.Size = UDim2.new(1, 0, 0.5, 0)
                  Container.ScrollBarThickness = 5
                  Container.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
                  Container.LayoutOrder = 2
    
                  Button.Name = "Button"
                  Button.Parent = LoganWS
                  Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  Button.BackgroundTransparency = 0.850
                  Button.BorderSizePixel = 0
                  Button.Size = UDim2.new(1, 0, 0, 38)
                  Button.Font = Enum.Font.GothamSemibold
                  Button.Text = "Test"
                  Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                  Button.TextScaled = true
                  Button.TextSize = 14.000
                  Button.TextWrapped = true
    
                  UIListLayout.Parent = Container
                  UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                  UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                  UIListLayout.Padding = UDim.new(0, 5)
    
                  UIListLayout2.Parent = MainFrame
                  UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                  UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
                  UIListLayout2.Padding = UDim.new(0, 5)
    
                  ReverseAnim.Name = "ReverseAnim"
                  ReverseAnim.Parent = MainFrame
                  ReverseAnim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  ReverseAnim.BackgroundTransparency = 0.750
                  ReverseAnim.BorderColor3 = Color3.fromRGB(27, 42, 53)
                  ReverseAnim.BorderSizePixel = 0
                  ReverseAnim.LayoutOrder = 4
                  ReverseAnim.Size = UDim2.new(0.85, 0, 0.06, 0)
                  ReverseAnim.Font = Enum.Font.GothamSemibold
                  ReverseAnim.Text = "Reverse animation"
                  ReverseAnim.TextColor3 = Color3.fromRGB(255, 255, 255)
                  ReverseAnim.TextScaled = true
                  ReverseAnim.TextSize = 14.000
                  ReverseAnim.TextWrapped = true
    
                  StopAnim.Name = "StopAnim"
                  StopAnim.Parent = MainFrame
                  StopAnim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  StopAnim.BackgroundTransparency = 0.750
                  StopAnim.BorderColor3 = Color3.fromRGB(27, 42, 53)
                  StopAnim.BorderSizePixel = 0
                  StopAnim.LayoutOrder = 5
                  StopAnim.Size = UDim2.new(0.85, 0, 0.06, 0)
                  StopAnim.Font = Enum.Font.GothamSemibold
                  StopAnim.Text = "Stop animation"
                  StopAnim.TextColor3 = Color3.fromRGB(255, 255, 255)
                  StopAnim.TextScaled = true
                  StopAnim.TextSize = 14.000
                  StopAnim.TextWrapped = true
    
                  PauseAnim.Name = "PauseAnim"
                  PauseAnim.Parent = MainFrame
                  PauseAnim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  PauseAnim.BackgroundTransparency = 0.750
                  PauseAnim.BorderColor3 = Color3.fromRGB(27, 42, 53)
                  PauseAnim.BorderSizePixel = 0
                  PauseAnim.Size = UDim2.new(0, 219, 0, 28)
                  PauseAnim.Font = Enum.Font.GothamSemibold
                  PauseAnim.Text = "Pause Game Animations"
                  PauseAnim.TextColor3 = Color3.fromRGB(255, 255, 255)
                  PauseAnim.TextScaled = true
                  PauseAnim.TextSize = 14.000
                  PauseAnim.TextWrapped = true
                  PauseAnim.LayoutOrder = 6
    
                  ReplayAnim.Name = "ReplayAnim"
                  ReplayAnim.Parent = MainFrame
                  ReplayAnim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  ReplayAnim.BackgroundTransparency = 0.750
                  ReplayAnim.BorderColor3 = Color3.fromRGB(27, 42, 53)
                  ReplayAnim.BorderSizePixel = 0
                  ReplayAnim.Size = UDim2.new(0, 219, 0, 28)
                  ReplayAnim.Font = Enum.Font.GothamSemibold
                  ReplayAnim.Text = "Replay Game Animations"
                  ReplayAnim.TextColor3 = Color3.fromRGB(255, 255, 255)
                  ReplayAnim.TextScaled = true
                  ReplayAnim.TextSize = 14.000
                  ReplayAnim.TextWrapped = true
                  ReplayAnim.LayoutOrder = 7
    
                  Exit.Name = "Exit"
                  Exit.Parent = titleFrame
                  Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  Exit.BackgroundTransparency = 1.000
                  Exit.Size = UDim2.new(0.1, 0, 0.7, 0)
                  Exit.Font = Enum.Font.GothamSemibold
                  Exit.Text = "X"
                  Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
                  Exit.TextScaled = true
                  Exit.TextSize = 14.000
                  Exit.TextWrapped = true
                  Exit.LayoutOrder = 2
    
                  Mini.Name = "Mini"
                  Mini.Parent = titleFrame
                  Mini.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  Mini.BackgroundTransparency = 1.000
                  Mini.Size = UDim2.new(0.1, 0, 0.7, 0)
                  Mini.Font = Enum.Font.GothamSemibold
                  Mini.Text = "-"
                  Mini.TextColor3 = Color3.fromRGB(255, 255, 255)
                  Mini.TextScaled = true
                  Mini.TextSize = 14.000
                  Mini.TextWrapped = true
                  Mini.LayoutOrder = 1
    
                  SlideBar.Name = "SlideBar"
                  SlideBar.Parent = slideFrame
                  SlideBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                  SlideBar.BackgroundTransparency = 0.750
                  SlideBar.BorderSizePixel = 0
                  SlideBar.Size = UDim2.new(1, 0, 0.3, 0)
                  SlideBar.AnchorPoint = Vector2.new(0.5,0.5)
                  SlideBar.Position = UDim2.new(0.5,0,0.5,0)
    
    
                  SlideButton.Name = "SlideButton"
                  SlideButton.Parent = SlideBar
                  SlideButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                  SlideButton.BorderSizePixel = 0
                  SlideButton.Position = UDim2.new(0.5, 0, -1.5, 0)
                  SlideButton.Size = UDim2.new(0, 10, 0, 26)
                  SlideButton.Font = Enum.Font.SourceSans
                  SlideButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                  SlideButton.TextSize = 14.000
                  SlideButton.TextTransparency = 1.000
    
                  MainFrame.Active = true
                  MainFrame.Draggable = true
    
                  local LayOut = 0
                  local CurrentAni = nil
                  local neg = false
    
    
                  function StopAnims()
                  for _,v in pairs(animations) do
                    v:Stop()
                  end
                  end
                  wait(0.4)
                  function LoadAnims()
                  for i,v in pairs(animations) do
                    local Anim = Instance.new("Animation", LoganWS)
                    Anim.AnimationId = "rbxassetid://"..v
                    animations[i] = plr.Character.Humanoid:LoadAnimation(Anim)
                    CreateButton(i)
                  end
                  end
    
                  function Snap(number, factor)
                  if factor == 0 then
                    return number
                  else
                    return math.floor(number/factor+0.5)*factor
                  end
                  end
    
                  function AutoScale()
                  local number = (#Container:GetChildren()-1)*38
                  number = number + (#Container:GetChildren()-1)*5
                  Container.CanvasSize = UDim2.new(0,0,0,number)
                  end
    
    
    
                  function CreateButton(AnimationName)
                  local ButtonClone = Button:Clone()
                  ButtonClone.LayoutOrder = LayOut
                  LayOut = LayOut + 1
                  ButtonClone.Parent = buttonHolder
                  ButtonClone.Name = AnimationName
                  ButtonClone.Text = AnimationName
                  ButtonClone.MouseButton1Click:Connect(function()
                    StopAnims()
                    CurrentAni = animations[ButtonClone.Name]
                    CurrentAni:Play()
                  end)
                  end
    
                  function FindAnim() 
                  local text = string.lower(SearchBox.Text)
                  if SearchBox.Text == "" or SearchBox.Text == nil then
                    for _,v in pairs(buttonHolder:GetChildren()) do
                      v.Parent = Container
                    end
                  else
                    for i,v in pairs(buttonHolder:GetChildren()) do
                      if string.find(string.lower(v.Name), text) then
                        v.Parent = Container
                      end
                    end
                    for i,v in pairs(Container:GetChildren()) do
                      if not string.find(string.lower(v.Name), text) and v.Name ~= "UIListLayout" then
                        v.Parent = buttonHolder
                      end
                    end
                  end
                  end
    
                  ReverseAnim.MouseButton1Click:Connect(function()
                  neg = not neg
                  end)
                  StopAnim.MouseButton1Click:Connect(StopAnims)
                  PauseAnim.MouseButton1Click:Connect(function()
                  plr.Character.Animate.Disabled = true
                  end)
                  ReplayAnim.MouseButton1Click:Connect(function()
                  plr.Character.Animate.Disabled = false
                  end)
    
                  local TS = game:GetService("TweenService")
                  local tweenclose = TS:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.new(0.135, 0, 0.03, 0)})
                  local tweenclose2 = TS:Create(titleFrame, TweenInfo.new(1), {Size = UDim2.new(1, 0, 1, 0)})
                  local tweenopen = TS:Create(MainFrame, TweenInfo.new(1), {Size = UDim2.new(0.135, 0, 0.6, 0)})
                  local tweenopen2 = TS:Create(titleFrame, TweenInfo.new(1), {Size = UDim2.new(1, 0, 0.05, 0)})
                  local open = true
                  Mini.MouseButton1Click:Connect(function()
                  if open then
                    Mini.Text = "o"
                    for _,v in pairs(MainFrame:GetChildren()) do
                      if v.Name ~= titleFrame.Name and not string.find(v.Name, "UI") then
                        v.Visible = false
                      end
                    end
                    tweenclose:Play()
                    tweenclose2:Play()
                  else
                    Mini.Text = "-"
                    for _,v in pairs(MainFrame:GetChildren()) do
                      if not string.find(v.Name, "UI") then
                        v.Visible = true
                      end
                    end
                    tweenopen:Play()
                    tweenopen2:Play()
                  end
                  open = not open
                  end)
    
                  LoadAnims()
    
                  local held = false
                  SlideButtonPos = SlideButton.Position
                  local UIS = game:GetService("UserInputService")
                  local RuS = game:GetService("RunService")
                  local step = 0.01
                  local percentage = 0
    
                  UIS.InputEnded:connect(function(input, processed)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    held = false
                  end
                  end)
    
                  SlideButton.MouseButton1Down:Connect(function()
                  held = true
                  end)
    
                  local con = RuS.RenderStepped:connect(function()
                  if held then
                    local MousePos = UIS:GetMouseLocation().X
                    local BtnPos = SlideButton.Position
                    local SliderSize = SlideBar.AbsoluteSize.X
                    local SliderPos = SlideBar.AbsolutePosition.X
                    local pos = Snap((MousePos-SliderPos)/SliderSize,step)
                    percentage = math.clamp(pos,0,0.96)
                    SlideButton.Position = UDim2.new(percentage,0,BtnPos.Y.Scale, BtnPos.Y.Offset)
                  end
                  local axis = SlideButton.Position.X.Scale*2
                  if neg then
                    axis = -axis
                  end
                  if CurrentAni ~= nil then
                    CurrentAni:AdjustSpeed(axis)
                  end
                  FindAnim()
                  AutoScale()
                  end)
    
                  Exit.MouseButton1Click:Connect(function()
                  StopAnims()
                  plr.Character.Animate.Disabled = false
                  Animations:Destroy()
                  LoganWS:Destroy()
                  con:Disconnect()
                  end)
                  end
                  end
    end)

    Credits:CreateButton("Credits To Shavine/da_goofy_groover. Animations.", function()
        setclipboard("da_goofy_groover")
    end)

    Server:CreateBox("Job ID", "string", function(JobID)
        JobIDs = JobID
    end)
    Server:CreateButton("Join Job ID", function(OPENS) 
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId , tostring(JobIDs) )
    end)
    Server:CreateButton("Copy Job ID", function(OPENS) 
    local placeId = game.JobId
    setclipboard(tostring(placeId)) 
    end)
    Server:CreateButton("Copy Game ID", function(OPENS) 
        local gameID = game.GameId
        setclipboard(tostring(gameID)) 
        end)
    Server:CreateButton("Server Hop", function(OPENS) 
--Server Hop Script cr.Magma Hub Src
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
--[[
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
]]
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 50;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

Teleport()
    end)
    
    
    local ServerList = {}
    
    
    local function getCurrentTime()
        return os.date("%Y-%m-%d %H:%M:%S")  
    end
    
    
    local function saveServerInfo(gameName, jobID, gameID)
        local currentTime = getCurrentTime()
    
        
        if #gameName > 7 then
            gameName = gameName:sub(1, 7) .. "..."
        end
    
        
        local serverInfoToStore = string.format("%s : %s : %s : %s", currentTime, gameName, jobID, gameID)
    
        
        local serverInfoForDropdown = string.format("%s : %s", currentTime, gameName)
    
        
        local existingServers = {}
        local success, err = pcall(function()
            if isfile("saved_servers.txt") then  
                local data = readfile("saved_servers.txt")
                for line in data:gmatch("[^\r\n]+") do
                    table.insert(existingServers, line)
                end
            else
                
                writefile("saved_seasdrvers.txt", "")
                
            end
        end)
    
        if not success then
            
            return false
        end
    
        
        for _, info in ipairs(existingServers) do
            if info:find(jobID, 1, true) then  
                return false  
            end
        end
    
        
        table.insert(ServerList, serverInfoForDropdown)  
        table.insert(existingServers, serverInfoToStore)  
    
        local successWrite, errWrite = pcall(function()
            writefile("saved_servers.txt", table.concat(existingServers, "\n"))
        end)
    
        if not successWrite then
            
            return false
        else
            
            return true
        end
    end
    
    
    local function getCurrentGameInfo()
        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        local jobID = game.JobId
        local gameID = game.PlaceId
        
        return gameName, jobID, gameID
    end
    
    
    local function removeDuplicates()
        local uniqueServers = {}
        local seen = {}
    
        for _, info in ipairs(ServerList) do
            if not seen[info] then
                seen[info] = true
                table.insert(uniqueServers, info)
            end
        end
    
        ServerList = uniqueServers
    end
    
    
    local function getJobIDAndGameIDByTimestamp(timestamp)
        local existingServers = {}
    
        local success, err = pcall(function()
            if isfile("saved_servers.txt") then  
                local data = readfile("saved_servers.txt")
                for line in data:gmatch("[^\r\n]+") do
                    table.insert(existingServers, line)
                end
            end
        end)
    
        if not success then
            
            return nil, nil
        end
    
        for _, info in ipairs(existingServers) do
            
            local storedTimestamp, storedJobID, storedGameID = info:match("^(%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d) : [^:]+ : ([^:]+) : (%d+)$")
            
            
            
            
            if storedTimestamp == timestamp then
                return storedJobID, storedGameID
            end
        end
    
        return nil, nil  
    end
    
    local dropdown = Server:CreateDropdown("Saved Servers", ServerList, function(CurrentServerListOption)
        local selectedTimestamp = CurrentServerListOption:match("^(%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d)")
        
        if selectedTimestamp then
            local jobID, gameID = getJobIDAndGameIDByTimestamp(selectedTimestamp)
    
            if jobID and gameID then
                local success, err = pcall(function()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(tonumber(gameID), jobID)
                end)
                if not success then
                    warn("Teleportation failed: " .. err)
                end
            end
        end
    end)
    
    
    local function refreshDropdown()
        dropdown:Refresh(ServerList)
    end
    
    
    local function loadSavedServers()
        local success, err = pcall(function()
            if isfile("saved_servers.txt") then  
                local data = readfile("saved_servers.txt")
                for line in data:gmatch("[^\r\n]+") do
                    
                    local timestamp, gameName = line:match("^(%S+ %S+) : ([^:]+)")
                    if timestamp and gameName then
                        table.insert(ServerList, string.format("%s : %s", timestamp, gameName))
                    end
                end
            else
                
                writefile("saved_servers.txt", "")
                
            end
        end)
    
        if not success then
            
        else
            
            removeDuplicates()  
        end
    
        refreshDropdown()
    end
    
    local function saveCurrentGameInfo()
        local gameName, jobID, gameID = getCurrentGameInfo()
        saveServerInfo(gameName, jobID, gameID)
    end
    
    loadSavedServers()
    removeDuplicates() 
    saveCurrentGameInfo() 
    
local IdleAnimations = {
        {Name = "Wicked Popular Idle", ID1 = "http://www.roblox.com/asset/?id=118832222982049", ID2 = "http://www.roblox.com/asset/?id=76049494037641"},
        {Name = "Catwalk Glam Idle", ID1 = "http://www.roblox.com/asset/?id=133806214992291", ID2 = "http://www.roblox.com/asset/?id=94970088341563"},
        {Name = "NFL Animation Idle", ID1 = "http://www.roblox.com/asset/?id=92080889861410", ID2 = "http://www.roblox.com/asset/?id=74451233229259"},
        {Name = "Bold Animation Idle", ID1 = "http://www.roblox.com/asset/?id=16738333868", ID2 = "http://www.roblox.com/asset/?id=16738334710"},
        {Name = "Adidas Sports Idle", ID1 = "http://www.roblox.com/asset/?id=18537376492", ID2 = "http://www.roblox.com/asset/?id=18537371272"},
        {Name = "No Boundaries Idle", ID1 = "http://www.roblox.com/asset/?id=18747067405", ID2 = "http://www.roblox.com/asset/?id=18747063918"},
        {Name = "Vampire Idle", ID1 = "http://www.roblox.com/asset/?id=1083445855", ID2 = "http://www.roblox.com/asset/?id=1083450166"},
        {Name = "Hero Idle", ID1 = "http://www.roblox.com/asset/?id=616111295", ID2 = "http://www.roblox.com/asset/?id=616113536"},
        {Name = "Zombie Idle", ID1 = "http://www.roblox.com/asset/?id=616158929", ID2 = "http://www.roblox.com/asset/?id=616160636"},
        {Name = "Mage Idle", ID1 = "http://www.roblox.com/asset/?id=707742142", ID2 = "http://www.roblox.com/asset/?id=707855907"},
        {Name = "Levitation Idle", ID1 = "http://www.roblox.com/asset/?id=616006778", ID2 = "http://www.roblox.com/asset/?id=616008087"},
        {Name = "Elder Idle", ID1 = "http://www.roblox.com/asset/?id=845397899", ID2 = "http://www.roblox.com/asset/?id=845400520"},
        {Name = "Astronaut Idle", ID1 = "http://www.roblox.com/asset/?id=891621366", ID2 = "http://www.roblox.com/asset/?id=891633237"},
        {Name = "Ninja Idle", ID1 = "http://www.roblox.com/asset/?id=656117400", ID2 = "http://www.roblox.com/asset/?id=656118341"},
        {Name = "Werewolf Idle", ID1 = "http://www.roblox.com/asset/?id=1083195517", ID2 = "http://www.roblox.com/asset/?id=1083214717"},
        {Name = "Cartoon Idle", ID1 = "http://www.roblox.com/asset/?id=742637544", ID2 = "http://www.roblox.com/asset/?id=742638445"},
        {Name = "Pirate Idle", ID1 = "http://www.roblox.com/asset/?id=750781874", ID2 = "http://www.roblox.com/asset/?id=750782770"},
        {Name = "Sneaky Idle", ID1 = "http://www.roblox.com/asset/?id=1132473842", ID2 = "http://www.roblox.com/asset/?id=1132477671"},
        {Name = "Toy Idle", ID1 = "http://www.roblox.com/asset/?id=782841498", ID2 = "http://www.roblox.com/asset/?id=782845736"},
        {Name = "Knight Idle", ID1 = "http://www.roblox.com/asset/?id=657595757", ID2 = "http://www.roblox.com/asset/?id=657568135"},
        {Name = "Confident Idle", ID1 = "http://www.roblox.com/asset/?id=1069977950", ID2 = "http://www.roblox.com/asset/?id=1069987858"},
        {Name = "PopStar Idle", ID1 = "http://www.roblox.com/asset/?id=1212900985", ID2 = "http://www.roblox.com/asset/?id=1212900985"},
        {Name = "Princess Idle", ID1 = "http://www.roblox.com/asset/?id=941003647", ID2 = "http://www.roblox.com/asset/?id=941013098"},
        {Name = "Cowboy Idle", ID1 = "http://www.roblox.com/asset/?id=1014390418", ID2 = "http://www.roblox.com/asset/?id=1014398616"},
        {Name = "Patrol Idle", ID1 = "http://www.roblox.com/asset/?id=1149612882", ID2 = "http://www.roblox.com/asset/?id=1150842221"},
        {Name = "Edited Zombie Idle", ID1 = "http://www.roblox.com/asset/?id=3489171152", ID2 = "http://www.roblox.com/asset/?id=3489171152"},
    }
    local function StopAnim()
        plr.Character.Animate.Disabled = false
        local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
        for _, track in pairs(animtrack) do
            track:Stop()
        end
    end
    
    local IdleList = {}
    
    
    for _, anim in ipairs(IdleAnimations) do
        table.insert(IdleList, anim.Name)
    end
    
    local selectedAnimID1, selectedAnimID2
    
    local dropdown = Animations:CreateDropdown("Animations", IdleList, function(CurrentIdleOption)
        local function StopAnim()
            plr.Character.Animate.Disabled = false
            local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
            for _, track in pairs(animtrack) do
                track:Stop()
            end
        end
    
        StopAnim()
        plr.Character.Animate.Disabled = true
    
    
        for _, anim in ipairs(IdleAnimations) do
            if anim.Name == CurrentIdleOption then
                selectedAnimID1 = anim.ID1
                selectedAnimID2 = anim.ID2
                break
            end
        end
    
    
        plr.Character.Animate.idle.Animation1.AnimationId = selectedAnimID1
        plr.Character.Animate.idle.Animation2.AnimationId = selectedAnimID2
        plr.Character.Animate.Disabled = false
        plr.Character.Humanoid:ChangeState(3)
    
    
    end)
    
    Animations:CreateToggle("Auto Idle", function(AutoIdle)
        getgenv().AutoIdles = AutoIdle
    
    
        local function onCharacterAdded(character)
            if selectedAnimID1 and selectedAnimID2 then
                if not (character.Animate.idle.Animation1.AnimationId == selectedAnimID1 or 
                         character.Animate.idle.Animation2.AnimationId == selectedAnimID2) then
                    StopAnim()
                    character.Animate.idle.Animation1.AnimationId = selectedAnimID1
                    character.Animate.idle.Animation2.AnimationId = selectedAnimID2
                    character.Animate.Disabled = false
                    character.Humanoid:ChangeState(3)
                end
            end
        end
    
    
        plr.CharacterAdded:Connect(onCharacterAdded)
    
    
        if plr.Character then
            onCharacterAdded(plr.Character)
        end
    
        while true do
            wait(0)
            if not getgenv().AutoIdles then
                _G.AutoIdlesss = false
                return
            end
    
            _G.AutoIdlesss = true
            local AutoIdlessss = nil
    
            AutoIdlessss = RunService.Stepped:Connect(function()
                task.spawn(function()
                    if selectedAnimID1 and selectedAnimID2 then
                        if plr.Character then
                            if not (plr.Character.Animate.idle.Animation1.AnimationId == selectedAnimID1 or 
                                     plr.Character.Animate.idle.Animation2.AnimationId == selectedAnimID2) then
                                StopAnim()
                                plr.Character.Animate.idle.Animation1.AnimationId = selectedAnimID1
                                plr.Character.Animate.idle.Animation2.AnimationId = selectedAnimID2
                                plr.Character.Animate.Disabled = false
                                plr.Character.Humanoid:ChangeState(3)
                            end
                        end
                    end
                end)
            end)
    
            repeat task.wait() until _G.AutoIdlesss == false
            AutoIdlessss:Disconnect()
        end
    end)
    
    
    
    
    
    local WalkAnimations = {
        {Name = "Wicked Walk", ID = "http://www.roblox.com/asset/?id=92072849924640"},
        {Name = "Catwalk Glam Walk", ID = "http://www.roblox.com/asset/?id=109168724482748"},
        {Name = "NFL Walk", ID = "http://www.roblox.com/asset/?id=110358958299415"},
        {Name = "Bold Walk", ID = "http://www.roblox.com/asset/?id=16738340646"},
        {Name = "Adidas Sports Walk", ID = "http://www.roblox.com/asset/?id=18537392113"},
        {Name = "No Boundaries Walk", ID = "http://www.roblox.com/asset/?id=18747074203"},
        {Name = "Vampire Walk", ID = "http://www.roblox.com/asset/?id=1083473930"},
        {Name = "Hero Walk", ID = "http://www.roblox.com/asset/?id=616122287"},
        {Name = "Zombie Walk", ID = "http://www.roblox.com/asset/?id=616168032"},
        {Name = "Mage Walk", ID = "http://www.roblox.com/asset/?id=707897309"},
        {Name = "Levitation Walk", ID = "http://www.roblox.com/asset/?id=616010382"}, 
        {Name = "Elder Walk", ID = "http://www.roblox.com/asset/?id=845403856"}, 
        {Name = "Astronaut Walk", ID = "http://www.roblox.com/asset/?id=891667138"},
        {Name = "Ninja Walk", ID = "http://www.roblox.com/asset/?id=656121766"},
        {Name = "Werewolf Walk", ID = "http://www.roblox.com/asset/?id=1083178339"},
        {Name = "Cartoon Walk", ID = "http://www.roblox.com/asset/?id=742640026"},
        {Name = "Pirate Walk", ID = "http://www.roblox.com/asset/?id=750785693"},
        {Name = "Sneaky Walk", ID = "http://www.roblox.com/asset/?id=1132510133"},
        {Name = "Toy Walk", ID = "http://www.roblox.com/asset/?id=782843345"},
        {Name = "Knight Walk", ID = "http://www.roblox.com/asset/?id=657552124"},
        {Name = "Confident Walk", ID = "http://www.roblox.com/asset/?id=1070017263"},
        {Name = "PopStar Walk", ID = "http://www.roblox.com/asset/?id=1212980338"},
        {Name = "Princess Walk", ID = "http://www.roblox.com/asset/?id=941028902"},
        {Name = "Cowboy Walk", ID = "http://www.roblox.com/asset/?id=1014421541"},
        {Name = "Patrol Walk", ID = "http://www.roblox.com/asset/?id=1151231493"},
        {Name = "Edited Zombie Walk", ID = "http://www.roblox.com/asset/?id=3489174223"},
    }
    
    
    local WalkList = {}
    
    
    for _, anim in ipairs(WalkAnimations) do
        table.insert(WalkList, anim.Name)
    end
    
    local selectedAnimID
    
    local dropdown = Animations:CreateDropdown("Walk Animations", WalkList, function(CurrentWalkOption)
        local function StopAnim()
            plr.Character.Animate.Disabled = false
            local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
            for _, track in pairs(animtrack) do
                track:Stop()
            end
        end
    
        StopAnim()
        plr.Character.Animate.Disabled = true
    
    
        for _, anim in ipairs(WalkAnimations) do
            if anim.Name == CurrentWalkOption then
                selectedAnimID = anim.ID
                break
            end
        end
    
    
        plr.Character.Animate.walk.WalkAnim.AnimationId = selectedAnimID
        plr.Character.Animate.run.RunAnim.AnimationId = selectedAnimID 
        plr.Character.Animate.Disabled = false
    end)
    
    Animations:CreateToggle("Auto Walk", function(AutoWalk)
        getgenv().AutoWalks = AutoWalk
    
    
        local function onCharacterAdded(character)
            local humanoid = character:WaitForChild("Humanoid")
    
    
            if humanoid then
                if character.Animate.idle.Animation1.AnimationId ~= selectedAnimID then
                    character.Animate.walk.WalkAnim.AnimationId = selectedAnimID
                end
            end
        end
    
    
        plr.CharacterAdded:Connect(onCharacterAdded)
    
    
        if plr.Character then
            onCharacterAdded(plr.Character)
        end
    
        while true do
            wait(0)
            if not getgenv().AutoWalks then
                _G.AutoWalks = false
                return
            end
    
            _G.AutoWalks = true
            local AutoWalkConnection = nil
    
            AutoWalkConnection = RunService.Stepped:Connect(function()
                task.spawn(function()
                    if plr.Character then
                        if selectedAnimID then
                            if not (plr.Character.Animate.idle.Animation1.AnimationId == selectedAnimID) then
                                plr.Character.Animate.walk.WalkAnim.AnimationId = selectedAnimID
                            end
                        end
                    end
                end)
            end)
    
            repeat task.wait() until _G.AutoWalks == false
            AutoWalkConnection:Disconnect()
        end
    end)
    local RunAnimations = {
        {Name = "Wicked Run", ID = "http://www.roblox.com/asset/?id=72301599441680"},
        {Name = "Catwalk Glam Run", ID = "http://www.roblox.com/asset/?id=117333533048078"},
        {Name = "NFL Run", ID = "http://www.roblox.com/asset/?id=117333533048078"},
        {Name = "Bold Run", ID = "http://www.roblox.com/asset/?id=16738337225"},
        {Name = "Adidas Sports Run", ID = "http://www.roblox.com/asset/?id=18537384940"},
        {Name = "No Boundaries Run", ID = "http://www.roblox.com/asset/?id=18747070484"},
        {Name = "Vampire Run", ID = "http://www.roblox.com/asset/?id=1083462077"},
        {Name = "Hero Run", ID = "http://www.roblox.com/asset/?id=616117076"},
        {Name = "Zombie Run", ID = "http://www.roblox.com/asset/?id=616163682"},
        {Name = "Mage Run", ID = "http://www.roblox.com/asset/?id=707861613"},
        {Name = "Levitation Run", ID = "http://www.roblox.com/asset/?id=616013216"}, 
        {Name = "Elder Run", ID = "http://www.roblox.com/asset/?id=845386501"}, 
        {Name = "Astronaut Run", ID = "http://www.roblox.com/asset/?id=891636393"},
        {Name = "Ninja Run", ID = "http://www.roblox.com/asset/?id=656118852"},
        {Name = "Werewolf Run", ID = "http://www.roblox.com/asset/?id=1083216690"},
        {Name = "Cartoon Run", ID = "http://www.roblox.com/asset/?id=742638842"},
        {Name = "Pirate Run", ID = "http://www.roblox.com/asset/?id=750783738"},
        {Name = "Sneaky Run", ID = "http://www.roblox.com/asset/?id=1132494274"},
        {Name = "Toy Run", ID = "http://www.roblox.com/asset/?id=782842708"},
        {Name = "Knight Run", ID = "http://www.roblox.com/asset/?id=657564596"},
        {Name = "Confident Run", ID = "http://www.roblox.com/asset/?id=1070001516"},
        {Name = "PopStar Run", ID = "http://www.roblox.com/asset/?id=1212980348"},
        {Name = "Princess Run", ID = "http://www.roblox.com/asset/?id=941015281"},
        {Name = "Cowboy Run", ID = "http://www.roblox.com/asset/?id=1014401683"},
        {Name = "Patrol Run", ID = "http://www.roblox.com/asset/?id=1150967949"},
        {Name = "Edited Zombie Run", ID = "http://www.roblox.com/asset/?id=3489173414"},
    }
    
    local RunList = {}
    
    
    for _, anim in ipairs(RunAnimations) do
        table.insert(RunList, anim.Name)
    end
    
    local selectedRunAnimID
    
    local dropdown = Animations:CreateDropdown("Run Animations", RunList, function(CurrentRunOption)
        local function StopAnim()
            plr.Character.Animate.Disabled = false
            local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
            for _, track in pairs(animtrack) do
                track:Stop()
            end
        end
    
        StopAnim()
        plr.Character.Animate.Disabled = true
    
    
        for _, anim in ipairs(RunAnimations) do
            if anim.Name == CurrentRunOption then
                selectedRunAnimID = anim.ID
                break
            end
        end
    
    
        plr.Character.Animate.run.RunAnim.AnimationId = selectedRunAnimID
        plr.Character.Animate.Disabled = false
    
    end)
    
    Animations:CreateToggle("Auto Run", function(AutoRun)
        getgenv().AutoRuns = AutoRun
    
    
        local function onCharacterAdded(character)
            local humanoid = character:WaitForChild("Humanoid")
    
    
            if humanoid then
                if character.Animate.idle.Animation1.AnimationId ~= selectedRunAnimID then
                    character.Animate.run.RunAnim.AnimationId = selectedRunAnimID
                end
            end
        end
    
    
        plr.CharacterAdded:Connect(onCharacterAdded)
    
    
        if plr.Character then
            onCharacterAdded(plr.Character)
        end
    
        while true do
            wait(0)
            if not getgenv().AutoRuns then
                _G.AutoRuns = false
                return
            end
    
            _G.AutoRuns = true
            local AutoRunConnection = nil
    
            AutoRunConnection = RunService.Stepped:Connect(function()
                task.spawn(function()
                    if plr.Character then
                        if selectedRunAnimID then
                            if not (plr.Character.Animate.idle.Animation1.AnimationId == selectedRunAnimID) then
                                plr.Character.Animate.run.RunAnim.AnimationId = selectedRunAnimID
                            end
                        end
                    end
                end)
            end)
    
            repeat task.wait() until _G.AutoRuns == false
            AutoRunConnection:Disconnect()
        end
    end)
    
    local JumpAnimations = {
        {Name = "Wicked Jump", ID = "http://www.roblox.com/asset/?id=104325245285198"},
        {Name = "Catwalk Glam Jump", ID = "http://www.roblox.com/asset/?id=116936326516985"},
        {Name = "NFL Jump", ID = "http://www.roblox.com/asset/?id=119846112151352"},
        {Name = "Bold Jump", ID = "http://www.roblox.com/asset/?id=16738336650"},
        {Name = "Adidas Sports Jump", ID = "http://www.roblox.com/asset/?id=18537380791"},
        {Name = "No Boundaries Jump", ID = "http://www.roblox.com/asset/?id=18747069148"},
        {Name = "Vampire Jump", ID = "http://www.roblox.com/asset/?id=1083455352"},
        {Name = "Hero Jump", ID = "http://www.roblox.com/asset/?id=616115533"},
        {Name = "Zombie Jump", ID = "http://www.roblox.com/asset/?id=616161997"},
        {Name = "Mage Jump", ID = "http://www.roblox.com/asset/?id=707853694"},
        {Name = "Levitation Jump", ID = "http://www.roblox.com/asset/?id=616008936"}, 
        {Name = "Elder Jump", ID = "http://www.roblox.com/asset/?id=845398858"}, 
        {Name = "Astronaut Jump", ID = "http://www.roblox.com/asset/?id=891627522"},
        {Name = "Ninja Jump", ID = "http://www.roblox.com/asset/?id=656117878"},
        {Name = "Werewolf Jump", ID = "http://www.roblox.com/asset/?id=1083218792"},
        {Name = "Cartoon Jump", ID = "http://www.roblox.com/asset/?id=742638842"},
        {Name = "Pirate Jump", ID = "http://www.roblox.com/asset/?id=750782230"},
        {Name = "Sneaky Jump", ID = "http://www.roblox.com/asset/?id=1132489853"},
        {Name = "Toy Jump", ID = "http://www.roblox.com/asset/?id=782847020"},
        {Name = "Knight Jump", ID = "http://www.roblox.com/asset/?id=658409194"},
        {Name = "Confident Jump", ID = "http://www.roblox.com/asset/?id=1069984524"},
        {Name = "PopStar Jump", ID = "http://www.roblox.com/asset/?id=1212954642"},
        {Name = "Princess Jump", ID = "http://www.roblox.com/asset/?id=941008832"},
        {Name = "Cowboy Jump", ID = "http://www.roblox.com/asset/?id=1014394726"},
        {Name = "Patrol Jump", ID = "http://www.roblox.com/asset/?id=1150944216"},
        {Name = "Edited Zombie Jump", ID = "http://www.roblox.com/asset/?id=616161997"},
    }
    
    local JumpList = {}
    
    
    for _, anim in ipairs(JumpAnimations) do
        table.insert(JumpList, anim.Name)
    end
    
    local selectedJumpAnimID
    
    local dropdown = Animations:CreateDropdown("Jump Animations", JumpList, function(CurrentJumpOption)
        local function StopAnim()
            plr.Character.Animate.Disabled = false
            local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
            for _, track in pairs(animtrack) do
                track:Stop()
            end
        end
    
        StopAnim()
        plr.Character.Animate.Disabled = true
    
    
        for _, anim in ipairs(JumpAnimations) do
            if anim.Name == CurrentJumpOption then
                selectedJumpAnimID = anim.ID
                break
            end
        end
    
    
        plr.Character.Animate.jump.JumpAnim.AnimationId = selectedJumpAnimID
        plr.Character.Animate.Disabled = false
    
    end)
    
    Animations:CreateToggle("Auto Jump", function(AutoJump)
        getgenv().AutoJumps = AutoJump
    
    
        local function onCharacterAdded(character)
            local humanoid = character:WaitForChild("Humanoid")
    
    
            if humanoid then
                if character.Animate.idle.Animation1.AnimationId ~= selectedJumpAnimID then
                    character.Animate.jump.JumpAnim.AnimationId = selectedJumpAnimID
                end
            end
        end
    
    
        plr.CharacterAdded:Connect(onCharacterAdded)
    
    
        if plr.Character then
            onCharacterAdded(plr.Character)
        end
    
        while true do
            wait(0)
            if not getgenv().AutoJumps then
                _G.AutoJumps = false
                return
            end
    
            _G.AutoJumps = true
            local AutoJumpConnection = nil
    
            AutoJumpConnection = RunService.Stepped:Connect(function()
                task.spawn(function()
                    if plr.Character then
                        if selectedJumpAnimID then
                            if not (plr.Character.Animate.idle.Animation1.AnimationId == selectedJumpAnimID) then
                                plr.Character.Animate.jump.JumpAnim.AnimationId = selectedJumpAnimID
                            end
                        end
                    end
                end)
            end)
    
            repeat task.wait() until _G.AutoJumps == false
            AutoJumpConnection:Disconnect()
        end
    end)
    
    local ClimbAnimations = {
        {Name = "Wicked Climb", ID = "http://www.roblox.com/asset/?id=131326830509784"},
        {Name = "Catwalk Glam Climb", ID = "http://www.roblox.com/asset/?id=119377220967554"},
        {Name = "NFL Climb", ID = "http://www.roblox.com/asset/?id=134630013742019"},
        {Name = "Bold Climb", ID = "http://www.roblox.com/asset/?id=16738332169"},
        {Name = "Adidas Sports Climb", ID = "http://www.roblox.com/asset/?id=18537363391"},
        {Name = "No Boundaries Climb", ID = "http://www.roblox.com/asset/?id=18747060903"},
        {Name = "Vampire Climb", ID = "http://www.roblox.com/asset/?id=1083439238"},
        {Name = "Hero Climb", ID = "http://www.roblox.com/asset/?id=616104706"},
        {Name = "Zombie Climb", ID = "http://www.roblox.com/asset/?id=616156119"},
        {Name = "Mage Climb", ID = "http://www.roblox.com/asset/?id=707826056"},
        {Name = "Levitation Climb", ID = "http://www.roblox.com/asset/?id=616003713"}, 
        {Name = "Elder Climb", ID = "http://www.roblox.com/asset/?id=845392038"}, 
        {Name = "Astronaut Climb", ID = "http://www.roblox.com/asset/?id=891609353"},
        {Name = "Ninja Climb", ID = "http://www.roblox.com/asset/?id=656114359"},
        {Name = "Werewolf Climb", ID = "http://www.roblox.com/asset/?id=1083182000"},
        {Name = "Cartoon Climb", ID = "http://www.roblox.com/asset/?id=742636889"},
        {Name = "Pirate Climb", ID = "http://www.roblox.com/asset/?id=750779899"},
        {Name = "Sneaky Climb", ID = "http://www.roblox.com/asset/?id=1132461372"},
        {Name = "Toy Climb", ID = "http://www.roblox.com/asset/?id=782843869"},
        {Name = "Knight Climb", ID = "http://www.roblox.com/asset/?id=658360781"},
        {Name = "Confident Climb", ID = "http://www.roblox.com/asset/?id=1069946257"},
        {Name = "PopStar Climb", ID = "http://www.roblox.com/asset/?id=1213044953"},
        {Name = "Princess Climb", ID = "http://www.roblox.com/asset/?id=940996062"},
        {Name = "Cowboy Climb", ID = "http://www.roblox.com/asset/?id=1014380606"},
        {Name = "Patrol Climb", ID = "http://www.roblox.com/asset/?id=1148811837"},
        {Name = "Edited Zombie Climb", ID = "http://www.roblox.com/asset/?id=616156119"},
    }
    
    local ClimbList = {}
    
    
    for _, anim in ipairs(ClimbAnimations) do
        table.insert(ClimbList, anim.Name)
    end
    
    local selectedClimbAnimID
    
    local dropdown = Animations:CreateDropdown("Climb Animations", ClimbList, function(CurrentClimbOption)
        local function StopAnim()
            plr.Character.Animate.Disabled = false
            local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
            for _, track in pairs(animtrack) do
                track:Stop()
            end
        end
    
        StopAnim()
        plr.Character.Animate.Disabled = true
    
    
        for _, anim in ipairs(ClimbAnimations) do
            if anim.Name == CurrentClimbOption then
                selectedClimbAnimID = anim.ID
                break
            end
        end
    
    
        plr.Character.Animate.climb.ClimbAnim.AnimationId = selectedClimbAnimID
        plr.Character.Animate.Disabled = false
    
    end)
    
    Animations:CreateToggle("Auto Climb", function(AutoClimb)
        getgenv().AutoClimbs = AutoClimb
    
    
        local function onCharacterAdded(character)
            local humanoid = character:WaitForChild("Humanoid")
    
    
            if humanoid then
                    if character.Animate.idle.Animation1.AnimationId ~= selectedClimbAnimID then
                        character.Animate.climb.ClimbAnim.AnimationId = selectedClimbAnimID
                    end
                end
            end
    
        
        plr.CharacterAdded:Connect(onCharacterAdded)
    
        
        if plr.Character then
            onCharacterAdded(plr.Character)
        end
    
        if not getgenv().AutoClimbs then
            _G.AutoClimbs = false
            return
        end
    
        _G.AutoClimbs = true
    
        local AutoClimbConnection = nil
    
        AutoClimbConnection = RunService.Stepped:Connect(function()
            task.spawn(function()
                if plr.Character then
                    if selectedClimbAnimID then
                        if not (plr.Character.Animate.idle.Animation1.AnimationId == selectedClimbAnimID) then
                            plr.Character.Animate.climb.ClimbAnim.AnimationId = selectedClimbAnimID
                        end
                    end
                end
            end)
        end)
    
        repeat task.wait() until _G.AutoClimbs == false
        AutoClimbConnection:Disconnect()
    end)
    
    
    local FallAnimations = {
        {Name = "Wicked Fall", ID = "http://www.roblox.com/asset/?id=121152442762481"},
        {Name = "Catwalk Glam Fall", ID = "http://www.roblox.com/asset/?id=92294537340807"},
        {Name = "NFL Fall", ID = "http://www.roblox.com/asset/?id=129773241321032"},
        {Name = "Bold Fall", ID = "http://www.roblox.com/asset/?id=16738333171"},
        {Name = "Adidas Sports Fall", ID = "http://www.roblox.com/asset/?id=18537367238"},
        {Name = "No Boundaries Fall", ID = "http://www.roblox.com/asset/?id=18747062535"},
        {Name = "Vampire Fall", ID = "http://www.roblox.com/asset/?id=1083443587"},
        {Name = "Hero Fall", ID = "http://www.roblox.com/asset/?id=616108001"},
        {Name = "Zombie Fall", ID = "http://www.roblox.com/asset/?id=616157476"},
        {Name = "Mage Fall", ID = "http://www.roblox.com/asset/?id=707829716"},
        {Name = "Levitation Fall", ID = "http://www.roblox.com/asset/?id=616005863"},
        {Name = "Elder Fall", ID = "http://www.roblox.com/asset/?id=845396048"},
        {Name = "Astronaut Fall", ID = "http://www.roblox.com/asset/?id=891617961"},
        {Name = "Ninja Fall", ID = "http://www.roblox.com/asset/?id=656115606"},
        {Name = "Werewolf Fall", ID = "http://www.roblox.com/asset/?id=1083189019"},
        {Name = "Cartoon Fall", ID = "http://www.roblox.com/asset/?id=742637151"},
        {Name = "Pirate Fall", ID = "http://www.roblox.com/asset/?id=750780242"},
        {Name = "Sneaky Fall", ID = "http://www.roblox.com/asset/?id=1132469004"},
        {Name = "Toy Fall", ID = "http://www.roblox.com/asset/?id=782846423"},
        {Name = "Knight Fall", ID = "http://www.roblox.com/asset/?id=657600338"},
        {Name = "Confident Fall", ID = "http://www.roblox.com/asset/?id=1069973677"},
        {Name = "PopStar Fall", ID = "http://www.roblox.com/asset/?id=1212900995"},
        {Name = "Princess Fall", ID = "http://www.roblox.com/asset/?id=941000007"},
        {Name = "Cowboy Fall", ID = "http://www.roblox.com/asset/?id=1014384571"},
        {Name = "Patrol Fall", ID = "http://www.roblox.com/asset/?id=1148863382"},
        {Name = "Edited Zombie Fall", ID = "http://www.roblox.com/asset/?id=616157476"},
}
    
    Universal:CreateButton("VC Unban", function()
        game:GetService("VoiceChatService"):joinVoice()
    end)
    Universal:CreateButton("Chat bypasser (set ur language to  Қазақ Тілі)", function()
        --Chat bypasser v1
    --[[
        WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
    ]]
    
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnnaRoblox/AnnaBypasser/refs/heads/main/AnnaBypasser.lua",true))()
    
    end)
    
    local FallList = {}
    
    
    for _, anim in ipairs(FallAnimations) do
        table.insert(FallList, anim.Name)
    end
    
    local selectedFallAnimID
    
    local dropdown = Animations:CreateDropdown("Fall Animations", FallList, function(CurrentFallOption)
        local function StopAnim()
            plr.Character.Animate.Disabled = false
            local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
            for _, track in pairs(animtrack) do
                track:Stop()
            end
        end
    
        StopAnim()
        plr.Character.Animate.Disabled = true
    
    
        for _, anim in ipairs(FallAnimations) do
            if anim.Name == CurrentFallOption then
                selectedFallAnimID = anim.ID
                break
            end
        end
    
    
        plr.Character.Animate.fall.FallAnim.AnimationId = selectedFallAnimID
        plr.Character.Animate.Disabled = false
    
    end)
    
    Animations:CreateToggle("Auto Fall", function(AutoFall)
        getgenv().AutoFalls = AutoFall
    
    
        local function onCharacterAdded(character)
            local humanoid = character:WaitForChild("Humanoid")
    
    
            if humanoid then
                if character.Animate.idle.Animation1.AnimationId ~= selectedFallAnimID then
                    character.Animate.fall.FallAnim.AnimationId = selectedFallAnimID
                end
            end
        end
    
    
        plr.CharacterAdded:Connect(onCharacterAdded)
    
    
        if plr.Character then
            onCharacterAdded(plr.Character)
        end
    
        while true do
            wait(0)
            if not getgenv().AutoFalls then
                _G.AutoFalls = false
                return
            end
    
            _G.AutoFalls = true
            local AutoFallConnection = nil
    
            AutoFallConnection = RunService.Stepped:Connect(function()
                task.spawn(function()
                    if plr.Character then
                        if selectedFallAnimID then
                            if not (plr.Character.Animate.idle.Animation1.AnimationId == selectedFallAnimID) then
                                plr.Character.Animate.fall.FallAnim.AnimationId = selectedFallAnimID
                            end
                        end
                    end
                end)
            end)
    
            repeat task.wait() until _G.AutoFalls == false
            AutoFallConnection:Disconnect()
        end
    end)

    Target:CreateBox("Target Name", "string", function(Targetnm)
        Targetnms = Targetnm
        local TargetPlayer = GetPlayer(Targetnms)
        if TargetPlayer then
        Message("Target", Targetnms, 5)
        else
        Message("Error!", "Target not found", 5)
        end
    end)

    local outline = Instance.new("Highlight")
    local target = nil
    local mouse = game.Players.LocalPlayer:GetMouse() 
    local lastClickTime = 0 
    local clickCount = 0 
    
    
    local function cleanup()
        outline.Parent = nil 
        target = nil 
        clickCount = 0 
    end
    local function activateTargetSelection()
        
        clickCount = 0
        lastClickTime = 0
    
        mouse.Button1Up:Connect(function()
            if getgenv().ClickTargetToggles and mouse.Target then
                local model = mouse.Target:FindFirstAncestorOfClass("Model")
                if model and model:FindFirstChild("Humanoid") then
                    
                    if target ~= model then
                        target = model
                        Targetnms = target.Name
                        Message("Target", Targetnms, 5)
                    end
                else
                    cleanup() 
                end
            end
        end)
    
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().ClickTargetToggles and mouse.Target then
                local model = mouse.Target:FindFirstAncestorOfClass("Model")
                if model and model:FindFirstChild("Humanoid") then
                    outline.Parent = model
                else
                    cleanup() 
                end
            else
                cleanup() 
            end
        end)
    end
    
    
    Target:CreateToggle("Select Target", function(ClickTargetToggle)
        getgenv().ClickTargetToggles = ClickTargetToggle
    
        if ClickTargetToggle then
            activateTargetSelection() 
            Message("Click", "A Player", 3)
        else
            cleanup() 
        end
    end)
    


Target:CreateButton("Go To Target", function()
    local TargetPlayer = GetPlayer(Targetnms)
    if TargetPlayer then
        plr.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
    else
        Message("Error Occurred", "Username Invalid", 5)
    end
end)


local isSpectating = false
local targetPlayer = nil

Target:CreateToggle("Spectate Target", function(SpecateTarget)
    getgenv().SpecateTargets = SpecateTarget

    
    while true do
        wait(0)  

        if not getgenv().SpecateTargets then
            
            isSpectating = false
            targetPlayer = nil
            
            local Character = plr.Character
            local HumanoidRP = Character and Character:FindFirstChild("HumanoidRootPart")
            
            
            if Character then
                if reanimated then
                    workspace.CurrentCamera.CameraSubject = plr.Character.Model.Humanoid
                else
                    workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
                end
            end
            return
        end

        local TargetPlayer = GetPlayer(Targetnms)

        if TargetPlayer then
            isSpectating = true
            targetPlayer = TargetPlayer
            
            
            while isSpectating do
                
                if not IsPlayerInGame(targetPlayer) then
                    Message("Player Left", "The player you were spectating has left the game.", 5)
                    workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
                    break
                end
                
                
                if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local THead = targetPlayer.Character:FindFirstChild("Head")
                    local THumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                    
                    if THead then
                        workspace.CurrentCamera.CameraSubject = THumanoid
                    elseif THumanoid then
                        workspace.CurrentCamera.CameraSubject = THead
                    end
                end
                
                wait(0) 
            end
        end
    end
end)

Target:CreateDropdown("Animation", TargetAnimation, function(TargetAnimationssss)
    mode = TargetAnimationssss
    print("Selected Animation Mode: " .. mode)
end)

function IsPlayerInGame(player)

            return true 
        end


        function IsPlayerInGame(player)

            return true 
        end


        function IsPlayerInGame(player)

            return true 
        end

        function GetMyCharacter()

            return plr.Character 
        end


        function IsPlayerInGame(player)

            return true 
end

    end

local function R15DropdownScripts() 
    
    dropdownOptions = {} 

    
    for _, name in pairs(SavedAnimationsFile) do
        table.insert(dropdownOptions, name)  
    end

    
    R15DropdownScript:Refresh(dropdownOptions)
end


while true do
    pcall(function()  
        loadConfig()
        R15DropdownScripts()  
    end)
    wait(1)  
end
