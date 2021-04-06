# Case insensitive globbing (used in pathname expansion)
setopt extendedglob
unsetopt CASE_GLOB

# Use color in supported commands
export CLICOLOR=1

# Ignore these files in tab completion
export FIGNORE=DS_Store

# Enable colored grep output
export GREP_OPTIONS="--color=auto"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Make vim the default editor
export EDITOR="vim"



# -------
# History

# Append to the history file, rather than overwriting it
setopt APPEND_HISTORY

# Make some commands not show up in history
export HISTORY_IGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Larger history
export HISTSIZE=32768

# Ignore duplicates and commands starting with a space in history
setopt hist_ignore_space
setopt hist_ignore_all_dups

# Enables ctrl+r history searching
bindkey -v
bindkey '^R' history-incremental-search-backward



# -----
# rbenv

if type rbenv &>/dev/null; then
	eval "$(rbenv init -)"
fi



# ---
# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"



# -----
# Alias

alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'
alias ll='ls -al'
alias tree='tree -C'
alias mkdir='mkdir -pv'
alias g='git'
alias bejs='bundle exec jekyll serve'
alias reload='source ~/.zshrc'
alias psmem='ps aux | sort -nr -k 4'
alias pscpu='ps aux | sort -nr -k 3'
alias ports='netstat -a | egrep "Proto|LISTEN"'
alias path='echo -e ${PATH//:/\\n}'
alias json='python -mjson.tool'
alias show-hidden-files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hide-hidden-files='defaults delete com.apple.finder AppleShowAllFiles; killall Finder /System/Library/CoreServices/Finder.app'
alias kittydiff='git difftool --no-symlinks --dir-diff'



# ----
# Path

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/workspace/dotfiles/bin"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="$PATH:/usr/local/sbin"

# Set the title of the terminal window (usage: $ title my project name)
function title {
	echo -ne "\033]0;"$*"\007"
}



# --------------
# Tab completion

# Add tab completion for main commands (requires: brew install zsh-completion)
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
	autoload -Uz compinit
	compinit
fi

# Completion for kitty (needs to be after compinit)
if type kitty &>/dev/null; then
	kitty + complete setup zsh | source /dev/stdin
fi



# ------
# Prompt

[ -f ~/.zsh.prompt ] && source ~/.zsh.prompt



# ---------
# Overrides

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

