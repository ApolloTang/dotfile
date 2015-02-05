# See following for more information: http://www.infinitered.com/blog/?p=19


# Path ------------------------------------------------------------
# export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:$PATH  # OS-X Specific, with MacPorts and MySQL installed
export PATH=/opt/local/bin:/opt/local/sbin:$PATH  # OS-X Specific, with MacPorts installed

# if [ -d ~/bin ]; then
# 	export PATH=~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
# fi


# Unique variable --------------------------------------------------------

# \\ reset server port counter
# echo 8100 > ~/._env/port_counter_01
# comment out the above because it run everytime I spawn xterm
# (I thought .bash_profile only run once on login)

# \\ following does not work
# export port_counter_01=8100
# function increase_port_counter_01 {
#     ((port_counter_01=port_counter_01+1))
#     #http://stackoverflow.com/questions/496702/can-a-shell-script-set-environment-variables-of-the-calling-shell
# }
# export -f increase_port_counter_01
# # http://unix.stackexchange.com/questions/106601/how-to-add-a-function-to-bash-profile-profile-bashrc-in-shell




# Load in .bashrc -------------------------------------------------
source ~/.bashrc





# Hello Messsage --------------------------------------------------
# echo -e "Kernel Information: " `uname -smr`
# echo -e "${COLOR_BROWN}`bash --version`"
# echo -ne "${COLOR_GRAY}Uptime: "; uptime
# echo -ne "${COLOR_GRAY}Server time is: "; date



# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X,
# or create a new tab in iTerm) the following files are read and run, in this order:
#     profile
#     bashrc
#     .bash_profile
#     .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started
# (when you run "bash" from inside a shell, or when you start a shell in
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
# in this order:
#     bashrc
#     .bashrc




# To make the software installed by Fink available in all of your future terminal
# shells, add '. /sw2/bin/init.sh' to the init script '.profile' or '.bash_profile'
# in your home directory. The program /sw2/bin/pathsetup.sh can help with this.
# Enjoy.

test -r /sw2/bin/init.sh && . /sw2/bin/init.sh


# \\ run simple server at localhost:8001 to server asset
#test -r $HOME/Aa/00s/05hw/sy/server-library/server_8001 && $HOME/Aa/00s/05hw/sy/server-library/server_8001




# The next line updates PATH for the Google Cloud SDK.
source '/Users/apollotang/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/apollotang/google-cloud-sdk/completion.bash.inc'

# The next line is added by GoodSync



##
# Your previous /Users/apollotang/.bash_profile file was backed up as /Users/apollotang/.bash_profile.macports-saved_2014-11-01_at_23:56:18
##

# MacPorts Installer addition on 2014-11-01_at_23:56:18: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.





export PATH="/Users/apollotang/Library/Application Support/GoodSync":$PATH