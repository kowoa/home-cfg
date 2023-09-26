if [[ ! -d "$HOME/.zsh_plugins/zsh-autosuggestions" ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh_plugins/zsh-autosuggestions
fi

if [[ ! -d "$HOME/.zsh_plugins/zsh-autocomplete" ]]; then
  git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh_plugins/zsh-autocomplete
fi

if [[ ! -d "$HOME/.zsh_plugins/fast-syntax-highlighting" ]]; then
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ~/.zsh_plugins/fast-syntax-highlighting
fi

# ZSH Plugins
source "$HOME/.zsh_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$HOME/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh_plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

eval "$(starship init zsh)"

neofetch

# Persist history across sessions
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE="$HOME/.zsh_history"
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

source "$BASH_CONFIG_DIR/.bash_aliases"
