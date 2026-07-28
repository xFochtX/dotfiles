local p = require("synthdreams.palette")

return {
	SnacksIndent = { fg = p.gray4 },
	SnacksIndentScope = { fg = p.orange },
	SnacksDashboardHeader = { fg = p.purple },
	SnacksDashboardDesc = { fg = p.fg_muted },
	SnacksDashboardKey = { fg = p.keyword, bold = true },
	SnacksDashboardIcon = { fg = p.fg_muted },
	SnacksDashboardFooter = { fg = p.purple, italic = true },
	SnacksDashboardSpecial = { fg = p.keyword, bold = true, italic = true },
}
