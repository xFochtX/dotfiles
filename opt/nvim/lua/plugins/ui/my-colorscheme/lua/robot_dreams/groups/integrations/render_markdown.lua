local p = require("robot_dreams.palette")
local u = require("robot_dreams.utils.color_utils")
local DARKEN_AMOUNT = 20
return {
	RenderMarkdownCode = { bg = p.gray1 },
	RenderMarkdownCodeInline = { fg = p.orange, bold = true },
	RenderMarkdownBullet = { fg = p.cyan },
	RenderMarkdownH1Bg = { bg = u.darken(p.title, DARKEN_AMOUNT), fg = p.title },
	RenderMarkdownH2Bg = { bg = u.darken(p.fg, DARKEN_AMOUNT), fg = p.fg },
	RenderMarkdownH3Bg = { bg = u.darken(p.accent, DARKEN_AMOUNT), fg = p.accent },
	RenderMarkdownH4Bg = { bg = u.darken(p.keyword, DARKEN_AMOUNT), fg = p.keyword },
	RenderMarkdownH5Bg = { bg = u.darken(p.type, DARKEN_AMOUNT), fg = p.type },
	RenderMarkdownH6Bg = { bg = u.darken(p.variant, DARKEN_AMOUNT), fg = p.variant },
	RenderMarkdownH1 = { bg = u.darken(p.title, DARKEN_AMOUNT), fg = p.title },
	RenderMarkdownH2 = { bg = u.darken(p.fg, DARKEN_AMOUNT), fg = p.fg },
	RenderMarkdownH3 = { bg = u.darken(p.accent, DARKEN_AMOUNT), fg = p.accent },
	RenderMarkdownH4 = { bg = u.darken(p.keyword, DARKEN_AMOUNT), fg = p.keyword },
	RenderMarkdownH5 = { bg = u.darken(p.type, DARKEN_AMOUNT), fg = p.type },
	RenderMarkdownH6 = { bg = u.darken(p.variant, DARKEN_AMOUNT), fg = p.variant },
	RenderMarkdownTableHead = { fg = p.comment },
	RenderMarkdownTableRow = { fg = p.comment_doc },
}
