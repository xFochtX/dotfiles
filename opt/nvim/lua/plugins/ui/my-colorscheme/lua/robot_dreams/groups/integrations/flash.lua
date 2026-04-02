local p = require("robot_dreams.palette")
return {
	FlashLabel = { fg = p.variable, bg = p.bg_dark, bold = true },
	FlashBackdrop = { fg = p.comment_doc },
	FlashMatch = { fg = p.accent, bg = p.bg_dark },
	FlashCurrent = { fg = p.cyan, bg = p.bg_dark },
	FlashPrompt = { bg = p.bg_dark },
}
