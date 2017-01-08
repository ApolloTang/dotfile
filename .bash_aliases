#echo '    .bash_aliases start reading'
#####################################

###
###  Must have
###
alias lf="ls -F"
alias lfa="ls -Fa"
alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lah"
alias h=history
alias rm='rm -i'
alias rmfr='rm -fri'    # not interactive if -ifr; i can not be 1st
alias cdh='cd ~'
alias cddt='cd ~/Desktop/'


# Misc
alias g='grep -i'  # Case insensitive grep
alias f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h'

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'

# ------------------------------------------------------------------
# git
#
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gmt='git mergetool --tool p4merge'
alias gdf='git diff --no-ext-diff'

alias glgl='git log --graph --all --oneline --decorate'
alias glg='git log --graph --all --oneline --decorate -15'

alias glrl='git log --all --oneline --decorate --reverse'
alias glr='git log --all --oneline --decorate --reverse -15'

alias gll='git log --all --oneline --decorate'
alias gl='git log --all --oneline --decorate -15 '

alias gldl="git log --graph --all --pretty=format:\"%C(yellow) %h %C(auto) %d %C(cyan) %cD %Creset %s\""
alias gld="git log --graph --all --pretty=format:\"%C(yellow) %h %C(auto) %d %C(cyan) %cD %Creset %s\" -15"


#/  Utitlities -----------------------------------------------------------
alias aliasl="alias | less"
alias aliasg="alias | grep "

#/ the "kp" alias ("que pasa")
alias kp="ps auxwww"

#/ using sed to build dir tree  http://www.centerkey.com/tree/
alias sed-tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#/  Application ---------------------------------------------------------

alias k3="kdiff3 "

#/ Split path into line -------------------------------------------------
#/ for linux
#  alias info-path='echo $PATH | sed s/:/\\n/g | less'
#/   ref: stackoverflow.com/questions/18234378/using-sed-to-split-a-string-with-a-delimiter
#/  for osx
alias info-path="echo $PATH | sed 's/:/\\`echo -e '\n\r'`/g' | cat"  #for osx
#/  in the above, not sure why "\\" before first "`" but not b4 the second "`"
#/  ref http://stackoverflow.com/questions/723157/how-to-insert-a-newline-in-front-of-a-pattern


#/ xterm -----------------------------------------------------------------
# alias xterm='xterm -en en_US.UTF-8 &'


#-------------------------------------------------------------------------------
# I got the following from, and mod'd it:
# http://hints.macworld.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ;
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

#-------------------------------------------------------------------------------
# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"


#/ vimrc -----------------------------------------------------------------
alias vim-cd='cd $d_conf/vimrc/; lf;'

alias vim-l-diff='diff ~/.vimrc $d_conf/vimrc/_vimrc_lab'
alias vim-m-diff='diff ~/.vimrc $d_conf/vimrc/_vimrc_master'
alias vim-kdiff3='kdiff3 $d_conf/vimrc/_vimrc_master ~/.vimrc'

alias vim-l-save='cp ~/.vimrc $d_conf/vimrc/_vimrc_lab'
alias vim-m-save='cp ~/.vimrc $d_conf/vimrc/_vimrc_master'
alias vim-l-load='cp $d_conf/vimrc/_vimrc_lab ~/.vimrc'
alias vim-m-load='cp $d_conf/vimrc/_vimrc_master ~/.vimrc'

alias vim-c-cd='cd /Users/apollotang/.vim/colors/'
alias vim-c-load='cp $d_conf/vimrc/apollotang.vim /Users/apollotang/.vim/colors/apollotang.vim'
alias vim-c-save='cp /Users/apollotang/.vim/colors/apollotang.vim $d_conf/vimrc/apollotang.vim'
alias vim-c-diff='diff $d_conf/vimrc/apollotang.vim /Users/apollotang/.vim/colors/apollotang.vim'


#--------------------------------------------------------------------------
#list dot files
alias find_ln_dotfile='find . -name ".*" -type l -maxdepth 1 -exec ls -al {} +'


################################################
#echo '.bash_aliases reading done'
