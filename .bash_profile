# -*- mode: sh -*-
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  File:          $HOME/.bash_profile
#                 Multiplatform Bash Configurations for Non Interactive Shells,
#                 _AND_ Login (interactive) Shells.
#  Created:       2019-002-16
#  Modified:      2020-002-02
#  Author:        Alisha Awen - Siren1@HarmonicAlchemy.productions
#  Git Username:  harmonicalchemy
#  Ref:           https://www.gnu.org/software/bash/
#  Repo:          Github.com:harmonicalchemy/pDotfiles.git
#  Environment:   Linux, BSD, (Qubes 4.0 App VMs) and Mac OS
#                 (not for hosted VPS or bare metal servers)
#
#  This config file is only sourced by BASH when your session is non-interactive
#  (e.g., shell script invoked, etc.) _OR_ it is a human interactive login
#  session, either remotely from another machine or locally, by using something
#  like an X11 virtual terminal or web-client which is basically the same thing
#  as a remote login, from outside (above) the "shell" layer of the OS.  Because
#  of this "Born Again Satanic-Hell rule" (lol ;-), I created $HOME/.bash_common
#  which is sourced from both $HOME./bashrc & this $HOME/.bash_profile.  Using
#  your own $HOME/.bash_common is the preferred best-practice method.  An
#  alternate method that "a-lot-of-guys" (including me in the past) do of
#  sourcing $HOME/.bashrc from $HOME/.bash_profile can cause many problems!
#  I learned the "hard" way...
#
#  Note1:    If you have a legacy .profile file in your $HOME directory,
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
#    2019-006-26 - Alisha Awen Sheppard -  siren1@disroot.org
#      Completely re-wrote this file all over yet again!  We can now handle
#      BASH INTERACTIVE & NON-INTERACTIVE Shells...   Added debug print
#      statements... (that will be commented out when not debugging)...
#
#    2019-005-16 - Alisha Awen Sheppard -  siren1@disroot.org
#      This file needed an overhaul after all the troubleshooting over several
#      months (both Mac OS and Linux).  I cleaned this up and also added some
#      settings copied from [vault-[pgp] clone of this file which may fix some
#      issues I am having trying to get git-remote-gcrypt to work...  The
#      structure here is now simpler...  I hope I did not break anything!
#      I am on [MWM-work] now.  I will have to test this on Rodrigo next...
#      Still no fix for Emacs environment vars problem... Boot from shell works.
#
#    2019-002-16 - Alisha Awen siren1@disroot.org
#      Created this new file for Bash shell on any machine... This file needs to
#      source $HOME/.bash_common to grab common definitions needed by all shell
#      sessions (interactive, non-interactive, and login). 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

##
#  First Check If INTERACTIVE:
#    If
#      Shell IS INTERACTIVE: Evaluate $HOME/.bashrc AND exit! We are done here.
#    ELSE
#      Only Evaluate $HOME/.bash_common...
#    That's all folks...
#
#  NOTE: 
#    For NON-INTERACTIVE Shells we need to load our custom ~/.bash_common
#    init file, which sets environment variables for bash and bourne...
#    For INTERACTIVE Shells BASH evaluates this file but NOT ~/.bashrc
#    Therefore for that case, we need to load ~/.bashrc from this file,
#    AND NOT load our custom ~/.bash-common file because ~/.bashrc
#    loads that file for us....

if [[ $- == *i* ]]; then

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: .bash_profile Evaluation - Entering File
    # DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "BASH ENV AND/OR LOGIN - Entered & Evaluating:   \$DOTFILES/.bash_profile"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Bash Interactive...
    if [ "$SH_DBG" = true ] ; then
        echo "BASH INTERACTIVE - \$DOTFILES/.bash_profile - Preparing to Evaluate:   .bashrc"        
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi

else

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Bash NON Interactive...
    # DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
    # This is NON-INTERACTIVE (better print this to a log file rather than console!) 
    # Also check for NON-INTERACTIVE in .bash_common for same reason...
    #    if [ "$SH_DBG" = true ] ; then
#        echo "BASH NON-INTERACTIVE - \$DOTFILES/.bash_profile - Preparing to Evaluate:   .bash_common"
#    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    ##
    #  Evaluate $HOME/.bash_common:
    #    Common environment elements needed by interactive,
    #    non-interactive, & login shell sessions alike...

    if [ -f ~/.bash_common ]; then
	. ~/.bash_common
    fi

fi

##  This is all for now... I may have to add more to this for Ubuntu VPS droplets.

if [[ $- == *i* ]]; then
    #### ~~~~~~~~~~~~~~~~~~~~
    ## END: $HOME/.bash_profile - Leaving File...
    # DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "END:   \$DOTFILES/.bash_profile - Leaving File"
    fi
fi

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END: $HOME/.bash_profile
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
