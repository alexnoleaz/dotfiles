return {
  "akinsho/toggleterm.nvim",
  version = "*",
  init = function()
    require("toggleterm").setup({})

    local Util = require("util")
    local map = Util.safe_keymap_set
    -- Terminal
    map({ "n", "t", "i" }, "<C-j>", "<cmd>ToggleTerm dir="..Util.root().."<cr>", { desc = "Terminal (root dir)", remap = false })
    map({ "n", "t", "i" }, "<C-n>", "<cmd>2 ToggleTerm dir="..Util.root().."<cr>", { desc = "Terminal (root dir)", remap = false })

    -- Terminal Mappings
    map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
    map("t", "<leader>h", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
    map("t", "<leader>j", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
    map("t", "<leader>k", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
    map("t", "<leader>l", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
  end
}
