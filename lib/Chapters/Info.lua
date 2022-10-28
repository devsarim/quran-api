local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/chapters/%d/info?language=en"

return function(chapterId: number)
	assert(t.numberConstrained(1, 114)(chapterId))

	return HttpGet(Url:format(chapterId))
end
