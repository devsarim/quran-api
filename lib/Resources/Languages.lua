local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/resources/languages"

-- We have translations in multiple languages. You can fetch list of languages that has at least one translation.
return function()
	return HttpGet(Url)
end
