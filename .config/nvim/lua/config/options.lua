-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.editorconfig = true
local opt = vim.opt
opt.wrap = true
opt.swapfile = false

-- if vim.loop.os_uname().sysname == "Windows_NT" then
--   if vim.o.shell == '"C:\\Program Files\\Git\\usr\\bin\\bash.exe"' then
--     opt.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
--     opt.shellcmdflag = "-s"
--   else
--     opt.shell = "pwsh" or "powershell"
--     opt.shellcmdflag =
--       "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
--     opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
--     opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
--     opt.shellquote = ""
--     opt.shellxquote = ""
--   end
-- end

if vim.fn.has("win32") == 1 then
  if vim.o.shell == '"C:\\Program Files\\Git\\usr\\bin\\bash.exe"' then
    opt.shell = "C:\\Program Files\\Git\\bin\\bash.exe"
    opt.shellcmdflag = "-s"
  else
    LazyVim.terminal.setup("pwsh" or "powershell")
  end
end
