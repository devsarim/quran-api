local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Default = "https://api.quran.com/api/v4/quran/verses/indopak"
local ByChapter = "https://api.quran.com/api/v4/quran/verses/indopak?chapter_number=%d"
local ByJuz = "https://api.quran.com/api/v4/quran/verses/indopak?juz_number=%d"
local ByPage = "https://api.quran.com/api/v4/quran/verses/indopak?page_number=%d"
local ByHizb = "https://api.quran.com/api/v4/quran/verses/indopak?hizb_number=%d"
local ByRub = "https://api.quran.com/api/v4/quran/verses/indopak?rub_number=%d"
local ByKey = "https://api.quran.com/api/v4/quran/verses/indopak?verse_key=%s"

local typecheck = t.tuple(
	t.optional(t.numberConstrained(1, 114)),
	t.optional(t.numberConstrained(1, 30)),
	t.optional(t.numberConstrained(1, 604)),
	t.optional(t.numberConstrained(1, 60)),
	t.optional(t.numberConstrained(1, 240)),
	t.optional(t.string)
)
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
