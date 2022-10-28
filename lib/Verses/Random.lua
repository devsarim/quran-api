local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Url = "https://api.quran.com/api/v4/verses/random?language=en&words=true"

--- Get a random verse. You can get random verse by `chapter`, `page`, `juz`, `hizb`, `rub`, or from whole `Quran`.
return function()
	return HttpGet(Url)
end
