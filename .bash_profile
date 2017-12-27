# alias ls='ls -F'
alias ll='ls -l --color=auto'
alias dudir='du -hs *| sort -n'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Setting CLASSPATH for Java
JPHOME="~/Dropbox/Code/Java"
CLASSPATH="./:/usr/sr/sr/local/ssj/ssj.jar:$JPHOME/QueueSystem/bin"
export CLASSPATH

pathprepend() {
  for ((i=$#; i>0; i--));
  do
    ARG=${!i}
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

pathprepend /usr/local/bin /Library/TeX/Distributions/Programs/texbin /usr/local/cuda/bin

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt
