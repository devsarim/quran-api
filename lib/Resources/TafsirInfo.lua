local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/resources/tafsirs/%d/info"

--- Get the information of a specific tafsir. Could include information about the author, when it was published etc.
-- @param tafsirId The id of the tafsir, see `Resources`.
return function(tafsirId: number)
	assert(t.number(tafsirId))

	return HttpGet(Url:format(tafsirId))
end
