local module = {}

module.__index = module

module.GetNametag = function(plr)
	local data = script.Parent.DefaultNametagGet:Invoke(plr)
end

return module
