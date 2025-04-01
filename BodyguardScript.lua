local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Create Bodyguard Model
local Bodyguard = Instance.new("Model", workspace)
Bodyguard.Name = "Bodyguard"

-- Create Humanoid
local Humanoid = Instance.new("Humanoid", Bodyguard)
Humanoid.Health = 1000 -- High HP

-- Create Root Part
local RootPart = Instance.new("Part", Bodyguard)
RootPart.Size = Vector3.new(2, 3, 1)
RootPart.Position = HumanoidRootPart.Position + Vector3.new(3, 0, 0)
RootPart.Anchored = false
RootPart.CanCollide = false
RootPart.Name = "HumanoidRootPart"

-- Attach Humanoid to RootPart
Humanoid.RootPart = RootPart

-- Function to Follow Player
local function FollowPlayer()
    while true do
        if HumanoidRootPart and RootPart then
            RootPart.Position = HumanoidRootPart.Position + Vector3.new(3, 0, 0)
        end
        wait(0.1)
    end
end

-- Function to Attack Anyone Who Hits the Player
Character.Humanoid.HealthChanged:Connect(function()
    local LastAttacker = Character.Humanoid:GetAttribute("LastAttacker") -- Some games track attackers
    if LastAttacker and LastAttacker.Parent then
        local Enemy = LastAttacker.Parent
        while Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 do
            RootPart.Position = Enemy.HumanoidRootPart.Position + Vector3.new(0, 0, -2) -- Move towards the enemy
            Enemy.Humanoid:TakeDamage(20) -- Adjust damage
            wait(0.5)
        end
    end
end)

-- Start Following Player
task.spawn(FollowPlayer)
