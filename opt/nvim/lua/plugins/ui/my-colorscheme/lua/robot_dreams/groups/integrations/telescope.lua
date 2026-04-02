local p = require("robot_dreams.palette")

return {
	TelescopeBorder = { fg = p.bg_dark, bg = p.bg_dark },
	TelescopeNormal = { fg = p.fg, bg = p.bg_dark },
	TelescopePreviewTitle = { fg = p.bg_dark, bg = p.bg_dark },
	TelescopeResultsTitle = { fg = p.bg_dark, bg = p.bg_dark },
	TelescopePromptTitle = { fg = p.fg, bg = p.bg_dark, italic = true },
	TelescopePromptBorder = { fg = p.gray3, bg = p.bg_dark },
	TelescopePromptNormal = { fg = p.fg, bg = p.bg_dark },
	TelescopePromptCounter = { fg = p.gray4, bg = p.gray1 },
	TelescopeMatching = { fg = p.yellow, bold = true },
}
