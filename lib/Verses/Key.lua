local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_key/%s?language=en&words=true"

--- Get a specific ayah with key. Key is combination of surah number and ayah number. 1:1 is first ayah of first surah for example.
-- 10:5 is 5th ayah of 101th surah.
-- @param verseKey The key of the verse, `chapter:verse`.
return function(verseKey: string)
	assert(t.string(verseKey))

	return HttpGet(Url:format(verseKey))
end
