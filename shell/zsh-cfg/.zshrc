if [[ ! -d "$HOME/.zsh_plugins/zsh-autosuggestions" ]]; then
  git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh_plugins/zsh-autosuggestions
fi

if [[ ! -d "$HOME/.zsh_plugins/zsh-autocomplete" ]]; then
  git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh_plugins/zsh-autocomplete
fi

if [[ ! -d "$HOME/.zsh_plugins/fast-syntax-highlighting" ]]; then
  git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.zsh_plugins/fast-syntax-highlighting
fi

# ZSH Plugins
source "$HOME/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$HOME/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

# Persist history across sessions
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE="$HOME/.zsh_history"
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# Initialize starship prompt
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# Initialize zoxide (replaces `cd`)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# Autostart zellij
if [[
  -n $(command -v zellij) &&
  ! -v ZELLIJ &&
  $TERM_PROGRAM != "vscode"
]]; then
  # Attach to the oldest session (last in the list)
  zellij attach --create $(zellij ls | tail -n 1)
fi

if command -v pfetch &> /dev/null; then
  pfetch
fi
