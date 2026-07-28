local p = require("synthdreams.palette")
return {
	AlphaHeader = { fg = p.title, bg = p.bg },
	AlphaFooter = { fg = p.comment_doc, bg = p.bg, italic = true },
	AlphaShortcut = { fg = p.enum, italic = true },
}
