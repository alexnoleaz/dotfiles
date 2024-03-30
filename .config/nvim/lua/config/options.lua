vim.g.editorconfig = true
vim.g.mapleader = " "

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.title = true
opt.autoindent = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.scrolloff = 10
opt.backupskip = { "/tmp/*", "/private/tmp/" }
opt.inccommand = "split"
opt.smarttab = true
opt.breakindent = true
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.splitkeep = "cursor"
-- opt.mouse = ""
opt.wrap = true
opt.swapfile = false
opt.formatoptions:append({ "r" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

if vim.fn.has("win32") == 1 then
  if vim.o.shell == '"C:\\Program Files\\Git\\usr\\bin\\bash.exe"' then
    opt.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
    opt.shellcmdflag = "-s"
  else
    LazyVim.terminal.setup("pwsh" or "powershell")
  end
end
