return {
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local devicons = require("nvim-web-devicons")
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.bg, guifg = colors.magenta },
            InclineNormalNC = { guibg = colors.bg, guifg = colors.comment },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = devicons.get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      stages = "fade",
      timeout = 3000,
    },
  },
  { "akinsho/bufferline.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
         █████╗ ██████╗  ██████╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
        ██╔══██╗██╔══██╗██╔════╝██║  ██║██║   ██║██║████╗ ████║
        ███████║██████╔╝██║     ███████║██║   ██║██║██╔████╔██║
        ██╔══██║██╔══██╗██║     ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║  ██║██║  ██║╚██████╗██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
