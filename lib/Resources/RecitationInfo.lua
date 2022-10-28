local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/resources/recitations/%d/info"

return function(recitationId: number)
	assert(t.number(recitationId))

	return HttpGet(Url:format(recitationId))
end
