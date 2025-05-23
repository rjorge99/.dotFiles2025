# sources
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias tmux="tmux -f ~/.config/tmux/.tmux.conf"  # Define la configuración de tmux

# nvm (Node Version Manager)
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env)"

eval "$(starship init zsh)" 
eval "$(zoxide init zsh)" 

bindkey -s ^f "tmux-sessionizer.sh\n"

# alias
alias bat="batcat"
alias v="nvim"
alias cd="z"

# eza
alias el="eza -l --header --icons --group-directories-first"   
alias ls="eza --icons=always --group-directories-first"
alias eg="eza --long --git"

# git
alias gp="git push"
alias gs="git s"
alias glg="git lg"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gcmsg="git commit -m"
alias gca="git commit --amend"

alias gk="gitkraken --disable-gpu"


alias em="/mnt/c/Users/rjorg/AppData/Local/Android/Sdk/emulator/emulator"


# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify


export EDITOR=nvim
# Provides the ability to change the current working directory when exiting Yazi.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PATH="$PATH:/usr/bin/dotnet"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export ANDROID_HOME="$HOME/android_sdk"
export REACT_NATIVE_PACKAGER_HOSTNAME=192.168.0.12

export PATH=$PATH:$HOME/android_sdk/cmdline-tools/latest/bin
export PATH=$PATH:/mnt/c/Users/rjorg/AppData/Local/Android/Sdk/platform-tools
# export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
# export ADB_SERVER_SOCKET=tcp:$WSL_HOST:5037
# Reemplaza Tab por aceptar la sugerencia
# bindkey '^I' autosuggest-accept

# completion using arrow keys (based on history)
# bindkey '^[[A' history-search-backward
# bindkey '^[[B' history-search-forward

