# -*- mode: sh -*-
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  $HOME/.bashrc - Multiplatform Bash Configurations for Non-Login Interactive
#                  Shells ONLY...
#
#  Author:   Alisha Awen Sheppard - siren1@disroot.org
#  Created:  Before 2014-006-09: I had to re-create this file from my dotfiles
#            template on 2019-001-24. I used this a few years ago when I was
#            still using the Bash shell but not sure of the exact creation
#            date...  It's now multiplatform for Linux and Mac OS and possibly
#            BSD flavors with a few tweaks.  Windows Cygwin support is not yet
#            planned but could come later if there is a strong need...
#
#  Note1:    This file is only read in (sourced) by BASH when your session is
#            both "human interactive" and also non-login (i.e., you are invoking
#            manually from the system's default Terminal.  It is not sourced
#            when logging in, either remotely from another machine, or even 
#            locally from something like an X11 virtual terminal, browser, etc.
#            which is basically the same thing as a remote login coming from the
#            outside (above) the "shell" layer of the OS.  Because of this "Born
#            Again Satanic-Hell rule" (lol ;-), I created $HOME/.bash_common
#            which is sourced from both $HOME/.bash_profile & this $HOME./bashrc.
#            Using your own $HOME/.bash_common is the preferred best-practice
#            method.  An alternate method that "a-lot-of-guys" (including me in
#            the past) do of sourcing $HOME/.bashrc from $HOME/.bash_profile
#            can cause many problems!  I learned the "hard" way...
#
#  Note2:    If you have a legacy .profile file in your $HOME directory,
#            BASH will source it if it does not find any such .bash_profile in
#            there! ".profile" comes from the "wicked-old-days" I remember ;-)  
#            It's still around only because BASH includes it for backward
#            compatibility and that has preserved it due in part on the laziness
#            of sysAdmins and partly due to distro maintainers accommodating those
#            lazy system Administrators to keep them happy and contented.
#            Backwards compatability on a production machine serves no productive
#            purpose!  The objective is to sail your merchant ship as fast as she
#            can go...
#
#  Change Log: (descending chronological order)
#
#    2019-002-14 - Alisha Awen siren1@disroot.org
#       At this point this file is completely new. Most everthing was changed
#       taken from .zshrc...  Then many things were removed and placed into:
#       $HOME/.bash_common. I should probably change the creation date as well...
#       Now I know why I as experiencing so many shell related problems on my
#       old MacBook Pro from many years ago resulting in switching to Zsh. OMG!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Source System Wide Global Definitions bashrc (if it is present).
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

##
# Set architecture flags to X86 64bit (all platforms):
export ARCHFLAGS="-arch x86_64"
##

# Uncomment the following line if you DO NOT Want systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  BEGIN OS Specific Sections:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    #####
    # BEGIN: Linux Specific Configs...
    #####
    
    #
    # Install Powerline Status Line Prompt:
    # NOTE1: First install Powerline Package from your Linux distro to get
    #        this feature...
    # NOTE2: For ZSH I have fancier options than this...
    #

    if [ -f `which powerline-daemon` ]; then
        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        . /usr/share/powerline/bash/powerline.sh
    fi
    
    # Mimic Mac OS pbcopy functions:
    # NOTE: First install xclip Package from your Linux distro to get this
    #       feature...
    alias pbcopy='xclip -sel clip'
    alias pbpaste='xclip -o -sel clip'
    
    ##
    # Top Level Machine Specific Exports:
        
    ## Custom directory listings.  (had to break this out too.  Mac OS is different!)
    ## On Mac you have to prefix ls with "g" (i.e. $ gls)
    alias l="ls -alhFB --color --ignore='#*' --group-directories-first"
    alias ll="ls -l"
    alias la="ls -A"

    #####
    # END: Linux Specific Configs...
    #####

    
elif [[ "$OSTYPE" == "darwin"* ]]; then

    
    #####
    # BEGIN: Mac OS Specific Configs...
    #####
        
    ##
    # Help File Paths: (the paths below assume those packages are also installed via Homebrew)
    export INFOPATH="/usr/share/info:/usr/share/man:/usr/local/opt/gpg/share/info:/usr/local/opt/gpg/share/man:/usr/local/opt/coreutils/libexec/gnuman"

    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman"

    ## Custom Mac OS directory listings.
    ## (I had to break these out from the multiplatform Section.
    ## Mac OS Homebrew added back standard unix commands that were removed by Apple)
    ## On Mac you have to prefix "ls" with "g" (i.e. $ gls) to get this to work...
    alias l="gls -alhFB --color --ignore='#*' --group-directories-first"
    alias ll="gls -l"
    alias la="gls -A"
    
    #####
    # END: Mac OS Specific Configs...
    #####

else

    ##### 
    # Unknown OS? Huh? LOL! No harm done as the rest will stick... ;-)
    # TODO: Put Windows Cygwin stuff in here...  Oh My!
    ##### 

fi

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# END OS Specific Section:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BEGIN Platform Independent Global Definitions:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

##
# Global Alias Definitions:
#$

alias cl="clear"

# Use Emacs: (All you "vi" users feel free to change this... lol)
export EDITOR='emacs'

##
# Source $HOME/.bash_common:
# (common elements for both interactive & non-interactive bash shell sessions)
# This file also loads $PATH for all platforms...
if [ -f ~/.bash_common ]; then
	. ~/.bash_common
fi

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END $HOME/.bashrc
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

