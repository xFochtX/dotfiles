local p = require("gentleman_kanagawa_blur.palette")

return {
	MiniFilesBorder = { link = "FloatBorder" },
	MiniFilesBorderModified = { fg = p.blue }, -- Assuming p.blue is now the Kanagawa Wave blue
	MiniFilesCursorLine = { link = "CursorLine" },
	MiniFilesDirectory = { link = "Directory" },
	MiniFilesFile = { fg = p.fg },
	MiniFilesNormal = { link = "NormalFloat" },
	MiniFilesTitle = { fg = p.variable }, -- Mapped from the previous p.red
	MiniFilesTitleFocused = { fg = p.fg, bold = true },
}
