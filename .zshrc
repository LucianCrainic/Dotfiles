# [ZINIT]
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	   mkdir -p "$(dirname $ZINIT_HOME)"
	      git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# https://askubuntu.com/questions/1515760/unknown-option-bash-when-opening-the-terminal
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [PLUGINS]
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward



HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias l='ls --color'

# [SHELL INTEGRATIONS]
eval "$(starship init zsh)"
# https://askubuntu.com/questions/1515760/unknown-option-bash-when-opening-the-terminal
#eval "$(zoxide init zsh)"

# [CONAN]
export GITLAB_CONAN_PASSWORD="3vmZpg92QMSUJ913cXms"
alias CONAN_START='conan user ldcrainic -r gitlab -p $GITLAB_CONAN_PASSWORD'