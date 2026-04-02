local palettes = {
	blur = {
		-- Fondo y transparencia
		bg_dark = "none",
		gray0 = "none",
		gray1 = "#191E28",
		gray2 = "#252526",
		gray3 = "#2D2D30",
		gray4 = "#3C3C3C",
		gray5 = "#54546D",
		
		surface0 = "#1C212C",
		surface1 = "#212536",
		surface2 = "#2A3142",
		
		lsp_reference_bg = "#2A3652",
		
		-- Texto principal
		fg = "#D4D4D4",
		black = "#000000",
		white = "#FFFFFF",
		fg_muted = "#808080",
		fg_placeholder = "#9CDCFE",
		fg_disabled = "#5A5A5A",
		accent = "#569CD6",
		paren_highlight = "#00BFFF",
		
		-- Colores base VS Code Dark+
		red = "#F44747",
		green = "#6A9955",
		yellow = "#DCDCAA",
		purple = "#C586C0",
		magenta = "#C586C0",
		orange = "#CE9178",
		blue = "#569CD6",
		cyan = "#4EC9B0",
		
		bright_black = "#808080",
		bright_red = "#F44747",
		bright_green = "#6A9955",
		bright_yellow = "#DCDCAA",
		bright_purple = "#C586C0",
		bright_magenta = "#C586C0",
		bright_orange = "#CE9178",
		bright_blue = "#569CD6",
		bright_cyan = "#4EC9B0",
		
		selection = "#264F78",
		
		-- Diffs
		diff_add_bg = "#1E3A2F",
		diff_change_bg = "#3A3020",
		diff_delete_bg = "#3A2020",
		diff_text_bg = "#3A3530",
		
		-- Syntax highlighting VS Code Dark+ style
		comment = "#5A6370",
		comment_doc = "#5A6370",
		constant = "#4FC1FF",
		constructor = "#DCDCAA",
		embedded = "#CE9178",
		emphasis = "#569CD6",
		enum = "#B5CEA8",
		function_ = "#B3E6FF",
		function_name = "#DCDCAA",
		hint = "#9CDCFE",
		keyword = "#569CD6",
		link_text = "#3794FF",
		link_uri = "#3794FF",
		number = "#B5CEA8",
		operator = "#4EC9B0",
		predictive = "#9CDCFE",
		predoc = "#57A64A",
		primary = "#CE9178",
		property = "#9CDCFE",
		punctuation = "#CE9178",
	  bracket = "#4EC9B0",
		delimiter = "#4EC9B0",
		string = "#D4D4D4",
		string_escape = "#D7BA7D",
		string_regex = "#D16969",
		string_special = "#D7BA7D",
		string_special_symbol = "#D7BA7D",
		tag = "#569CD6",
		text_literal = "#D7BA7D",
		title = "#DCDCAA",
		type = "#4EC9B0",
		type_interface = "#B5CEA8",
		type_super = "#4EC9B0",
		variable = "#CE9178",
		variable_member = "#CE9178",
		variable_parameter = "#9CDCFE",
		variable_special = "#4EC9B0",
		variant = "#C586C0",
		
		none = "NONE",
	},
}

return function(variant)
	return palettes[variant] or palettes.blur
end
