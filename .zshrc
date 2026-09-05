export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git archlinux)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

export EDITOR='nvim'
export VISUAL="${EDITOR}"
export BROWSER='brave'

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# NOTE: these can be installed with pacman
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

unsetopt beep

alias ff="fastfetch"
alias sunvim="sudo -E -s nvim"
alias ngit='nvim +"lua require(\"lazy\").load({plugins = {\"neogit\"}}) vim.schedule(function() require(\"neogit\").open({kind = \"replace\"}) end)"'

