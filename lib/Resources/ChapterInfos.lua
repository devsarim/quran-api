local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/resources/chapter_infos"

--- Get list of chaper info in different languages.
return function()
	return HttpGet(Url)
end
