local palette = require("robot-dreams.palette")
local groups = require("robot-dreams.groups")

local M = {}

function M.load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.opt.termguicolors = true
  vim.opt.background = "dark"

  groups.apply(palette.colors)
end

return M
