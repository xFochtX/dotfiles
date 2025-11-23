return {
  "RRethy/vim-illuminate",
  event = { "CursorHold", "CursorHoldI" },
  config = function()
    require("illuminate").configure({
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      delay = 120,
      filetypes_denylist = {
        "NvimTree",
        "neo-tree",
        "dashboard",
        "alpha",
        "help",
        "lazy",
        "mason",
      },
    })
  end,
}
