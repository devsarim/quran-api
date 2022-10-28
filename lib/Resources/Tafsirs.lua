local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/resources/tafsirs?language=en"

--- Get list of available tafsirs.
return function()
	return HttpGet(Url)
end
