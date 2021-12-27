# -*- mode: sh -*-
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File:          $HOME/.profile
##                Dummy .profile for BASH backward compatability.  This file
##                if invoked will call ~/.bash_common (which takes its place)...
## Created:       2019-005-16
## Modified:      2021-012-22
## Author:        Alisha Awen - Siren1@disroot.org
## Copyright:     (© 2019 - 2022 by Alisha Awen, Siren1@disroot.org, all rights reserved)
## Git Username:  harmonicalchemy
## Ref:           https://www.gnu.org/software/bash/
## Repo:          https://github.com/harmonicalchemy/dotfiles.git
## Licence:       GNU General Public License v3.0
## Environment:   Linux, BSD, (Qubes 4.0 nx App VMs) and Mac OS
##                (not for hosted servers)

## Note1: If you have a legacy .profile file in your $HOME directory,
##        BASH will source it if it does not find any such .bash_profile in
##        there! ".profile" comes from the "wicked-old-days" I remember ;-)  
##        It's still around only because BASH includes it for backward
##        compatibility and that has preserved it due in part on the laziness
##        of sysAdmins and partly due to distro maintainers accommodating those
##        lazy system Administrators to keep them happy and contented.
##        Backwards compatability on a production machine serves no productive
##        purpose!  The objective is to sail your merchant ship as fast as she
##        can go... And avoid all those pirates! Arrrrrr!!!

## Note2: Zsh also sources .profile $ZDOTDIR is not set, $HOME is used instead.

###
## Change Log: (descending chronological order)

## 2021-012-22 - Alisha Awen - Siren1@disroot.org
##     Updated this file and put it in new .bash.d sub-directory:
##     .DOTFILES Security DueDiligence done up to: Q4 2021 now...

## 2020-002-002 - Alisha Awen - Siren1@disroot.org
##     Updated this file to copy it for using within my public
##     .DOTFILES repo...  Security DueDiligence up to Q1 2020 now...
##     This file is not actually used unless you loose your .bash_profile
##     But I included it anyway... I was using it to troubleshoot my shell...

## 2019-005-16 - Alisha Awen - siren1@disroot.org
##     This file is brand new... I cloned it from my existing .bash_profile.
##     Just like .bash_profile this simply calls my own: ~/.bash_common...
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

###
##    For INTERACTIVE Shells SH evaluates this file but NOT ~/.bashrc of course!
##    Therefore for that case, we need to load ~/.bashrc from this file,
##    AND NOT load our custom ~/.bash-common file because ~/.bashrc
##    loads that file for us....
##

##  First Check If INTERACTIVE:
##    If
##      Shell IS INTERACTIVE: Evaluate $HOME/.bashrc AND exit! We are done here.
##    ELSE
##      Only Evaluate $HOME/.bash_common...
##    That's all folks...

##  NOTE: 
##    For NON-INTERACTIVE Shells we need to load our custom ~/.bash_common
##    init file, which sets environment variables for both BASH & Bourne...

if [[ $- == *i* ]]; then

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: .profile Evaluation - Entering File
    ## NOTE: The DEBUG Statements won't work for NON-INTERACTIVE of course.
    ## TODO: Change NON-INTERACTIVE Debug statements to write to log file instead...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "BOURNE SH LOGIN - Entered & Evaluating:   \$DOTFILES/.profile"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: BOURNE Shell Interactive...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "BOURNE SH LOGIN INTERACTIVE - \$DOTFILES/.profile - Preparing to Evaluate:   .bashrc"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi

else

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: BOURNE Shell NON Interactive...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
#    if [ "$SH_DBG" = true ] ; then
#        echo "BOURNE SH LOGIN NON-INTERACTIVE - \$DOTFILES/.profile - Preparing to Evaluate:   .bash_common"
#    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    ###
    ##  Evaluate $HOME/.bash_common:
    ##    Common environment elements needed by interactive,
    ##    non-interactive, & login shell sessions alike...

    if [ -f ~/.bash_common ]; then
	. ~/.bash_common
    fi

fi

##  This is all for now... I may have to add more to this for Ubuntu VPS droplets.

if [[ $- == *i* ]]; then
    #### ~~~~~~~~~~~~~~~~~~~~
    ## END: $HOME/.profile - Leaving File...
    ## DEBUG Print Statements: (Export SH_DBG=true (top of .bash_common) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "END:   \$DOTFILES/.profile - Leaving File..."
    fi
fi

#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##   END: $HOME/.profile
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
