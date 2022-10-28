local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local Promise = require(ReplicatedStorage.Packages.Promise)

local MaxTries = 5

return function(url: string)
	return Promise.new(function(res, rej)
		local currentPage = 1
		local pages = {}

		repeat
			local tries = 0
			local success: boolean, jsonOrError: string

			repeat
				tries += 1
				success, jsonOrError = pcall(HttpService.GetAsync, HttpService, url .. "&page=" .. currentPage)

				task.wait(1)
			until success or tries >= MaxTries

			if not success then
				rej("[HttpGet] Failed, " .. jsonOrError)
				return
			end

			local data = HttpService:JSONDecode(jsonOrError)
			table.insert(pages, data)

			currentPage = data.pagination.next_page
		until not currentPage

		res(pages)
	end)
end
