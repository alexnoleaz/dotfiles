local Util = require("util")

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    insert_mappings = false,
    terminal_mappings = false,
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return term.name
      end,
    },
  },
  keys = {
    {
      mode = { "i", "t", "n" },
      "<C-j>",
      "<cmd>ToggleTerm dir=" .. Util.root() .. "<cr>",
      { desc = "Terminal (root dir)", remap = false }
    },
    {

      mode = { "i", "t", "n" },
      "<C-n>",
      "<cmd>2 ToggleTerm dir=" .. Util.root() .. "<cr>",
      { desc = "Terminal (root dir)", remap = false }
    }
  }
}
