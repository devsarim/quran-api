local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/chapters?language=en"

return function()
	return HttpGet(Url)
end
