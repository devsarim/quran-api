local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_rub/%d?language=en&words=true"

--- Get all verses of a specific Rub number(1-240).
-- @param rubNumber The number of the Rub, ranging from 1 to 240.
return function(rubNumber: number)
	assert(t.numberConstrained(1, 240)(rubNumber))

	return HttpGet(Url:format(rubNumber))
end
