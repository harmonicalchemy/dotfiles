# -*- mode: sh -*-
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File:          $HOME/.zshenv
##                Global Multiplatform ZSH Configs for: Non Interactive Shells...        
## Created:       2019-001-24
## Modified:      2022-001-18
## Author:        Alisha Awen - Siren1disroot.org
## Copyright:     (© 2019 - 2022 by Alisha Awen, Siren1@disroot.org, all rights reserved)
## Git Username:  harmonicalchemy
## Ref:           https://www.zsh.org/
## Repo:          https://github.com/harmonicalchemy/dotfiles.git
## Licence:       GNU General Public License v3.0
## Environment:   Linux, BSD, (Qubes 4.0 nx App VMs) and Mac OS
##                (not for hosted servers)

## $HOME/.zshenv is always sourced by ZSH upon startup, (all modes)... 
## This file  is also sourced first before any of the other config files...
## Therefore this file is an excellent place to define common configs needed for
## all situations. (interactive, non-interactive, login, etc.) $PATH definitions
## (used by all modes) will be set exclusively within this file only...
## No need to duplicate things unnecessarily, which could also cause unexpected
## side effects!  Everything else defined here is intended for: NON INTERACTIVE
## use exclusively. Anything that sends output to the screen, or
## expects a human response, should not be defined within this file...

## This simple version of Harmonic Alchemy "Dotfiles" does not need to do
## anything fancy like define $ZDOTDIR. Also there is no current need for a
## .zlogin, .zlogout, or .zprofile.  _yet_  There are no current plans for these
## extra config files until I reach a more automated dotfiles stage with auto configs
## for remote VPS host environments folded in...  First lets get this all working
## great manually...

## Please do add/remove definitions depending on your particular machine
## environment(s) but please try to keep the structure and sections below the
## same as they are now... There is a reason for that!  Add your custom mods
## within the sections that they belong in.  Please don't try to move sections
## around etc.  You may break some things!  Be careful...  Sections are well
## defined below with comment banners for us dumb humans to be able to read...

###
## Change Log: (descending chronological order)

## 2022-001-18 - Alisha Awen - Siren1@disroot.org
##     Refreshed (synced) this file to match generic changes made to my private
##     .DOTFILES repository...  (all docs are up to date as well)
##     Performed Security DueDiligence for Q1 2022...
##     This commit marks Harmonic Alchemy .DOTFILES as: Version 2.0

## 2021-012-24 - Alisha Awen - siren1disroot.org
##     Updated this file with mods made to my private DOTFILES version of this
##     file... Minor changes to PATH, etc... Major reformatting of comments to
##     match the style within my Public DOTFILES version of this file... Headings
##     were changed to aid with this public version. Some settings previously in
##     .zshrc were put here (to match what I did with .bashrc and .bash_common...
##     Performed security due diligence work for 2022

## 2021-012-24 - Alisha Awen - siren1disroot.org
##     Updating this file from my Private DOTFILES version to sync with latest
##     changes before commit to public DOTFILES repository...
##     Performing security due diligence work for 2022... 

## 2020-002-02 - Alisha Awen - siren1disroot.org
##     Copied this file fresh from .zshenv on my private .DOTFILES repo.
##     Performed some security due diligence work for 2020... 

## 2019-006-26 - Alisha Awen - siren1@disroot.org
##     HUGE OVERHAUL for Mac OS mostly...  Also added debug print
##     statements... (that will be commented out when not debugging)...

## 2019-005-16 - Alisha Awen - siren1@disroot.org
##     This file needed an overhaul after all the troubleshooting over several
##     months (both Mac OS and Linux).  I cleaned this up and also added some
##     settings copied from [vault-pgp] .bash_common which may fix some issues I
##     am having trying to get git-remote-gcrypt to work...  The structure here
##     is now simpler...    I hope I did not break anything!
##     I am on [MWM-work] now.  I will have to test this on Rodrigo next...
##     Still no fix for Emacs environment vars problem... Boot from shell works.

## 2019-003-16 - Alisha Awen - siren1@disroot.org
##     While I am troubleshooting Mac OS problems, I am now trying this on my 
##     older Macbook Pro to see how things go with Mac OS El Capitan, which is
##     no longer supported by Apple or Homebrew.  If I can get this working there
##     that will be a nice thing for folks who can only afford cheap old Macs
##     (i.e., The "real" rest of us, if a Mac is still that computer for the rest
##     of us that is)...  My first serious home box was a used refurbished
##     Mac IIx (that was a long time ago)...  It was still considered pretty
##     powerful when I got it. (it was my first Digital Audio Workstation (DAW)
##     for making music back around 1995) ;-)

## 2019-002-14 - Alisha Awen - siren1@disroot.org
##     I have been troubleshooting Zsh problems on Mac OS for a while... 
##     First environment variables and now Zsh is not loading correctly...
##     I believe I have a lame Mac OS solution running now. (with band-aid)
##     So far on Mac OS it is working as long as you start Emacs from the shell.
##     Qubes (Fedora 29, Debian 9) etc. work nicely now...

## 2019-002-08 - Alisha Awen - siren1@disroot.org
##     Reorganized this file to make it multiplatform like its companion .zshrc...

## 2019-001-24 - Alisha Awen - siren1@disroot.org
##     Copied most (except one or two) exports from .zshrc to this new file...
##     Also copied some things from old legacy .profile into here as well...
##     Removed .profile from my Mac OS $HOME.  Not needed anymore according to
##     BASH official docs...  I am still trying to get Emacs environment in sync
##     with Zsh, Bash, etc...
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

export SH_DBG=false

#### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: .zshenv Evaluation - Entering File
## DEBUG Print Statements: (Export SH_DBG=true (above) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "ZSH ENV - Entering & Evaluating:   \$DOTFILES/.zshenv"
fi
#### ~~~~~~~~~~~~~~~~~~~~

## Set architecture flags to X86 64bit (all platforms):

export ARCHFLAGS="-arch x86_64"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  BEGIN: OS Specific Sections
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Linux Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshenv - BEGIN:  LINUX CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    ## Define Local Go Language environment:
    ## (This needs to be before bin PATH definitions)
    ## If you use Go, un-comment the following and adjust path to your Go environment
    ## accordingly... (below is a simlink in home directory)
    ## Also: Make sure the Go related path line is defined in your $PATH below, using
    ## this ENVIRONMENT VAR here... (set by default)

    export GOPATH="$HOME/gopath"

    ###
    ## Export Linux specific $PATH:
    ##   NOTE1:  Update the single line Path definitions below, from other lines
    ##           that are sometimes programmatically added to the bottom of other
    ##           shell init files after installing things!  Don't let them get
    ##           all tangled up in different places! Keep them all here in one
    ##           place!
    ##
    ##   NOTE2:  Make sure all /bin directory paths under `/user/local` occur
    ##           BEFORE `/usr/bin` directory paths within the export directive
    ##           below.
    ##
    ##   NOTE3:  You may need to make adjustments to the default path exports
    ##           below depending on your flavor of unix, and whether you have
    ##           some of the packages/plugins/binaries/libraries installed in a
    ##           different place. But for most cases, the exports already defined
    ##           below are the default paths on Linux and Mac OS.  The .rbenv
    ##           paths assume you installed .rbenv and used it to install ruby.
    ##           (change it if you don't want it) Remove $GOPATH below if you
    ##           DO NOT use Go IDE...
    ###

    ## Export Linux executable $PATH:
    export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$GOPATH/bin:/var/lib/gems/2.5.0/gems/reckon-0.8.0/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"

    ####
    ## Qubes Split SSH:
    ## NOTE: This section is only used for Qubes OS machines that use Qubes App
    ##       Split SSH schemes...  If you do that, un-comment the lines in this
    ##       secton...

    ## Set next line to the ssh key vault you want to use

#    SSH_VAULT_VM="name-of-your-Qubes-split-SSH-App-VM"

#    if [ "$SSH_VAULT_VM" != "" ]; then
#        export SSH_AUTH_SOCK=~user/.SSH_AGENT_$SSH_VAULT_VM
#    fi

    ####
    ## Qubes Split GPG tweaks... If you use Qubes AND Split GPG
    ## Un-comment the alias tweaks below for convenient three letter alias...

#    alias gpq="qubes-gpg-client"
#    alias gpw="qubes-gpg-client-wrapper"

#    export QUBES_GPG_DOMAIN="name-of-your-Qubes-split-GPG-App-VM"
#    export QUBES_GPG_AUTOACCEPT=86400
    
    ## Leave This Set As Is: This to ensure you are using GnuPG v2 not an
    ## older version which is No Longer Secure!!!

    alias gpg="/usr/bin/gpg2"

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ##  Top Level Linux Machine Specific Exports:
    ##  NOTE: These must be defined before the
    ##        Generic Platform Independent
    ##        Exports are defined below!
    ##        (where these are referenced anchors)
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ###
    ## Set GnuPG Environment Variable - for Linux programs to use:
    ## Most Linux "just works" when invoked with "gpg" but I need this Env Var
    ## for my .gitconfig which is used on many platforms including Qubes Split
    ## GPG which uses a wrapper program to invoke it....  Leave the setting
    ## below as-is unless you fit into a special case like the commented out
    ## setting below it...

    export GPG_PROG=gpg2
#    export GPG_PROG=qubes-gpg-client-wrapper

    ###
    ## Set Default Emacs for Linux programs to use:
    ## On Linux the setting below should "just work" fine...  However if emacs
    ## was not installed by Package Managers i.e., built from source in your home
    ## directory, etc., or different App name, you may have to add Env Vars
    ## and/or alter the path and/or App name in the export below:

    export EMACS=emacs
    export EMACSCLIENT=emacsclient

    ## Define Main GIT Home directory:
    ## (for all or most of your cloned git projects)

    export GIT=$HOME/GIT

    ## Define Main WWW directory:
    ## (for all or most of your web site and web app projects)

    export WWW=$HOME/WWW

    #### ~~~~~~~~~~~~~~~~~~~~
    ## END: Linux Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshenv - END:    LINUX CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

## END: IF [[ "$OSTYPE" == "LINUX-GNU" ]]; THEN

elif [[ "$OSTYPE" == "darwin"* ]]; then

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Mac OS Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshenv - BEGIN:  MAC-OS CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    ###
    # Export Mac OS specific $PATH:
    #   NOTE1:  Update the single line Path definitions below, from other lines
    #           that are sometimes programmatically added to the bottom of other
    #           shell init files after installing things!  Don't let them get all
    #           tangled up in different places! Keep them all here in one place!
    #
    #   NOTE2:  Make sure all /bin directory paths under `/user/local` occur BEFORE
    #           `/usr/bin` directory paths within the export directive below.  This
    #           is mostly for the sake of Homebrew on Mac OS...
    #
    #   NOTE3:  You may need to make adjustments to the default path exports below
    #           depending on your flavor of unix, and whether you have some of the
    #           packages/plugins/binaries/libraries installed in a different place.
    #           But for most cases, the exports already defined below are the default
    #           paths on Linux and Mac OS.  The .rbenv paths assume you installed
    #           .rbenv and used it to install ruby. (change it if you don't want it)
    ###

    ## Export Mac OS specific $PATH: (This may be different for older versions of Mac OS)

    export PATH="$HOME/.bin:$HOME/.local/bin:$HOME/Qt/5.12.9/clang_64/bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH"

    ## Export GNU Info & MAN Paths: (This may be different for older versions of Mac OS)
    ## You probably don't need this unless you have manuals set in other places...

#    export INFOPATH="/usr/share/info:/usr/share/man:$INFOPATH"
#    export MANPATH="/usr/share/man:$MANPATH"

    ###
    ## Export LD_LIBRARY and PKG_CONFIG Path:
    ## (for MacPorts Users Only)
    ## If you use MacPorts, un-comment (enable) the two lines below:

#    export LD_LIBRARY_PATH=/opt/local/lib:$LD_LIBRARY_PATH
#    export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH

    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ##  Top Level MacOS Machine Specific Exports:
    ##  NOTE: These must be defined before the
    ##        Generic Platform Independent
    ##        Exports are defined below!
    ##        (where these are referenced anchors)
    ### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ###
    ## Set Gnupg Environment Variable - for MacOS programs to use:
    ## MacOS "just works" when invoked with "gpg" but I need this Env Var for my
    ## .gitconfig which is used on many platforms including Qubes Split GPG which
    ## uses a wrapper program to invoke it... Leave this setting as is unless you
    ## have some special case on MacOS that needs something else...

    export GPG_PROG=gpg2

    ###
    ## Set Default Emacs for MacOS programs to use:
    ## If not installed in standard MacOS Applications folder or built from
    ## source, or different App name, you may have to add Env Vars and/or alter
    ## the path and/or App name in the export below:
    ## for most cases however the /Contents/MacOS/Emacs part below won't change.

    export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
    export EMACSCLIENT="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
 
    ## Define Main GIT Home directory:
    ## (for all or most of your cloned git projects)
    ## Adjust path below as needed...

    export GIT=$HOME/.GIT

    ## Define Main WWW directory:
    ## (for all or most of your web site and web app projects)
    ## Adjust path below as needed...
    
    export WWW=$HOME/.WWW

    #### ~~~~~~~~~~~~~~~~~~~~
    ## END: Mac OS Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshenv - END:    MAC-OS CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

fi ## END: ELIF [[ "$OSTYPE" == "DARWIN"* ]]; THEN

#### ~~~~~~~~~~~~~~~~~~~~~
##   END: OS Specific Section:
#### ~~~~~~~~~~~~~~~~~~~~~

#### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: Generic Platform Independent Exports (all unix flavors):
## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.zshenv - BEGIN:  Final Generic Section"
fi
#### ~~~~~~~~~~~~~~~~~~~~

###
## Export your PGP Primary Key Fingerprint for easy input for commands etc. 
## LOL - I wonder if anyone really does have the folllowing fingerprint!

export SFING="0xFFFFAAAA55550000FFFFAAAA55550000FFFFAAAA"

## $EDITOR for all platforms.

export EDITOR=$EMACS

###
## Ensure GnuPG gets the output of the 'tty' command.

export GPG_TTY=$(tty)

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Platform Independent Global Directory Definitions:
# NOTE: These are suggested defaults... Adjust these
# as needed for your own environment setup...
# NOTE: These must be set AFTER the OS Specific 
#       Global Directory Defs are defined above...
#       If those are not defined first you will
#       see errors!
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Define Global Path to my Development SandBox (DSB)

export DSB=$GIT/dev-sandbox

## Define Global Path to Tools Presets (for tools like .dotfiles) home directory:

export TOOLS=$GIT/tools

## Define Global Path to public .dotfiles (Github:HarmonicAlchemy)

export DF=$TOOLS/dotfiles

## Define Global Path to My-Docs" home Directory:

export MD=$GIT/My-Docs

## Define your www devOps home directory:

export MWMD=$WWW/DevOps

## Define Global Path to your "Personal Templates" home Directory:

export PT=$GIT/Personal-templates

#### ~~~~~~~~~~~~~~~~~~~~
## Load NVM: (Node.js, NPM) etc... (disabled by default)
## NOTE: This section requires NVM/NPM to be installed...
##       (i.e. You cloned or installed 'creationix/nvm' from Github locally in
##        your $HOME environment.)
##
## This is needed for Harmonic Alchemy Modular Emacs, and YOU will eventually
## need this for some nice web-apps and tools as well!
## If you ARE or intend to use NVM/NPM than un-comment (enable) this section...

#### ~~~~~~~~~~~~~~~~~~~~
## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
# if [ "$SH_DBG" = true ] ; then
#    echo "\$DOTFILES/.zshenv - LOAD:   NVM Enviornment & Completions"
# fi
#### ~~~~~~~~~~~~~~~~~~~~

# export NVM_DIR="$HOME/.nvm"

###
## Load nvm:

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

###
## Load NVM bash_completion:

# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#### ~~~~~~~~~~~~~~~~~~~~
## Load rbenv Ruby Version Management Tool: (disabled by default)
## NOTE:  This section requires Ruby and rbenv to be installed...
##        If you intend to use Ruby and rbenv, un-comment (enable) this section
##        Make sure you have cloned rbenv from Github to $HOME/.rbenv!
##        If you do not use rbenv leave this section disabled AND remove the
##        the .rbenv path definition from above path export line as well!

#### ~~~~~~~~~~~~~~~~~~~~
## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
# if [ "$SH_DBG" = true ] ; then
#    echo "\$DOTFILES/.zshenv - LOAD:   Ruby Version Management Tool"
# fi
#### ~~~~~~~~~~~~~~~~~~~~

# if which rbenv > /dev/null; then
#    eval "$(rbenv init -)";
# fi

#### ~~~~~~~~~~~~~~~~~~~~
## Create: $HOME/.gitconfig for the specific platform that this BASH 
## session is currently running on:

. $PDF/.bin/generate_gitconfig.sh

#### ~~~~~~~~~~~~~~~~~~~~
## END: Generic Platform Independent Definitions (all unix flavors):
## END: ~/.zshenv - Leaving File...
## DEBUG Print Statements: (Export SH_DBG=true (above at top) to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.zshenv - END:    Final Generic Section - Leaving File"
fi
### ~~~~~~~~~~~~~~~~~~~~

#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##   END: $HOME/.zshenv
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

