local Util = require("util")
local map = Util.safe_keymap_set

-- <leader> = <Space>
-- Move to window
map("n", "<leader>h", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader>j", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader>k", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader>l", "<C-w>l", { desc = "Go to right window", remap = true })

map("n", "<leader><Left>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<leader><Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<leader><Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<leader><Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window
map("n", "<leader><C-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<leader><C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<leader><C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<leader><C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<leader><C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<leader><C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<leader><C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<leader><C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- better indenting
map("v", "<tab>", ">gv")
map("v", "<S-tab>", "<gv")

-- formatting
map({ "n", "v" }, "<M-S-F>", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- quit
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<leader>h", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<leader>j", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<leader>k", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<leader>l", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
