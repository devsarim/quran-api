local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGetPaginated = require(script.Parent.Parent.HttpUtility.HttpGetPaginated)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_page/%d?language=en&words=true&per_page=10"

--- Get all verses of a specific Madani Mushaf page(1 to 604)
-- @param pageNumber Madani Mushaf page number, ranging from 1 to 604.
return function(pageNumber: number)
	assert(t.numberConstrained(1, 604)(pageNumber))

	return HttpGetPaginated(Url:format(pageNumber))
end
