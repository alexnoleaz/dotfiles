local discipline = require("util.discipline")
discipline.cowboy()

local Util = require("lazyvim.util")
local del = vim.keymap.del
local set = vim.keymap.set

-- Delete predetermined mappings

-- better up/down
del({ "n", "x" }, "j")
del({ "n", "x" }, "<Down>")
del({ "n", "x" }, "k")
del({ "n", "x" }, "<Up>")

-- Move to window
del("n", "<C-h>")
-- del("n", "<C-j>")
-- del("n", "<C-k>")
del("n", "<C-l>")

-- Risize window
del("n", "<C-Up>")
del("n", "<C-Down>")
del("n", "<C-Left>")
del("n", "<C-Right>")

-- buffers
del("n", "<S-h>")
del("n", "<S-l>")
del("n", "[b")
del("n", "]b")
del("n", "<leader>bb")
del("n", "<leader>`")

-- Clear search, diff update and redraw
del("n", "<leader>ur")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
del("n", "n")
del("x", "n")
del("o", "n")
del("n", "N")
del("x", "N")
del("o", "N")

-- Add undo break-points
del("i", ",")
del("i", ".")
del("i", ";")

-- better indenting
del("v", "<")
del("v", ">")

-- Lazy
del("n", "<leader>l")

-- new file
del("n", "<leader>fn")

-- formatting
del({ "n", "v" }, "<leader>cf")

-- quickfix previous/next
del("n", "[q")
del("n", "]q")

-- Lazygit
del("n", "<leader>gg")
del("n", "<leader>gG")

-- LazyVim Changelog
del("n", "<leader>L")

-- floating terminal
del("n", "<leader>ft")
del("n", "<leader>fT")
del("n", "<c-/>")
del("n", "<c-_>")

-- Terminal Mappings
del("t", "<C-h>")
-- del("t", "<C-j>")
-- del("t", "<C-k>")
del("t", "<C-l>")
del("t", "<C-/>")
del("t", "<C-_>")

-- windows
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")

-- tabs
del("n", "<leader><tab>l")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")

-- Add custom mappings

-- Move to window
set("n", "<leader>h", "<C-w>h", { desc = "Go to left window", remap = true })
set("n", "<leader>j", "<C-w>j", { desc = "Go to lower window", remap = true })
set("n", "<leader>k", "<C-w>k", { desc = "Go to upper window", remap = true })
set("n", "<leader>l", "<C-w>l", { desc = "Go to right window", remap = true })

set("n", "<leader><Left>", "<C-w>h", { desc = "Go to left window", remap = true })
set("n", "<leader><Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
set("n", "<leader><Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
set("n", "<leader><Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window
set("n", "<leader><C-k>", "<cmd>resize +10<cr>", { desc = "Increase window height" })
set("n", "<leader><C-j>", "<cmd>resize -10<cr>", { desc = "Decrease window height" })
set("n", "<leader><C-h>", "<cmd>vertical resize -10<cr>", { desc = "Decrease window width" })
set("n", "<leader><C-l>", "<cmd>vertical resize +10<cr>", { desc = "Increase window width" })

set("n", "<leader><C-Up>", "<cmd>resize +10<cr>", { desc = "Increase window height" })
set("n", "<leader><C-Down>", "<cmd>resize -10<cr>", { desc = "Decrease window height" })
set("n", "<leader><C-Left>", "<cmd>vertical resize -10<cr>", { desc = "Decrease window width" })
set("n", "<leader><C-Right>", "<cmd>vertical resize +10<cr>", { desc = "Increase window width" })

-- Move Lines
set("n", "<M-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
set("n", "<M-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
set("i", "<M-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
set("i", "<M-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
set("v", "<M-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
set("v", "<M-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- better indenting
set("v", "<tab>", ">gv")
set("v", "<S-tab>", "<gv")

-- formatting
set({ "n", "v" }, "<M-S-f>", function()
  Util.format({ force = true })
end, { desc = "Format" })
set("n", "<leader>W", "<C-W>c", { desc = "Delete window", remap = true })

-- Lazy
set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
