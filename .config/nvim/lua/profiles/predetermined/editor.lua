local Util = require("lazyvim.util")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        {
          "<leader>e",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
          end,
          desc = "Explorer NeoTree (root dir)",
        },
        {
          "<leader>ge",
          function()
            require("neo-tree.command").execute({ source = "git_status", toggle = true })
          end,
          desc = "Git explorer",
        },
        {
          "<leader>be",
          function()
            require("neo-tree.command").execute({ source = "buffers", toggle = true })
          end,
          desc = "Buffer explorer",
        },
      }
    end,
  },
  { "nvim-pack/nvim-spectre", enabled = false },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
      },
    },
  },
  {
    "echasnovski/mini.bufremove",
    keys = function()
      return {
        {
          "<leader>w",
          function()
            local bd = require("mini.bufremove").delete
            if vim.bo.modified then
              local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
              if choice == 1 then -- Yes
                vim.cmd.write()
                bd(0)
              elseif choice == 2 then -- No
                bd(0, true)
              end
            else
              bd(0)
            end
          end,
          desc = "Delete Buffer",
        },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "[q", false },
      { "]q", false },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "]t", false },
      { "[t", false },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return {
        { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
        { "<leader>p", Util.telescope("files"), desc = "Find Files (root dir)" },
        -- find
        { "<leader><tab>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
        { "<leader>fc", Util.telescope.config_files(), desc = "Find Config File" },
        -- git
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
        -- search
        { "<leader><S-p>", "<cmd>Telescope commands<cr>", desc = "Commands" },
        { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
        { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
        { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
        { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
        { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
        { "<leader>ct", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
        {
          "<leader>o",
          function()
            require("telescope.builtin").lsp_document_symbols({
              symbols = require("lazyvim.config").get_kind_filter(),
            })
          end,
          desc = "Goto Symbol",
        },
        {
          "<leader>O",
          function()
            require("telescope.builtin").lsp_dynamic_workspace_symbols({
              symbols = require("lazyvim.config").get_kind_filter(),
            })
          end,
          desc = "Goto Symbol (Workspace)",
        },
      }
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
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
        { desc = "Terminal (root dir)" },
      },
      {
        mode = { "i", "t", "n" },
        "<C-k>",
        "<cmd>2 ToggleTerm dir=" .. Util.root() .. "<cr>",
        { desc = "Terminal (root dir)" },
      },
    },
  },
}
