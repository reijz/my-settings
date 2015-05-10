# alias ls='ls -F'
alias ll='ls -l'
alias dudir='du -hs *| sort -n'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Setting CLASSPATH for Java
JPHOME="~/Dropbox/Code/Java"
CLASSPATH="./:/usr/sr/sr/local/ssj/ssj.jar:$JPHOME/QueueSystem/bin"
export CLASSPATH

# For homebrew: Python Latex
export PATH=/usr/local/bin:/usr/texbin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt
