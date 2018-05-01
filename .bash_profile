# Dirs
alias cdjun="cd ~/Documents/13Brown/111JuniorYear/Second\ Semester"
alias cdsen="cd ~/Documents/13Brown/111SeniorYear/"
alias cdjazz="cd ~/Documents/workspace/jazz/jazz"
alias cdweb="cd ~/Documents/workspace/webmd"
alias cdjk="cd ~/Documents/workspace/jvoh/jvkoh"
alias cdvs="cd ~/Documents/workspace/vsingh"
alias cdmus="cd ~/Documents/workspace/music"
alias cdws="cd ~/Documents/workspace/"
alias cdart="cd ~/Documents/workspace/arter/"
alias cdclyme="cd ~/Documents/workspace/clyme"
alias cdcs="cd ~/Documents/workspace/cs173/"
alias cs176="cd ~/Documents/13Brown/111SeniorYear/cs176/"

alias cdv="cd ~/venmo-devops"
alias cdvp="cd ~/venmo-devops/venmo-platform/"
alias cdvw="cd ~/venmo-devops/venmo-platform/webapp"
alias cdms="cd ~/venmo-devops/venmo-platform/mothership"
alias cddot="cd /Users/Varun/Documents/workspace/dotfiles/"
alias cdscripts="pushd /usr/local/bin/my_scripts"
alias cdvi="cd ~/Documents/workspace/virusGame/"
alias cdfb="cd ~/Documents/facebook11"
alias cdpans="cd ~/Documents/workspace/pansaari/"
alias cdpansw="cd ~/Documents/workspace/pansaari/wp-content/themes/wordless_3/"
alias cdwave="cd ~/Desktop/Everything/Wave"

#Utility
#alias akk='git grep -n --color --heading --break'
alias akk='git grep -n --color'
alias ls='ls -G'
alias grep='grep -i --color=auto'

#Screen
alias sr="screen -r"

# Git
#source /usr/local/bin/my_scripts/make-completion-wrapper.sh
alias gs="git status"
alias ga="git add"
#gitalias gsq "git status | grep -v scripts/phpsh | grep -v 'gen-' | grep -v tags | grep -v 'conf/dev.php'"
alias gb="git branch"
alias gc="git checkout"
alias gcm="git checkout master"
alias gcb="git checkout -b"
alias gcamw="git commit -a -m working"
alias gms="git merge --squash"
alias grh="git reset HEAD"
alias grhh="git reset --hard HEAD"
#gitalias gsf "git svn fetch; git svn rebase; arc build"
alias gpr="git pull --rebase"
alias git up="git pull --rebase"
alias gl="git log"
alias glg="git lg"
alias gd="git diff"
alias gdc='git diff | ack="^([\+-]|diff)" | less'
#gitalias gf 'git fetch'
alias ad='arc diff'
alias adp='arc diff --preview'
alias gsh='git show'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcaa='git commit -a --amend'
alias gp='git push'
alias gpu='git pull'
#gitalias gu 'git fetch; git svn rebase; arc build'
alias gr='git rebase -i origin'
alias gcp='git cherry-pick'

alias ls="ls -G"
alias ll="ls -l"
alias la="ls -al"
alias lstree-"ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias gD="gb -D"

alias vbp="vim /Users/Varun/.bash_profile"
alias vvp="vim /Users/Varun/.vimrc"
alias sbp="source ~/.bash_profile"
alias v='/Applications/MacVim.app/Contents/MacOS/Vim '
alias vt='vim -t' 
alias ..='cd ..'
alias ...='cd .. ; cd ..'

alias sshcs="ssh vjsingh@ssh.cs.brown.edu"
alias sshcsx="ssh -X vjsingh@ssh.cs.brown.edu"
alias gpnd='git push nodester master'
alias sshaz='ssh -vi ~/.ssh/ec2.pem ubuntu@107.21.124.83'
alias rsjazz='ssh -i ~/.ssh/ec2.pem ubuntu@107.21.124.83 "/var/jazz/update restart"'
alias sshmus='ssh -vi ~/.ssh/ec2.pem ubuntu@ec2-107-20-71-252.compute-1.amazonaws.com'
alias rsmus='ssh -i ~/.ssh/ec2.pem ubuntu@ec2-107-20-71-252.compute-1.amazonaws.com "/var/jazz/update restart"'
alias upjazz='git push origin master; rsjazz'
alias upmus='gp; rsmus'
alias mongoart='mongo staff.mongohq.com:10095/nodejitsudb992359367398 -u nodejitsu -p be8725eaf1cb68e7a129cebf81f66480'
alias sshpans='ssh pansaari@69.195.124.96'
alias sshvirion="ssh varun@104.131.226.221" # password is "password"

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
# Setting PATH for MacPython 2.5
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:/Applications/Racket v5.0.1/bin/:${PATH}"
#Set path for ruby gems
#export PATH="/Users/Varun/.gem/ruby/1.8/bin:${PATH}" /Users/Varun/.gem/bin
export PATH="/Users/Varun/.gem/bin:${PATH}"

#export PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:${PATH}"

# source ~/.bashrc
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
#export PS1="\h:\w$ "
export EDITOR=vim
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

# Setting PATH for Python 3.2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"
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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GEM_HOME=~/.gem
export GEM_PATH=~/.gem

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
