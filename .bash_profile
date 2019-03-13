export PS1="________________________________________________________________________________\n|\$(parse_git_branch)\[\033[00m\] \w (\u) \n| => "

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export EDITOR=/usr/bin/atom

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

function kill_ruby_port {
  port="$(lsof -i tcp:$1 -n | grep ruby | awk '{print $2}' | uniq)"
  kill -9 $port
}

alias tfd='tail -f log/development.log'
alias tfp='tail -f log/production.log'
alias atr='autotest -rails'
alias rdm='rake db:migrate'
alias rr='rake routes'

# Aliases for bundle
alias b='bundle'
alias bi="b install"
alias bu="b update"
alias be="b exec"
alias beg='be guard'
alias bo="b open"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

# get ip address
myip=$(ifconfig | grep 'inet ' | grep -v 127.0.0.1 | cut -d\   -f2)

alias brs="be rails s"
alias brc="be rails c"
alias brsp="brs -p"
alias brsb="brs -b $myip"
alias brsbp="brs -b $myip -p"

function bundle_exec_rails_s_b_p {
  if [ -z "$1" ]
  then
    open -a "Google Chrome" http://$myip:3000
    brs -b $myip
  else
    open -a "Google Chrome" http://$myip:$1
    brs -b $myip -p $1
  fi
}

alias brso="bundle_exec_rails_s_b_p"

# Path Aliases
alias work="cd ~/work"

alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder

# Ross
alias postgres="open -a Postgres"
alias sidekiq="bundle exec sidekiq"
alias redis="redis-server"


# Aliases for git
alias gl='git pull'
alias gp='git push'
alias gb='git branch -a -v'
alias gst='git status'
alias gss='ruby ~/.submodule_status.rb `pwd`'
alias gd='git diff | gitx'
alias gdi='git diff --ignore-space-change'
alias gdc='git diff --cached'
alias gdic='git diff --cached --ignore-space-change'
alias gi='git commit'
alias gc='git checkout'
alias gt='gittower'


if [ -f ~/.bashrc ] ; then
  source ~/.bashrc
fi

export PATH="/usr/local/opt/python/libexec/bin:/usr/local/bin:/usr/local/sbin:$PATH"
