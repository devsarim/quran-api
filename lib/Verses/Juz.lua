local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGetPaginated = require(script.Parent.Parent.HttpUtility.HttpGetPaginated)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_juz/%d?language=en&words=true&page=1&per_page=10"

return function(juzNumber: number)
	assert(t.numberConstrained(1, 30)(juzNumber))

	return HttpGetPaginated(Url:format(juzNumber))
end
