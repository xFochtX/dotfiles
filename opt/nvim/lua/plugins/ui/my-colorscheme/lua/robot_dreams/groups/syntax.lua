local p = require("robot_dreams.palette")
local config = require("robot_dreams.config")
local styles = vim.tbl_map(function(value)
	return setmetatable(value, {
		__add = function(a, b)
			return vim.tbl_extend("force", a, b)
		end,
	})
end, config.styles)

return {
	Comment = { fg = p.comment, italic = true } + styles.comments,
	Constant = { fg = p.constant },
	String = { fg = p.string },
	Character = { fg = p.string },
	Number = { fg = p.number },
	Boolean = { fg = p.constant } + styles.booleans,
	Float = { fg = p.number },
	Identifier = { fg = p.variable } + styles.identifiers,
	Function = { fg = p.function_ } + styles.functions,
	["@keyword.function"] = { fg = p.function_ }, -- def en Python
	["@function"] = { fg = p.function_name },
	Statement = { fg = p.primary },
	Conditional = { fg = p.keyword },
	Repeat = { fg = p.keyword },
	Label = { fg = p.keyword },
	Operator = { fg = p.operator },
	Keyword = { fg = p.keyword } + styles.keywords,
	Exception = { fg = p.keyword },
	PreProc = { fg = p.keyword },
	Include = { fg = p.keyword },
	Define = { fg = p.keyword },
	Macro = { fg = p.keyword },
	PreCondit = { fg = p.keyword },
	Type = { fg = p.type },
	StorageClass = { fg = p.type },
	Structure = { fg = p.type },
	Typedef = { fg = p.type },
	Special = { fg = p.orange },
	SpecialChar = { fg = p.string_special },
	Tag = { fg = p.keyword },
	SpecialComment = { fg = p.comment_doc },
	Debug = { fg = p.hint },
	Underlined = { underline = true },
	Error = { fg = p.red },
	Todo = { fg = p.purple, bold = true },
	-- HTML
	htmlArg = { fg = p.cyan, italic = true },
	htmlEndTag = { fg = p.fg },
	htmlTag = { fg = p.keyword },
	htmlTagN = { fg = p.keyword },
	htmlTagName = { fg = p.keyword },
	htmlTitle = { fg = p.fg },
	-- Diff
	diffAdded = { fg = p.green },
	diffRemoved = { fg = p.red },
	diffChanged = { fg = p.orange },
	diffOldFile = { fg = p.yellow },
	diffNewFile = { fg = p.green },
	diffFile = { fg = p.cyan },
	diffLine = { fg = p.keyword },
	diffIndexLine = { fg = p.gray4 },
}
