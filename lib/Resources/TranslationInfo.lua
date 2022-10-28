local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/resources/translations/%d/info"

return function(translationId: number)
	assert(t.number(translationId))

	return HttpGet(Url:format(translationId))
end
