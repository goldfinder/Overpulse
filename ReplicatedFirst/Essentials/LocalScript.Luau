game:GetService("ReplicatedFirst"):WaitForChild("PendLoad"):Invoke()
local RunService = game:GetService("RunService")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local Players = game:GetService("Players")
local SC = Players.LocalPlayer
local DebugTable = {
	State=game:GetService("RunService"):IsStudio() and `DEVELOPMENT - {SC.UserId}` or "LIVE",
	Ping = function()
		return math.floor(SC:GetNetworkPing() * 1000)
	end,
	Players = function()
		return #Players:GetPlayers()
	end,
}

local DebugUI
if ReplicatedFirst:FindFirstChild("DebugUI") then
	if game:GetService("RunService"):IsStudio() then
		DebugUI = ReplicatedFirst:FindFirstChild("DebugUI"):Clone()
		DebugUI.Parent = game.Players.LocalPlayer.PlayerGui
		local UIText = DebugUI.UITEXT.Text
		if DebugUI:FindFirstChild("UITEXT") then
			UIText = string.gsub(UIText,"{STATE}",DebugTable.State)
		end
		RunService.RenderStepped:Connect(function(step)
			local rate = 60
			local currentFPS = 1/step
			local scale = rate/currentFPS
			local NewUIText = UIText
			NewUIText = string.gsub(NewUIText,"{FPS}",math.round(currentFPS*10)/10)
			NewUIText = string.gsub(NewUIText,"{RATE}",math.round(scale*100)/100)
			DebugUI.UITEXT.Text = NewUIText
		end)
	end
end
