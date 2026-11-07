local x = game:GetService("StarterGui")
x:SetCoreGuiEnabled(Enum.CoreGuiType.All,false)
game:GetService("ReplicatedFirst"):WaitForChild("PendLoad"):Invoke()
local UIData = game.ReplicatedStorage.GetUIData:InvokeServer(game.Players.LocalPlayer)
