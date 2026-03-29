# Path to your oh-my-zsh installation.
export ZSH=${ZSH:-"$HOME/.oh-my-zsh"}

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Disable sharing history across open terminals
setopt no_share_history
unsetopt share_history

setopt hist_find_no_dups

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='nvim'

if [[ "$(uname)" == "Darwin" ]]; then
  alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
fi

# send links across computers/from phone easily
alias ntfy_listen="curl https://ntfy.sh/b3d3490e-5fa4-49d0-954d-7c50b856a773/raw"

# function to pop into a directory and run a command
function in() {
  (
    cd $1;
    shift;
    $@
  )
}

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add local scripts to path
export PATH="$HOME/.local/bin:$PATH"
