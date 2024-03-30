return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
      on_colors = function(colors)
        colors.bg = colors.bg_dark
        colors.border = colors.bg_dark
      end,
    },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "tokyonight" } },
}
