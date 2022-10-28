local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/resources/recitations/%d/info"

--- Get information of a specific recitation. Could include detail about the reciter, recitation style. When and who recorded it etc.
-- @param recitationId The id of the recitation, see `Resources`.
return function(recitationId: number)
	assert(t.number(recitationId))

	return HttpGet(Url:format(recitationId))
end
