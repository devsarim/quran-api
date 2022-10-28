local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_rub/%d?language=en&words=true"

return function(rubNumber: number)
	assert(t.numberConstrained(1, 240)(rubNumber))

	return HttpGet(Url:format(rubNumber))
end
