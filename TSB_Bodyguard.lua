print("TSB Bodyguard script loaded!")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Create the bodyguard model
local bodyguard = Instance.new("Model")
bodyguard.Name = "Bodyguard"
bodyguard.Parent = game.Workspace

-- Create humanoid for the bodyguard
local humanoid = Instance.new("Humanoid")
humanoid.Parent = bodyguard

-- Create the bodyguard's part
local bodyguardPart = Instance.new
