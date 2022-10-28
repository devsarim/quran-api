local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Default = "https://api.quran.com/api/v4/quran/tafsirs/%d"
local ByChapter = "https://api.quran.com/api/v4/quran/tafsirs/%d?chapter_number=%d"
local ByJuz = "https://api.quran.com/api/v4/quran/tafsirs/%d?juz_number=%d"
local ByPage = "https://api.quran.com/api/v4/quran/tafsirs/%d?page_number=%d"
local ByHizb = "https://api.quran.com/api/v4/quran/tafsirs/%d?hizb_number=%d"
local ByRub = "https://api.quran.com/api/v4/quran/tafsirs/%d?rub_number=%d"
local ByKey = "https://api.quran.com/api/v4/quran/tafsirs/%d?verse_key=%s"

local typecheck = t.tuple(
	t.number,
	t.optional(t.numberConstrained(1, 114)),
	t.optional(t.numberConstrained(1, 30)),
	t.optional(t.numberConstrained(1, 604)),
	t.optional(t.numberConstrained(1, 60)),
	t.optional(t.numberConstrained(1, 240)),
	t.optional(t.string)
)
return function(
	tafsirId: number,
	chapterNumber: number?,
	juzNumber: number?,
	pageNumber: number?,
	hizbNumber: number?,
	rubNumber: number?,
	verseKey: string
)
	assert(typecheck(tafsirId, chapterNumber, juzNumber, pageNumber, hizbNumber, rubNumber, verseKey))

	if chapterNumber then
		return HttpGet(ByChapter:format(tafsirId, chapterNumber))
	elseif juzNumber then
		return HttpGet(ByJuz:format(tafsirId, juzNumber))
	elseif pageNumber then
		return HttpGet(ByPage:format(tafsirId, pageNumber))
	elseif hizbNumber then
		return HttpGet(ByHizb:format(tafsirId, hizbNumber))
	elseif rubNumber then
		return HttpGet(ByRub:format(tafsirId, rubNumber))
	elseif verseKey then
		return HttpGet(ByKey:format(tafsirId, verseKey))
	end

	return HttpGet(Default:format(tafsirId))
end
