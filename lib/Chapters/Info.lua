local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/chapters/%d/info?language=en"

--- Get chapter info in specific language. Default to English.
-- @param chapterId The id of the chapter, ranging from 1 to 114.
return function(chapterId: number)
	assert(t.numberConstrained(1, 114)(chapterId))

	return HttpGet(Url:format(chapterId))
end
