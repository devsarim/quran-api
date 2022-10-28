local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/resources/recitations?language=en"

--- Get list of available Recitations.
return function()
	return HttpGet(Url)
end
