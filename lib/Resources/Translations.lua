local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/resources/translations"

--- Get list of available translations.
return function()
	return HttpGet(Url)
end
