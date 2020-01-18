
# Load Antigen
source $HOME/.zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen init .antigenrc

# antigen-init command doesn't look into bundle configuration changes, thus you'll need to use antigen-reset to reload plugins.

# Set up the promptautoload -Uz promptinit
setopt histignorealldups sharehistory # Use emacs keybindings even if our EDITOR is set to vi
bindkey -e # Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history 

# -------------- Variables -----------------------


POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

# For 256 Color Terminal Autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"


ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

POWERLEVEL9K_CUSTOM_UBUNTU_ICON="echo  "
POWERLEVEL9K_CUSTOM_UBUNTU_ICON_BACKGROUND=069
POWERLEVEL9K_CUSTOM_UBUNTU_ICON_FOREGROUND=015

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_ubuntu_icon context dir vcs)

# environment variables 

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


export GOARCH=amd64
export GOOS=linux

# clear the screen
alias c='clear'

#search from history
alias hs='history | grep'

# to make nvim run on running typing vim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi


# aliases 
alias ..='cd ..'
alias  c='clear'

# env variables
export GOPATH="$HOME/Program/go"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin



