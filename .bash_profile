# Dirs
alias cdjun="cd ~/Documents/13Brown/111JuniorYear/Second\ Semester"
alias cdjazz="cd ~/Documents/workspace/jazz/jazz"
alias cdweb="cd ~/Documents/workspace/webmd"
alias cdjk="cd ~/Documents/workspace/jvoh/jvkoh"
alias cdvs="cd ~/Documents/workspace/vsingh"
alias cdmus="cd ~/Documents/workspace/music"
alias cdws="cd ~/Documents/workspace/"
alias cdart="cd ~/Documents/workspace/arter/"
alias cdv="cd ~/venmo-devops"
alias cdvp="cd ~/venmo-devops/venmo-platform/"
alias cdvw="cd ~/venmo-devops/venmo-platform/webapp"
alias cddot="cd /Users/Varun/Documents/workspace/dotfiles/"


alias sshcs="ssh vjsingh@ssh.cs.brown.edu"
alias sshcsx="ssh -X vjsingh@ssh.cs.brown.edu"
alias vbp="vim /Users/Varun/.bash_profile"
alias sbp="source ~/.bash_profile"
alias cdscripts="pushd /usr/local/bin/my_scripts"
alias v='/Applications/MacVim.app/Contents/MacOS/Vim '
alias gpnd='git push nodester master'
alias sshaz='ssh -vi ~/.ssh/ec2.pem ubuntu@107.21.124.83'
alias upjazz='ssh -i ~/.ssh/ec2.pem ubuntu@107.21.124.83 "/var/jazz/update"'
alias rsjazz='ssh -i ~/.ssh/ec2.pem ubuntu@107.21.124.83 "/var/jazz/update restart"'
alias sshmus='ssh -vi ~/.ssh/ec2.pem ubuntu@ec2-107-20-71-252.compute-1.amazonaws.com'
alias rsmus='ssh -i ~/.ssh/ec2.pem ubuntu@ec2-107-20-71-252.compute-1.amazonaws.com "/var/jazz/update restart"'
alias upjazz='gp; rsjazz'
alias upmus='gp; rsmus'
alias mongoart='mongo staff.mongohq.com:10095/nodejitsudb992359367398 -u nodejitsu -p be8725eaf1cb68e7a129cebf81f66480'

# Venmo
alias vm="ssh-add ~/.ssh/id_rsav;cd ~/venmo-devops && vagrant ssh"
alias ops="cd ~/venmo-devops"
alias venmo="cd ~/venmo-devops/venmo-platform"

export VGIT_USERNAME=vjsingh  #github
# Venmo
if [ -f ~/venmo-devops/venmo_host_aliases ]; then
  source ~/venmo-devops/venmo_host_aliases
fi

# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:/Applications/Racket v5.0.1/bin/:${PATH}"

#Set path for ruby gems
export PATH="/Users/Varun/.gem/ruby/1.8/bin:${PATH}"

alias cdvi="cd ~/Documents/workspace/virusGame/"
alias cdfb="cd ~/Documents/facebook11"

# source ~/.bashrc
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
alias ls='ls -G'
alias grep='grep -i --color=auto'
export PS1="\h:\w$ "
export EDITOR=vim
shopt -s histappend
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
PS1="\n\
  \[\033[0;32m\]\u$DIM \[\033[0;37m\]@ \[\033[0;33m\]\h
\[\033[0;35m\]\$PWD \[\033[0;37m\]\$(parse_git_branch)\$(parse_svn_branch)$ "; export PS1

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

export PS1="\[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path"""""

alias ..='cd ..'
alias ...='cd .. ; cd ..'

# Git
source /usr/local/bin/my_scripts/make-completion-wrapper.sh
gitalias gs "git status"
gitalias ga "git add"
#gitalias gsq "git status | grep -v scripts/phpsh | grep -v 'gen-' | grep -v tags | grep -v 'conf/dev.php'"
gitalias gb "git branch"
gitalias gc "git checkout"
gitalias gcm "git checkout master"
gitalias gcb "git checkout -b"
gitalias gcamw "git commit -a -m working"
gitalias gms "git merge --squash"
gitalias grh "git reset HEAD"
gitalias grhh "git reset --hard HEAD"
#gitalias gsf "git svn fetch; git svn rebase; arc build"
gitalias gpr "git pull --rebase"
gitalias gl "git log"
gitalias gd "git diff"
alias gdc='git diff | ack "^([\+-]|diff)" | less'
#gitalias gf 'git fetch'
gitalias ad 'arc diff'
gitalias adp 'arc diff --preview'
gitalias gsh 'git show'
gitalias gca 'git commit -a'
gitalias gcam "git commit -a -m"
gitalias gcaa 'git commit -a --amend'
gitalias gp 'git push'
gitalias gpu 'git pull'
#gitalias gu 'git fetch; git svn rebase; arc build'
gitalias gr 'git rebase -i origin'
gitalias gcp 'git cherry-pick'

alias ls="ls -G"
alias ll="ls -l"
alias la="ls -al"
alias gD="gb -D"
CLICOLOR=1;
LSCOLORS=DxGxcxdxCxcgcdabagacad
export EDITOR=vim
export CLICOLOR LSCOLORS
export LS_COLORS="${LS_COLORS}:di=01;33"

alias vt='vim -t' # useful alias

alias ..='cd ..'
alias ...='cd ../..'

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
alias rm='del'

# Setting PATH for Python 3.2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"
export PATH

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
