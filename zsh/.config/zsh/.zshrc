# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

# Direnv
_direnv_hook() {
  trap -- '' SIGINT;
  eval "$("/opt/homebrew/bin/direnv" export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi

# Deno
# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/fletch/.zsh/completions:"* ]]; then export FPATH="/Users/fletch/.zsh/completions:$FPATH"; fi
export DENO_INSTALL="/Users/fletch/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
. "/Users/fletch/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit

# Add local scripts to path
export PATH="$HOME/.local/bin:$PATH"
