local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGetPaginated = require(script.Parent.Parent.HttpUtility.HttpGetPaginated)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_chapter/%d?language=en&words=true&per_page=10"

--- Get list of verse(s) by Chapter / Surah number.
-- @param chapterId The id of the chapter, ranging from 1 to 114.
return function(chapterId: number)
	assert(t.numberConstrained(1, 114)(chapterId))

	return HttpGetPaginated(Url:format(chapterId))
end
