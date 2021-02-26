export CLICOLOR=1  # Has to be before exporting TERM
# This causes problems sometimes! I don't understand
# export TERM=xterm-color
export TERM=xterm-256color

# Shell Integration for iterm 2: https://iterm2.com/documentation-shell-integration.html
source ~/.iterm2_shell_integration.zsh

# Interview Schedule
source ~/Documents/workspace/interview-schedule/.interview-schedule-credentials
alias sdocker="docker run --network=host -it postgres psql postgres://$POSTGRESQL_USERNAME:$POSTGRESQL_PASSWORD@$POSTGRESQL_HOSTNAME:$POSTGRESQL_PORT/$POSTGRESQL_DB_NAME"
alias sweb="make dev-server-web"
alias sworker="make dev-server-web"
alias sapp="make dev-server-app"
alias sbook="make dev-server-book"
alias sall='startAllInterviewSchedule'

alias dw="make aws-deploy-web"
alias dswap="make aws-swap"
alias dls="make aws-ls"

alias dbRemoveAllDockerContainers="docker volume rm $(docker volume ls -q)"
alias dbDump="pg_dump postgres://$POSTGRESQL_USERNAME:$POSTGRESQL_PASSWORD@$POSTGRESQL_HOSTNAME:$POSTGRESQL_PORT/$POSTGRESQL_DB_NAME > /Users/Varun/Documents/workspace/interview-schedule/mine/db\ backups/interview_schedule.dump"
alias dbRestore="pg_dump postgres://$POSTGRESQL_USERNAME:$POSTGRESQL_PASSWORD@$POSTGRESQL_HOSTNAME:$POSTGRESQL_PORT/$POSTGRESQL_DB_NAME < /Users/Varun/Documents/workspace/interview-schedule/mine/db\ backups/interview_schedule.dump"

function startAllInterviewSchedule() {
  ttab eval "cd ~/Documents/workspace/interview-schedule; make dev-server-book";
  ttab eval "cd ~/Documents/workspace/interview-schedule; make dev-server-web";
  ttab eval "cd ~/Documents/workspace/interview-schedule; make dev-server-worker";
  cd ~/Documents/workspace/interview-schedule; make dev-server-app;
}

# Dirs
alias cdws="cd ~/Documents/workspace/"
alias cdportfolio="cd ~/Documents/workspace/portfolio"
alias cdvi="cd ~/Documents/workspace/virusGame/"
alias cdpans="cd ~/Documents/workspace/pansaari/"
alias cdpansw="cd ~/Documents/workspace/pansaari/wp-content/themes/wordless_3/"

alias cdc="cd ~/Documents/workspace/clyme"
alias cdclyme="cd ~/Documents/workspace/clyme"
alias cdclymeDbUtil="cd ~/Documents/workspace/clyme/server/src/scripts/dbUtil/"
alias cdclymec="cd ~/Documents/workspace/clyme/client/src"
alias cdclymes="cd ~/Documents/workspace/clyme/server/src"
alias cdscripts="cd ~/Documents/workspace/clyme/server/src/scripts/dbUtil/"

alias cdi="cd ~/Documents/workspace/interview-schedule"
alias cdic="cd ~/Documents/workspace/interview-schedule/app/client/src/"
alias cdis="cd ~/Documents/workspace/interview-schedule/app/server/"

alias cddot="cd /Users/Varun/Documents/workspace/dotfiles/"
alias cdbinscripts="pushd /usr/local/bin/my_scripts"
alias cdfb="cd ~/Documents/facebook11"

#Utility
alias ls='ls -G'
alias grep='grep -i --color=auto'

function akk() {
  git grep -n --color --ignore-case $1 ':(exclude)web-build/*' ':(exclude)yarn.lock' ':(exclude)src/src/img/svg/*' ':(exclude)server/src/scripts/notifications/*' ':(exclude)server/src/generated/*' ':(exclude)schema.json' ':(exclude)src/src/generated/*' ':(exclude)server/prisma/prisma-client-ts/*' ':(exclude)src/src/Components/react-native-material-ripple/*'
}

#Screen
alias sr="screen -r"

# Git
#source /usr/local/bin/my_scripts/make-completion-wrapper.sh
alias gs="git status"
alias ga="git add"
#gitalias gsq "git status | grep -v scripts/phpsh | grep -v 'gen-' | grep -v tags | grep -v 'conf/dev.php'"
alias gb="git branch"
alias gc="git checkout --no-guess"
alias gca="git checkout"
#  git checkout --track origin/development
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias gcamw="git commit -a -m working"
alias gms="git merge --squash"
alias grh="git reset HEAD"
alias grhh="git reset --hard HEAD"
alias gunadd="git reset HEAD --"
alias gundolastcommit="git reset --soft HEAD~1"
alias gundoreset="git reset 'HEAD@{1}'"
# This broke one time and squashed a bunch of commits together. Too dangerous to use
# alias gsquash="git reset --soft HEAD~2 && git commit --edit -m\"$(git log --format=%B HEAD@{0}..HEAD@{2})\""  # Squash last two commits together, using message of first commit.
#gitalias gsf "git svn fetch; git svn rebase; arc build"
alias gpr="git pull --rebase"
alias git up="git pull --rebase"
alias gl="git log"
alias glg="git lg"
#alias gd="git diff"
alias gd="git diff --ignore-space-change -- . ':(exclude)schema.json' ':(exclude)server/src/generated/*' ':(exclude)src/src/generated/*' ':(exclude)./yarn.lock'"
alias gdh="git diff HEAD --ignore-space-change -- . ':(exclude)schema.json' ':(exclude)server/src/generated/*' ':(exclude)src/src/generated/*' ':(exclude)./yarn.lock'"
alias gdh1="git diff HEAD~1 --ignore-space-change -- . ':(exclude)schema.json' ':(exclude)server/src/generated/*' ':(exclude)src/src/generated/*' ':(exclude)./yarn.lock'"
alias gdc='git diff | ack="^([\+-]|diff)" | less'
#gitalias gf 'git fetch'
alias ad='arc diff'
alias adp='arc diff --preview'
alias gsh='git show'
#alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcaa='git commit -a --amend'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gu='git pull'
#gitalias gu 'git fetch; git svn rebase; arc build'
alias gr='git rebase -i master'
alias grc='git rebase --continue'
alias gcp='git cherry-pick'

alias ls="ls -G"
alias ll="ls -l"
alias la="ls -al"
alias lstree-"ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias gD="gb -D"

alias vbp="v /Users/Varun/.bash_profile"
alias vvp="v /Users/Varun/.vimrc"
alias sbp="source ~/.bash_profile"
# alias v='/Applications/MacVim.app/Contents/MacOS/Vim '
if type nvim > /dev/null 2>&1; then
	alias v='nvim'
	alias vimold='vim'
	#alias vim='nvim'
fi
alias vs='v -S ~/mysession.vim'
alias vt='vim -t' 
alias ..='cd ..'
alias ...='cd .. ; cd ..'

alias gpnd='git push nodester master'
#alias sshaz='ssh -vi ~/.ssh/ec2.pem ubuntu@107.21.124.83'
#alias rsjazz='ssh -i ~/.ssh/ec2.pem ubuntu@107.21.124.83 "/var/jazz/update restart"'
alias sshaz='ssh -vi ~/.ssh/ec2.pem ubuntu@54.210.38.1'
alias rsjazz='ssh -i ~/.ssh/ec2.pem ubuntu@54.210.38.1 "/var/jazz/update restart"'
alias sshmus='ssh -vi ~/.ssh/ec2.pem ubuntu@ec2-107-20-71-252.compute-1.amazonaws.com'
alias rsmus='ssh -i ~/.ssh/ec2.pem ubuntu@ec2-107-20-71-252.compute-1.amazonaws.com "/var/jazz/update restart"'
alias upjazz='git push origin master; rsjazz'
alias upmus='gp; rsmus'
alias mongoart='mongo staff.mongohq.com:10095/nodejitsudb992359367398 -u nodejitsu -p be8725eaf1cb68e7a129cebf81f66480'
alias sshpans='ssh pansaari@69.195.124.96'
alias sshvirion="ssh varun@104.131.226.221" # password is "password"
alias sshdo='ssh vjsingh@159.65.225.114'
alias updo='ssh vjsingh@159.65.225.114 "cd venga; [ -f package-lock.json ] && rm package-lock.json; git reset --hard HEAD; git pull; pm2 restart all;"'  # npm run-script build-web;"'
alias upAll='git push; updo;'
alias upAllWeb='npm run build-web; ga *; gcam "build web"; upAll'
alias epublish='expo publish'
alias epublishStaging='expo publish --release-channel staging'
alias sshgoog='gcloud beta compute --project "cedar-spring-258514" ssh --zone "us-east1-b" "instance-1"';
alias scpPrismaDbBackups='scp -r vjsingh@159.65.225.114:/home/vjsingh/venga_backup/db/prisma_backup-2020-02-28.zip ./'
# To send files to google instance: gcloud beta compute scp ec2.pem instance-1:~
# or for directories: gcloud beta compute scp --recurse providence_tour_complete instance-1:~/delete
# To get fles onto google cloud instance (when on google cloud instance :~/)
# scp -i ec2.pem -r ubuntu@54.210.38.1:/home/ubuntu/mongodb-linux-x86_64-2.0.2 ./

alias updateGraphqlTypesLocal='cdclyme; npms getAppSchema; npms generateGraphqlTypes';
alias updateGraphqlTypes='cdclyme; cd server; npx prisma deploy; updateGraphqlTypesLocal';

alias npms='npm run-script'

alias mvtorrents='mv ~/Downloads/*.torrent ~/Downloads/Torrents/Torrents'

# Venmo
alias vm="ssh-add ~/.ssh/id_rsav;cd ~/venmo-devops && vagrant ssh"
alias ops="cd ~/venmo-devops"
alias venmo="cd ~/venmo-devops/venmo-platform"

#Config Nonsense
export VGIT_USERNAME=vjsingh  #github
# Venmo
if [ -f ~/venmo-devops/venmo_host_aliases ]; then
  source ~/venmo-devops/venmo_host_aliases
fi

export PATH="/usr/local/bin:${PATH}"
export PATH="node_modules/.bin:${PATH}"
#Set path for ruby gems
#export PATH="/Users/Varun/.gem/ruby/1.8/bin:${PATH}" /Users/Varun/.gem/bin
export PATH="/Users/Varun/.gem/bin:${PATH}"
export PATH="/Users/Varun/Library/Android/sdk/platform-tools/:${PATH}"

#export PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:${PATH}"

# source ~/.bashrc
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
#export PS1="\h:\w$ "
export EDITOR=vim
export FZF_DEFAULT_COMMAND='fd --type f' # Respect .gitignore for fzf (used in vim)
#setopt -s histappend
PROMPT_COMMAND='history -a'

# From Venmo Kortina
parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch() {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
parse_svn_branch() {
  svn info 2> /dev/null | grep URL | sed -e "s/.*\/\(.*\)$/(\1)/"
}
#PS1="\n\
  #\[\033[0;32m\]\u$DIM \[\033[0;37m\]@ \[\033[0;33m\]\h
#\[\033[0;35m\]\$PWD \[\033[0;37m\]\$(parse_git_branch)\$(parse_svn_branch)$ "; export PS1

test -r /sw/bin/init.sh && . /sw/bin/init.sh

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors, uses vars in .bashrc_non-interactive

#export PS1="\[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path"""""

CLICOLOR=1;
LSCOLORS=DxGxcxdxCxcgcdabagacad
export EDITOR=vim
export CLICOLOR LSCOLORS
export LS_COLORS="${LS_COLORS}:di=01;33"

source ~/.git-completion.bash

#ulimit -n 1024
HISTFILESIZE=1000000000
HISTSIZE=1000000

# rm moves to trash
# http://blog.vicshih.com/2008/04/move-to-trash-from-mac-command-line.html
function del() {
while [ -n "$1" ]; do
  if [ ! -e "$1" ]; then
    echo "'$1' not found; exiting"
    return
  fi

  local file=`basename -- "$1"`

  # Chop trailing '/' if there
  file=${file%/}

  local destination=''

  if [ -e "$HOME/.Trash/$file" ]; then
    # Extract file and extension
    local ext=`expr "$file" : ".*\(\.[^\.]*\)$"`
    local base=${file%$ext}

    # Add a space between base and timestamp
    test -n "$base" && base="$base "

    destination="/$base`date +%H-%M-%S`_$RANDOM$ext"
  fi

  echo "Moving '$1' to '$HOME/.Trash$destination'"
  \mv -i -- "$1" "$HOME/.Trash$destination" || return
  shift
done
}
#alias rm='del'

# Set PATH for Racket
PATH="/Applications/Racket v5.3/bin/:${PATH}"
PATH="/usr/local/bin/my_scripts:${PATH}"
export PATH

# {{{
# Node Completion - Auto-generated, do not touch.
#setopt -s progcomp
#for f in $(command ls ~/.node-completion); do
  #f="$HOME/.node-completion/$f"
  #test -f "$f" && . "$f"
#done
# }}}

export GEM_HOME=~/.gem
export GEM_PATH=~/.gem

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="/Users/Varun/Downloads/google-cloud-sdk/bin:$PATH"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Varun/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/Varun/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Varun/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/Varun/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# Pyenv
function deletePython() {
  eval "$(pyenv init -)"
  export PATH="/Users/Varun/.pyenv/shims:${PATH}"
  export PYENV_SHELL=zsh
  source '/usr/local/Cellar/pyenv/1.2.20/libexec/../completions/pyenv.zsh'
  command pyenv rehash 2>/dev/null
  pyenv() {
    local command
    command="${1:-}"
    if [ "$#" -gt 0 ]; then
      shift
    fi

    case "$command" in
    rehash|shell)
      eval "$(pyenv "sh-$command" "$@")";;
    *)
      command pyenv "$command" "$@";;
    esac
  }

  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
