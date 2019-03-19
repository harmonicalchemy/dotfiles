# -*- mode: sh -*-
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  $HOME/.bash_profile - Multiplatform Bash Configurations for Login (interactive)
#                        _AND_ Non Interactive Shells.
#
#  Author:   Alisha Awen Sheppard - siren1@disroot.org
#  Created:  2019-002-16
#
#  Note1:    This file is only read in (sourced) by Bash when your session is
#            non-interactive (sh script invoked etc.) or a human interactive
#            login session.  (i.e., you are logging in, either remotely from
#            another machine or using something like an X11 virtual terminal etc.
#            which is basically the same thing as a remote login, from outside
#            (above) the "shell" layer of the OS.  Because of this "Born
#            Again Satanic-Hell rule" (lol ;-), I created $HOME/.bash_common
#            which is sourced from both $HOME./bashrc & this $HOME/.bash_profile.
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
#    2019-002-16 - Alisha Awen siren1@disroot.org
#      Created this new file for Bash shell on any machine... This file needs to
#      source $HOME/.bash_common to grab common definitions needed by all shell
#      sessions (interactive, non-interactive, and login). 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

##
#  Source $HOME/.bash_common:
#  Common elements needed by interactive, non-interactive, & login shell sessions
#  This file also loads $PATH for all platforms...
if [ -f ~/.bash_common ]; then
	. ~/.bash_common
fi

##
#  This is all for now... (simple is nice ;-)  Later, I may have to add more to
#  this for Ubuntu VPS droplet configurations.
##

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END $HOME/.bash_profile:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

