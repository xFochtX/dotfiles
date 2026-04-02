local p = require("robot_dreams.palette")

return {
	MasonHeader = { fg = p.fg, bg = p.bg_dark, bold = true },
	MasonHeaderSecondary = { fg = p.fg, bg = p.bg_dark, bold = true },

	MasonHighlight = { fg = p.green },
	MasonHighlightBlock = { bg = p.green, fg = p.bg_dark, bold = true },
	MasonHighlightBlockBold = { bg = p.blue, fg = p.bg_dark, bold = true },

	MasonHighlightSecondary = { fg = p.purple },
	MasonHighlightBlockSecondary = { fg = p.red, bg = p.blue },
	MasonHighlightBlockBoldSecondary = { fg = p.bg_dark, bg = p.fg, bold = true },

	MasonLink = { fg = p.cyan },

	MasonMuted = { fg = p.fg_muted },
	MasonMutedBlock = { bg = p.bg_dark, fg = p.fg_muted, bold = true },
	MasonMutedBlockBold = { bg = p.yellow, fg = p.bg_dark, bold = true },

	MasonError = { fg = p.red },
	MasonWarning = { fg = p.yellow },

	MasonHeading = { fg = p.purple, bold = true },
}
