local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGetPaginated = require(script.Parent.Parent.HttpUtility.HttpGetPaginated)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_hizb/%d?language=en&words=true&per_page=10"

--- Get all verses from a specific Hizb( half(1-60).
-- @param hizbNumber The id of the hizb, ranging from 1 to 60.
return function(hibzNumber: number)
	assert(t.numberConstrained(1, 60)(hibzNumber))

	return HttpGetPaginated(Url:format(hibzNumber))
end
