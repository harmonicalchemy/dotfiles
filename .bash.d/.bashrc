# -*- mode: sh -*-
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File:          $HOME/.bashrc
##                Multiplatform Bash Configurations for Non-Login Interactive
##                Shells ONLY...
## Created:       2014-006-09
## Modified:      2021-012-22
## Author:        Alisha Awen - Siren1@disroot.org
## Copyright:     (© 2019 - 2022 by Alisha Awen, Siren1@disroot.org, all rights reserved)
## Git Username:  harmonicalchemy
## Ref:           https://www.gnu.org/software/bash/
## Repo:          https://github.com/harmonicalchemy/dotfiles.git
## Licence:       GNU General Public License v3.0
## Environment:   Linux, BSD, (Qubes 4.0 nx App VMs) and Mac OS
##                (not for hosted servers)

## This config file is only sourced by BASH when your session is both "human
## interactive" and also non-login (i.e., you are invoking manually from the
## system's default Terminal.  It is not sourced when logging in, either remotely
## from another machine, or even locally from something like an X11 virtual
## terminal, browser, etc. which is basically the same thing as a remote login
## coming from the outside (above) the "shell" layer of the OS.  Because of this
## "Born Again Satanic-Hell rule" (lol ;-), I created $HOME/.bash_common which
## is sourced from both $HOME/.bash_profile & this $HOME./bashrc. Using your own
## $HOME/.bash_common is the preferred best-practice method.  An alternate method
## that "a-lot-of-guys" (including me in the past) do of sourcing $HOME/.bashrc
## from $HOME/.bash_profile can cause many problems!  I learned the "hard" way...

## Note1: If you have a legacy .profile file in your $HOME directory,
##        BASH will source it if it does not find any such .bash_profile in
##        there! ".profile" comes from the "wicked-old-days" I remember ;-)  
##        It's still around only because BASH includes it for backward
##        compatibility and that has preserved it due in part on the laziness
##        of sysAdmins and partly due to distro maintainers accommodating those
##        lazy system Administrators to keep them happy and contented.
##        Backwards compatability on a production machine serves no productive
##        purpose!  The objective is to sail your merchant ship as fast as she
##        can go...

###
## Change Log: (descending chronological order)

## 2021-012-22 - Alisha Awen - Siren1@disroot.org
##     Updated this file and put it in new .bash.d sub-directory:
##     .DOTFILES Security DueDiligence done up to: Q4 2021 now...

## 2021-006-003 - Alisha Awen - Siren1@disroot.org
##     Minor changes and fixes (mostly for Mac OS which is set to
##     zsh at the OS level so BASH is rarely invoked.  Except for
##     remote logins etc... (and now I have the git user logging
##     in remotely from other machines) which is how I found out
##     how messed up my BASH was for Mac OS... lol

## 2020-002-002 - Alisha Awen - Siren1@disroot.org
##     Updated this file from my private .DOTFILES repo...
##     Security DueDiligence up to Q1 2020 now...

## 2019-006-26 - Alisha Awen - siren1@disroot.org
##     Completely re-wrote this file all over yet again!  We can now handle
##     BASH INTERACTIVE & NON-INTERACTIVE Shells...   Added debug print
##     statements... (that will be commented out when not debugging)...

## 2019-002-14 - Alisha Awen - siren1@disroot.org
##     At this point this file is completely new again.  Most everthing was taken
##     from .zshrc...  Then many things were removed and placed into:
##     $HOME/.bash_common. I should probably change the creation date as well...
##     Now I know why I as experiencing so many shell related problems on
##     my old MacBook Pro from many years ago resulting in switching to Zsh. OMG!
##     This file is now  multiplatform for Linux and Mac OS and possibly other
##     BSD flavors with a few tweaks.  Windows Cygwin support is not yet planned
##     but could come later if there is a strong need...

## 2018-002-26 - Alisha Awen - siren1@disroot.org
##     Made this file generic and added it to my Github .dotfiles repository...

## 2014-006-09 - Alisha Awen - siren1@disroot.org
##     I copied this file from my old MacBook Pro when I was still using the
##     Bash shell.  I was not sure of the exact creation date when I added
##     this header to the top of this file...  
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: .bashrc Evaluation
## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "BASH INTERACTIVE - Entered & Evaluating:   \$DOTFILES/.bashrc"
fi
### ~~~~~~~~~~~~~~~~~~~~

## Source System Wide Global Definitions bashrc (if it is present).

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

### ~~~~~~~~~~~~~~~~~~~~
## Source $HOME/.bash_common:
## (common elements for both interactive & non-interactive bash shell sessions)
## This file also loads $PATH for all platforms...
## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.bashrc - Prepairing to Evaluate:   .bash_common"
fi
### ~~~~~~~~~~~~~~~~~~~~

if [ -f ~/.bash_common ]; then
	. ~/.bash_common
fi

## Uncomment the following line if you DO NOT Want systemctl's auto-paging feature:

# export SYSTEMD_PAGER=

### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: Interactive OS Specific Section
## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.bashrc - BEGIN:  OS Specific Section"
fi
### ~~~~~~~~~~~~~~~~~~~~

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    ### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Linux Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.bashrc - BEGIN:  LINUX CASE"        
    fi
    ### ~~~~~~~~~~~~~~~~~~~~

    ###
    ## Install Powerline Status Line Prompt:

    ## NOTE: First install Powerline Package from your Linux distro
    ##       to make this feature available for BASH to use...
    ##       Or, you could install it with pip3...

    ## NEXT: (after installing) set up symbolic link from $HOME/.powerline
    ##       to: (where the distro or you installed /powerline/bash/powerline.sh
    ##       which will be a different place depending on the distro install or
    ##       which version of Python you are using... etc. etc. etc.  This will
    ##       all be different depending on your OS and platform!!!
    ##       Therefore to keep thins simple put that symbolic link in your home
    ##       directory and keep it up to date if you upgrade python or re-install
    ##       powerline some other way... That's much easier than putting a bunch
    ##       of if/else if statements below... and then having to update that!!!

    if [ 'which powerline-daemon' ]; then

        ### ~~~~~~~~~~~~~~~~~~~~
        ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
        if [ "$SH_DBG" = true ] ; then
            echo "\$DOTFILES/.bashrc - Configuring POWERLINE for LINUX"        
        fi
        ### ~~~~~~~~~~~~~~~~~~~~

        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        source ~/.powerline  
    fi

    ### 
    ## On Linux The following are specialized and optional if needed:
    ## You probably won't want to enable this unless you are trying to remap
    ## keys for easier use of your fingers etc.  (see: Emacs Xah-Fly-Keys)

    ## ZSH only: Make Caps_Lock key do HOME key AND CAPS_LOCK is disabled!!
    ## Note: This is not set in BASH because those environments use a stripped
    ## down version of Emacs that has a much smaller attack surface...
    ## Those environments require simpler, more secure BASH with plain vanilla
    ## Emacs.  No bells or whistles to get exploited...

    ## This is for Emacs Xah-Fly-Keys (to make those keys fast & efficient)
    ## NOTE: You may decide to instead Swap Caps_Lock and HOME so that you
    ## don't loose the Caps_Lock toggle...  I don't need it but...
    ## A current side effect of the above is: If for some reason Caps Lock gets
    ## set before the Caps_Lock key gets mapped away to HOME then I have no
    ## way to turn it off without re-mapping the key back...  A pain!!!
    ## Swapping Caps_Lock with HOME turns out to be a magic art I am still
    ## not privileged to have knowledge of!!! (i.e., nothing I tried, worked)

#    xmodmap ~/.Xmodmap

    ## Also on Linux (everywhere) get rid of middle mouse button! This is
    ## something I have hated since the early days that SUN introduced it
    ## into the X Windows system...  Middle Mouse button is a UX hazard!
    ## SmallTalk did not need it, and neither did Apple... Both strong
    ## environments for a mouse to play in.. no middle button needed!
    ## Except to deploy that god mode smart bomb in your hacked video game.
    ## but then just use a key on the home row for that eh?  ;-) 

#    xinput set-button-map 6 1 1 3

    ####
    ## Mimic Mac OS pbcopy functions:
    ##  NOTE: You Must install the xclip Package from your Linux distro
    ##        to get this feature to work...

    alias pbcopy='xclip -sel clip'
    alias pbpaste='xclip -o -sel clip'

    ####
    ## qmake on Fedora is called qmake-qt5!
    ## If you are installing this on Fedora Linux, Un-comment (enable) the alias
    ## to stop confusion %^)

#    alias qmake='qmake-qt5'

    ### ~~~~~~~~~~~~~~~~~~~~
    ## END: Linux Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.bashrc - END: LINUX CASE"
    fi
    ### ~~~~~~~~~~~~~~~~~~~~

## END: IF [[ "$OSTYPE" == "LINUX-GNU" ]]; THEN

elif [[ "$OSTYPE" == "darwin"* ]]; then

    ### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Mac OS Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.bashrc - BEGIN:  MAC-OS CASE"
    fi
    ### ~~~~~~~~~~~~~~~~~~~~

    ###
    ## On MacOS I DON'T Install Powerline Status Line Prompt:
    ## NOTE: I do not use BASH in iTerm 2 on Mac OS because my mac defaults to zsh
    ##       as soon as it boots up.  Only remote sessions on Mac OS are BASH and
    ##       I don't want fancy fonts etc in remote log-in sessions

    ### If you want Powerline Status for MacOS Un-Comment this section...
    ## Install Powerline Status Line Prompt:
    ## NOTE: First run:
    ##       [~/]$ pip install --user powerline-status
    ##   from your home directory to make this feature
    ##   available for BASH to use...

    ## You need to figure out the path where pip put the bash script powerline.sh!
    ## That takes some fucking sysAdminFU magic!

#    if [ -f `which powerline-daemon` ]; then
#        powerline-daemon -q
#        POWERLINE_BASH_CONTINUATION=1
#        POWERLINE_BASH_SELECT=1
#        . /usr/share/powerline/bash/powerline.sh
#    fi

    ### ~~~~~~~~~~~~~~~~~~~~
    ## END: Mac OS Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.bashrc - END:   MAC-OS CASE"
    fi
    ### ~~~~~~~~~~~~~~~~~~~~

fi ## END: ELIF [[ "$OSTYPE" == "DARWIN"* ]]; THEN

### ~~~~~~~~~~~~~~~~~~~~
## END OS Specific Section:
## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.bashrc - END:    OS Specific Section"    
fi
### ~~~~~~~~~~~~~~~~~~~~



### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: Platform Independent Global Definitions:
## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.bashrc - BEGIN:  Final Generic Section"
fi
### ~~~~~~~~~~~~~~~~~~~~

## Set Aliases for emacs... (upper case is needed for some programs)
## NOTE: Change "your-user-name" below with your real user name...

alias emacs=$EMACS
alias Emacs=$EMACS
alias rmacs="sudo $EMACS --user=your-user-name"

###
## Generic Global Alias Definitions:

alias l="ls -lhFB --color --ignore='Icon?' --ignore='.#*' --ignore='#*' --group-directories-first"
alias ll="ls -AlhFB --ignore='.DS_Store' --ignore='Icon?' --ignore='.#*' --ignore='#*' --color --group-directories-first"
alias lll="ls -alhF --color --group-directories-first"
alias la="ls -A --color --ignore='.DS_Store' --ignore='Icon?' --group-directories-first"

alias cl="clear"

## colored GCC warnings and errors

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Choose which default Python you want to use below... These have been commented
## out by default. If you need this, change "Python3" and "pip3" below to the
## version you want to use and un-comment those lines....
## (btw, this may be needed by shell scripts - i.e. put in .bash_common instead)

# alias python="python3"
# alias pip="pip3"

###
## GIT Aliases - I cloned these from my oh-my-zsh setup they mirror
## the aliases defined within the GIT plugin on default Oh-My-Zsh.
## (NOTE! if you use Oh-My-Zsh as well it may be a good idea to
## keep these in sync with their Oh-My-Zsh GIT Equivalents):

alias gst='git status'

alias gl='git log'
alias gls='git log --stat'
alias glg='git log --graph'
alias glsp='git log --stat -p'
alias glgda='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'

alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -m"
alias gt="git tag -a"

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'

alias gd='git diff'
alias gdns="git diff --name-status"
alias gdnm="git diff --name-status master"
alias gdnd="git diff --name-status develop"
alias gdnt="git diff --name-status testing"

alias gck='git checkout'
alias gckb='git checkout -b'
alias gcktr='git checkout --track'
alias gckm="git checkout master"
alias gckd="git checkout develop"
alias gckt="git checkout testing"

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gfm="git fetch origin master"
alias gfd="git fetch origin develop"
alias gft="git fetch origin testing"

alias gpl='git pull'
alias gplo='git pull origin'
alias gplm="git pull origin master"
alias gpld="git pull origin develop"
alias gplt="git pull origin testing"

alias gm='git merge'
alias gmt='git merge testing'
alias gmd='git merge develop'

alias gph='git push'
alias gpu='git push -u'  # Push & Set Upstream (tracking) ref...
alias gpo='git push origin'
alias gpht="git push origin testing"

alias gphm="git push origin master"
alias gpum="git push -u origin master"
alias gphd="git push origin develop"
alias gpud="git push -u origin develop"

alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpv='git push -v'

#### ~~~~~~~~~~~~~~~~~~~~
## END: Generic Interactive Platform Independent Section
## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.bashrc - END:    Generic Section"
fi
#### ~~~~~~~~~~~~~~~~~~~~

### ~~~~~~~~~~~~~~~~~~~~
## END: .bashrc - Leaving file...
## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "END:   \$DOTFILES/.bashrc - Leaving File..."
fi
### ~~~~~~~~~~~~~~~~~~~~

#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##   END: $HOME/.bashrc
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
