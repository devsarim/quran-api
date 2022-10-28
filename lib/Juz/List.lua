local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/juzs"

--- Get list of all Juz.
return function()
	return HttpGet(Url)
end
