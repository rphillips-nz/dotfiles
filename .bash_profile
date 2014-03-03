# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Use color in supported commands
export CLICOLOR=1

# Ignore these damn files in tab completion
export FIGNORE=DS_Store

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f $(brew --prefix)/etc/bash_completion ] && source $(brew --prefix)/etc/bash_completion

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Make vim the default editor
export EDITOR="vim"

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Save all lines of a multiple-line command in the same history entry
shopt -s cmdhist

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"



# -----
# Alias

alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'
alias ll='ls -al'
alias tree='tree -C'
alias mkdir='mkdir -pv'
alias g='git'
alias h='history'
alias j='jobs'
alias psmem='ps aux | sort -nr -k 4'
alias pscpu='ps aux | sort -nr -k 3'
alias ports='netstat -a | egrep "Proto|LISTEN"'
alias path='echo -e ${PATH//:/\\n}'
alias json='python -mjson.tool'
alias nginxcheck='ps aux | grep nginx | grep -v grep'
alias nginxedit='vim /usr/local/etc/nginx/nginx.conf'
alias nginxkill='killall nginx'
alias nginxreload='/usr/local/sbin/nginx -s reload'
alias gut='git'
alias gti='git'
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g;'



# ----
# Path

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/usr/local/share/npm/bin"
export PATH="$PATH:/usr/local/sbin"



# ------
# Extras

source ~/.bash_profile.local
source ~/.bash_prompt

