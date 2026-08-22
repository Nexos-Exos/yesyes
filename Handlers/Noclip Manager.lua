local Noclip = {}
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
local QueryDescendants = game.QueryDescendants
local RunService = FindFirstChildWhichIsA(game, "RunService")
local Heartbeat = RunService.Heartbeat

local Players = FindFirstChildWhichIsA(game, "Players")
local Player = Players.LocalPlayer
local Character = Player.Character

local BodyParts = {
  "Head",
  "Torso",
  "Right Leg",
  "Left Leg",
  "Right Arm",
  "Left Arm"
}

Player.CharacterAdded:Connect(function()
  task.wait(1)
  local New_Char = Player.Character or Player.CharacterAdded:Wait()
  
  Character = New_Char
end)

function Noclip:Enable()
  print("Noclip Enabled")
  Noclip.On = true
  
  Noclip.Connection = Heartbeat:Connect(function()
    if Noclip.On then
      for i, v in next, QueryDescendants(Character, "BasePart") do
        v.CanCollide = false
      end
    end
  end)
end

function Noclip:Disable()
  print("Noclip Disabled")
  Noclip.On = false
  Noclip.Connection:Disconnect()
  
  for i, v in next, QueryDescendants(Character, "BasePart") do
    if not table.find(BodyParts, v.Name) then v.CanCollide = true end
  end
end

return Noclip
