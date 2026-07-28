local config = require("synthdreams.config")
local variant = config.variant or "blur"
local p = require("synthdreams.variant")(variant)

return {
	normal = {
		a = { fg = p.bg_dark, bg = p.lsp_reference_bg, gui = "bold" },
		b = { fg = p.fg, bg = p.gray2 },
		c = { fg = p.fg, bg = p.bg_dark },
	},
	command = { a = { fg = p.bg_dark, bg = p.diff_add_bg, gui = "bold" } },
	insert = { a = { fg = p.bg_dark, bg = p.surface2, gui = "bold" } },
	visual = { a = { fg = p.bg_dark, bg = p.diff_delete_bg, gui = "bold" } },
	terminal = { a = { fg = p.bg_dark, bg = p.cyan, gui = "bold" } },
	replace = { a = { fg = p.bg_dark, bg = p.orange, gui = "bold" } },
	inactive = {
		a = { fg = p.gray4, bg = p.bg_dark, gui = "bold" },
		b = { fg = p.gray4, bg = p.bg_dark },
		c = { fg = p.gray4, bg = p.bg_dark },
	},
}
