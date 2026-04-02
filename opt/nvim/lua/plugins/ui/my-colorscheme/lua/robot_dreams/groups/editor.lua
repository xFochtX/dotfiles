local p = require("robot_dreams.palette")

return {
	-- Fondo y texto principal
	Normal = { fg = p.fg, bg = p.bg_dark },
	NormalNC = { fg = p.fg, bg = p.bg_dark },
	NormalFloat = { fg = p.fg, bg = p.gray0 },

	-- Elementos de UI
	ColorColumn = { bg = p.gray1 },
	CursorLine = { bg = "NONE" },
	Conceal = { fg = p.gray1 },
	SignColumn = { bg = p.bg_dark, fg = p.fg_muted },
	FoldColumn = { bg = p.bg_dark, fg = p.fg_muted },
	VertSplit = { fg = p.gray2 },
	WinSeparator = { fg = p.gray2 },
	EndOfBuffer = { fg = p.bg_dark },

	-- Cursor y selección
	Cursor = { fg = p.black, bg = p.fg },
	lCursor = { fg = p.black, bg = p.fg },
	CursorIM = { fg = p.black, bg = p.fg },
	Visual = { bg = p.selection, bold = true },
	VisualNOS = { bg = p.surface1 },

	-- Directorios y títulos
	Directory = { fg = p.blue },
	Title = { fg = p.green },

	-- Diffs y Git
	DiffAdd = { bg = p.diff_add_bg, fg = p.bright_green },
	DiffChange = { bg = p.diff_change_bg, fg = p.yellow },
	DiffDelete = { bg = p.diff_delete_bg, fg = p.bright_orange },
	DiffText = { bg = p.diff_text_bg, fg = p.bright_yellow },

	-- Mensajes
	ErrorMsg = { fg = p.red },
	WarningMsg = { fg = p.yellow },
	ModeMsg = { fg = p.gray3, bold = true },
	MoreMsg = { fg = p.purple },
	Question = { fg = p.blue },

	-- Número de línea
	LineNr = { fg = p.gray5 },
	CursorLineNr = { fg = p.accent },

	-- Pmenu
	Pmenu = { fg = p.fg, bg = p.black },
	PmenuSel = { fg = p.white, bg = p.surface1, bold = true },
	PmenuSbar = { bg = p.gray2 },
	PmenuThumb = { bg = p.gray3 },

	-- Búsqueda
	Search = { fg = p.accent, bg = p.surface1 },
	IncSearch = { fg = p.black, bg = p.accent },
	CurSearch = { fg = p.black, bg = p.accent },

	-- Otros
	Folded = { fg = p.gray4 },
	MatchParen = { fg = p.paren_highlight, bg = p.surface1, bold = true },
	NonText = { fg = p.fg_muted },
	FloatBorder = { fg = p.gray5, bg = p.bg_dark },
	QuickFixLine = { fg = p.red, bg = p.surface1, bold = true },
	SpecialKey = { fg = p.fg_muted },
	SpellBad = { fg = p.red, bg = p.surface0 },
	SpellCap = { fg = p.accent, bg = p.surface0 },
	SpellLocal = { fg = p.accent, bg = p.surface0 },
	SpellRare = { fg = p.accent, bg = p.surface0 },

	-- Barra de estado y pestañas
	StatusLine = { fg = p.fg, bg = p.bg_dark },
	StatusLineNC = { fg = p.fg_muted, bg = p.bg_dark },
	StatusLineTerm = { fg = p.fg, bg = p.gray1 },
	StatusLineTermNC = { fg = p.fg_muted, bg = p.bg_dark },
	TabLine = { fg = p.fg_muted },
	TabLineFill = { bg = p.black },
	TabLineSel = { fg = p.fg },

	-- Terminal
	Terminal = { fg = p.fg, bg = p.black },

	-- Winbar
	Winbar = { fg = p.fg, bg = p.gray1 },
	WinbarNC = { fg = p.fg_muted, bg = p.bg_dark },

	-- Estilo Italic
	Italic = { fg = p.blue, italic = true },
	WildMenu = { fg = p.black, bg = p.purple },
}
