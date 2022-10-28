local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/resources/chapter_reciters?language=en"

--- Get list of chapter reciters.
return function()
	return HttpGet(Url)
end
