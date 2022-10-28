local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/by_key/%s?language=en&words=true"

return function(verseKey: string)
	assert(t.string(verseKey))

	return HttpGet(Url:format(verseKey))
end
