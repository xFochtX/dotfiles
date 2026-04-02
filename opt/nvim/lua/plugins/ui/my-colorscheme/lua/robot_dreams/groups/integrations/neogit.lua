local palette = require("robot_dreams.palette")
local u = require("robot_dreams.utils.color_utils")

local DARKEN_AMOUNT = 20

return {
	NeogitDiffDeleteHighlight = { bg = u.darken(palette.orange, DARKEN_AMOUNT), fg = palette.orange },
	NeogitDiffDelete = { bg = u.darken(palette.orange, DARKEN_AMOUNT), fg = palette.orange },
	NeogitDiffDeleteCursor = { bg = palette.orange, fg = u.darken(palette.orange, DARKEN_AMOUNT) },

	NeogitDiffAddHighlight = { bg = u.darken(palette.green, DARKEN_AMOUNT), fg = palette.green },
	NeogitDiffAdd = { bg = u.darken(palette.green, DARKEN_AMOUNT), fg = palette.green },
	NeogitDiffAddCursor = { bg = palette.green, fg = u.darken(palette.green, DARKEN_AMOUNT) },

	NeogitDiffContextHighlight = { bg = palette.gray2 },
	NeogitDiffContext = { bg = palette.bg_dark },

	NeogitHunkHeaderHighlight = { bg = palette.gray4, fg = palette.fg },
	NeogitHunkHeader = { bg = palette.gray2, fg = palette.fg },
	NeogitHunkHeaderCursor = { bg = palette.gray4, fg = palette.fg },

	NeogitCommitViewHeader = { bg = u.darken(palette.blue, DARKEN_AMOUNT), fg = palette.blue },
}
