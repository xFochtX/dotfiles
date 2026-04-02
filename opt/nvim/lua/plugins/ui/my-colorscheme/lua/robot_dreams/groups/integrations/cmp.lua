local p = require("robot_dreams.palette")
return {
	CmpItemAbbrDeprecated = { fg = p.comment, strikethrough = true },
	CmpItemAbbrMatch = { fg = p.accent, bold = true },
	CmpItemAbbrMatchFuzzy = { fg = p.accent, bold = true },
	CmpItemMenu = { fg = p.comment_doc },
	CmpItemKindText = { fg = p.fg },
	CmpItemKindFunction = { fg = p.function_ },
	CmpItemKindVariable = { fg = p.variable },
	CmpItemKindEnum = { fg = p.enum },
	CmpItemKindSnippet = { fg = p.variant },
	CmpItemKindField = { fg = p.property },
	CmpItemKindConstant = { fg = p.constant },
	CmpItemKindMethod = { fg = p.function_ },
	CmpBorder = { fg = p.gray3 },
}
