local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)

local Url = "https://api.quran.com/api/v4/resources/recitation_styles"

--- Get the available recitation styles.
return function()
	return HttpGet(Url)
end
