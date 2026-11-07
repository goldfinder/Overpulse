local TranslationService = require(game:GetService("ReplicatedStorage").InternalTranslationKeys)
script.Parent.NametagManagers.DefaultNametagGet.OnInvoke = function(player)
	local TransKey = player:GetAttribute("Translation") or "EN"
	local TeamKey = player:GetAttribute("TeamName") or "TEAM.NULL"
	local ResolveTeam = TranslationService[TransKey][TeamKey]
	return {
		Name=player.Name,
		Team=ResolveTeam,
		Rank="",
		Division="",
		DivisionRank=""
	}
end
script.IsReady.OnInvoke = function() return true end
