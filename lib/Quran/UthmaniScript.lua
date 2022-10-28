local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Default = "https://api.quran.com/api/v4/quran/verses/uthmani"
local ByChapter = "https://api.quran.com/api/v4/quran/verses/uthmani?chapter_number=%d"
local ByJuz = "https://api.quran.com/api/v4/quran/verses/uthmani?juz_number=%d"
local ByPage = "https://api.quran.com/api/v4/quran/verses/uthmani?page_number=%d"
local ByHizb = "https://api.quran.com/api/v4/quran/verses/uthmani?hizb_number=%d"
local ByRub = "https://api.quran.com/api/v4/quran/verses/uthmani?rub_number=%d"
local ByKey = "https://api.quran.com/api/v4/quran/verses/uthmani?verse_key=%s"

local typecheck = t.tuple(
	t.optional(t.numberConstrained(1, 114)),
	t.optional(t.numberConstrained(1, 30)),
	t.optional(t.numberConstrained(1, 604)),
	t.optional(t.numberConstrained(1, 60)),
	t.optional(t.numberConstrained(1, 240)),
	t.optional(t.string)
)

--- Get Uthmani script of ayah. Use query strings to filter results, leave all query string blank if you want to fetch Uthmani script of whole Quran.
-- @param[opt] chapterNumber The number of the chapter, ranging from 1 to 114.
-- @param[opt] juzNumber The number of the Juz, ranging from 1 to 30.
-- @param[opt] pageNumber The page number of Madani Mushaf, ranging from 1 to 604.
-- @param[opt] hizbNumber The number of the Hizb, ranging from 1 to 60.
-- @param[opt] rubNumber The number of the Rub, ranging from 1 to 240.
-- @param[opt] verseKey The key of the verse, `chapter:verse`.
return function(
	chapterNumber: number?,
	juzNumber: number?,
	pageNumber: number?,
	hizbNumber: number?,
	rubNumber: number?,
	verseKey: string
)
	assert(typecheck(chapterNumber, juzNumber, pageNumber, hizbNumber, rubNumber, verseKey))

	if chapterNumber then
		return HttpGet(ByChapter:format(chapterNumber))
	elseif juzNumber then
		return HttpGet(ByJuz:format(juzNumber))
	elseif pageNumber then
		return HttpGet(ByPage:format(pageNumber))
	elseif hizbNumber then
		return HttpGet(ByHizb:format(hizbNumber))
	elseif rubNumber then
		return HttpGet(ByRub:format(rubNumber))
	elseif verseKey then
		return HttpGet(ByKey:format(verseKey))
	end

	return HttpGet(Default)
end
