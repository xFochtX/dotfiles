return {
  "catgoose/nvim-colorizer.lua",
  opts = {
    filetypes = { "*" },
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = false,
      css = false,
      RRGGBBAA = true,
      mode = "background",
    },
  },
  config = function(_, opts)
    require("colorizer").setup(opts.filetypes,
  opts.user_default_options)
  end,
}
