local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGetPaginated = require(script.Parent.Parent.HttpUtility.HttpGetPaginated)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/search?size=20&language=en&q=%s"

return function(query: string)
	assert(t.string(query))

	return HttpGetPaginated(Url:format(query))
end
