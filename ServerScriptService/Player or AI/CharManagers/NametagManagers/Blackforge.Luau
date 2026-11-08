local module = {}
module.__index = module

module.GetGroup = function(plr)
	return require(game:GetService("ReplicatedStorage").BetterGeneralizedServices.GroupService)(plr,{Id=776920143,DivisionNumber=0})
end

module.GetNametag = function(plr)
	local data:{Name:string,Team:string,Rank:string,Division:string,DivisionRank:string} = script.Parent.DefaultNametagGet:Invoke(plr)
	data.Rank = `BLACKFORGE_{module.GetGroup(plr).Rank}`
	return data
end

return module
