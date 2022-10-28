local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HttpGet = require(script.Parent.Parent.HttpUtility.HttpGet)
local t = require(ReplicatedStorage.Packages.t)

local Default = "https://api.quran.com/api/v4/quran/translations/%d"
local ByChapter = "https://api.quran.com/api/v4/quran/translations/%d?chapter_number=%d"
local ByJuz = "https://api.quran.com/api/v4/quran/translations/%d?juz_number=%d"
local ByPage = "https://api.quran.com/api/v4/quran/translations/%d?page_number=%d"
local ByHizb = "https://api.quran.com/api/v4/quran/translations/%d?hizb_number=%d"
local ByRub = "https://api.quran.com/api/v4/quran/translations/%d?rub_number=%d"
local ByKey = "https://api.quran.com/api/v4/quran/translations/%d?verse_key=%s"

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
	translationId: number,
	chapterNumber: number?,
	juzNumber: number?,
	pageNumber: number?,
	hizbNumber: number?,
	rubNumber: number?,
	verseKey: string
)
	assert(typecheck(translationId, chapterNumber, juzNumber, pageNumber, hizbNumber, rubNumber, verseKey))

	if chapterNumber then
		return HttpGet(ByChapter:format(translationId, chapterNumber))
	elseif juzNumber then
		return HttpGet(ByJuz:format(translationId, juzNumber))
	elseif pageNumber then
		return HttpGet(ByPage:format(translationId, pageNumber))
	elseif hizbNumber then
		return HttpGet(ByHizb:format(translationId, hizbNumber))
	elseif rubNumber then
		return HttpGet(ByRub:format(translationId, rubNumber))
	elseif verseKey then
		return HttpGet(ByKey:format(translationId, verseKey))
	end

	return HttpGet(Default:format(translationId))
end
