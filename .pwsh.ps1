[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Import-Module -Name syntax-highlighting

# FZF
Import-Module -Name PSFzf
$env:FZF_DEFAULT_OPTS = "
  --height 40%
  --layout=reverse
  --color=fg:#c0caf5,hl:#ff9e64 
  --color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 
  --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
  --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
"
$env:FZF_CTRL_T_OPTS = "
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(hidden|)'"
$env:FZF_CTRL_R_OPTS = "
  --preview 'echo {}'
  --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
function ff { nvim $(fzf ) }

function la { lsd -a }
function ll { lsd -alFh }
Set-Alias -Name ls -Value lsd

Remove-Alias cd
Set-Alias -Name cd -Value z
Set-Alias -Name vim -Value nvim
Set-Alias -Name cat -Value bat

neofetch
