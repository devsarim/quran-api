local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local Promise = require(ReplicatedStorage.Packages.Promise)

local MaxTries = 5

return function(url: string)
	return Promise.new(function(res, rej)
		local tries = 0
		local success: boolean, jsonOrError: string

		repeat
			tries += 1
			success, jsonOrError = pcall(HttpService.GetAsync, HttpService, url)

			task.wait(1)
		until success or tries >= MaxTries

		if not success then
			rej("[HttpGet] Failed, " .. jsonOrError)
			return
		end

		res(HttpService:JSONDecode(jsonOrError))
	end)
end
