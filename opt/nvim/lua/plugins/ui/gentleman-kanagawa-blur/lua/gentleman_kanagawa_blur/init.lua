local M = {}

function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "gentleman-kanagawa-blur"
    require("gentleman_kanagawa_blur.highlights").setup()
end

M.setup = require("gentleman_kanagawa_blur.config").setup

return M
