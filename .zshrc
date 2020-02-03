# -*- mode: sh -*-
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File:          $HOME/.zshrc
##                Multiplatform ZSH Configuration for Interactive Shells...
## Created:       2017-004-23
## Modified:      2020-002-02
## Author:        Alisha Awen - Siren1@HarmonicAlchemy.productions
## Git Username:  harmonicalchemy
## Ref:           https://www.zsh.org/
## Repo:          Github.com:harmonicalchemy/pDotfiles.git
## Environment:   Linux, BSD, (Qubes 4.0 App VMs) and Mac OS
##                (not for hosted VPS or bare metal servers)
##
## $HOME/.zshrc is sourced by ZSH at the start of an interactive shell session.  It
## contains commands to set up aliases, functions, options, key bindings, etc.
## for interactive use only.  Here is where the Antigen ZSH package manager,
## fancy bullet train prompts, and any variables that are only used in the
## interactive shell like colors etc.
##
## This simple version of Harmonic Alchemy "Dotfiles" does not need to do
## anything fancy like define $ZDOTDIR. Also there is no current need for a
## .zlogin, .zlogout, or .zprofile.  _yet_  There are no current plans for these
## extra config files until I reach a more automated dotfiles stage with auto configs
## for remote VPS host environments folded in...  First lets get this all working
## great manually...
##
## Please do add/remove definitions depending on your particular machine
## environment(s) but please try to keep the structure and sections below the
## same as they are now... There is a reason for that!  Add your custom mods
## within the sections that they belong in.  Please don't try to move sections
## around etc.  You may break some things!  Be careful...  Sections are well
## defined below with comment banners for us dumb humans to be able to read...
##
## Change Log: (descending chronological order)
##
## 2020-002-02 - Alisha Awen - Siren1@HarmonicAlchemy.productions
##     Copied this file from my Private .DOTFILES repo,
##     Performed security Due Diligence in the process... Up to date
##     for 2020 now...
##
## 2019-010-27 - Alisha Awen Sheppard - siren1@disroot.org
##     Made changes to accomodate for switching from HomeBrew to MacPorts on
##     Mac OS...  All refs to /usr/local are gone... /opt/local is now the
##     default global place for MacPorts...  /usr/local is lonely!
##
## 2019-006-26 - Alisha Awen Sheppard - siren1@disroot.org
##     HUGE OVERHAUL for Mac OS mostly...  Also added debug print
##     statements... (that will be commented out when not debugging)...
##
## 2019-005-16 - Alisha Awen Sheppard -  siren1@disroot.org
##     This file needed an overhaul after all the troubleshooting over several
##     months (both Mac OS and Linux).  I cleaned this up and also added some
##     settings copied from [vault-pgp] .bashrc which may fix some issues I am
##     having trying to get git-remote-gcrypt to work...  The structure here is
##     now simpler...     I hope I did not break anything!
##     I am on [MWM-work] now.  I will have to test this on Rodrigo next...
##     Still no fix for Emacs environment vars problem... Boot from shell works.
##
## 2019-003-16 - Alisha Awen Sheppard -  siren1@disroot.org
##     While I am troubleshooting Mac OS problems, I am now trying this on my
##     older Macbook Pro to see how things go with Mac OS El Capitan, which is
##     no longer supported by Apple or Homebrew.  If I can get this working there
##     that will be a nice thing for folks who can only afford cheap old Macs
##     (i.e., The "real" rest of us, if a Mac is still that computer for the rest
##     of us that is)...  My first serious home box was a used refurbished
##     Mac IIx (that was a long time ago)...  It was still considered pretty
##     powerful when I got it. (it was my first Digital Audio Workstation (DAW)
##     for making music back around 1995) ;-)
##
## 2019-002-15 - Alisha Awen siren1@disroot.org
##     I am now testing this over on [MWM-work] and things are broken! SSH no
##     longer works!  It may be an Antigen plugin...
##     Maybe one related to SSH?  I am first trying to fix ssh by moving all
##     that to sections after the "antigen apply" line... This file has been
##     restructured significantly!  I hope it still works on Mac OS! ;-)
##
## 2019-002-14 - Alisha Awen siren1@disroot.org
##     I have been troubleshooting Zsh problems on Mac OS for a while...
##     First environment variables and now ZSH is not loading correctly...
##     However, I believe I have a working Mac OS solution running now
##     (with band-aid).  Mac OS it will work fine as long as you start Emacs
##     from the shell. Linux (Fedora 29, Debian 9). work nicely now...
##
## 2019-002-02 - Alisha Awen siren1@disroot.org
##     I am testing re-configuring this on Fedora now on a new branch
##     within my private dotfiles Repository.  I had to branch because
##     I started changes on the Mac as well.  I will sort all this out later.
##     For now I need to get Linux back in operation.  Then I will be able
##     to sync with remotes again and update Github!
##
## 2019-001-24 - Alisha Awen siren1@disroot.org
##     I had to re-create this file from my .zshrc template in my `dotfiles`
##     git repository yesterday!  The original got hosed while I was attempting
##     to fix an environment sync problem in my new Modular Emacs upgrade on
##     Mac OS.  The exports I had previously removed from here to .Profile &
##     a new file, .zshenv were copied back into this file.  Everything broke
##     when it was removed!  OMG!  Things seem to be back to normal now.  I
##     have duplicated most (except for one or two) exports in all three files
##     now:  `.zshrc`, `.zshenv`, & `.profile`.  I hope the redundant exports
##     do not create a problem... I may not have the correct solution for
##     Syncing my environment with Emacs yet...  More troubleshooting needed...
##
##     In addition to above, this file is being restructured to be multiplatform.
##     During this process I discovered my Zsh/Antigen/Oh-My-Zsh setup was all
##     messed up and out of date.  (probably the reason behind all my other
##     problems! (time will tell soon enough)...  I updated Homebrew, zsh, etc.
##     (see below under Load Antigen Zsh Plugin Manager heading) Once all that
##     has been updated, upgraded, if this is working well on Mac OS, I will
##     then update my dotfiles repository (change it to private on Bitbucket
##     first!)...  Then it will be available to try out in my Qubes Environment.
##
## 2018-002-26 - Alisha Awen siren1@disroot.org
##     Made this file generic and added it to my Github .dotfiles repository...
##
## 2017-004-23 - Alisha Awen siren1@disroot.org
##     This file was created by first copying my existing .bashrc file and then
##     modifying that for my newly installed ZSH environment on my new iMac.
####~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: .zshrc Evaluation - Oh-My-Zsh SETUP
# DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
if [ "$SH_DBG" = true ] ; then
    echo "ZSH INTERACTIVE - Entering & Evaluating:   \$DOTFILES/.zshrc"
fi
#### ~~~~~~~~~~~~~~~~~~~~

## Path to your oh-my-zsh installation:

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

## Set name of the theme to load --- if set to "random", it will
## load a random theme each time oh-my-zsh is loaded, in which case,
## to know which specific one was loaded, run: echo $RANDOM_THEME
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="kardan"
#ZSH_THEME="nanotech"
ZSH_THEME="theunraveler"
#ZSH_THEME="agnoster"

## Set list of themes to pick from when loading at random
## Setting this variable when ZSH_THEME=random will cause zsh to load
## a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
## If set to an empty array, this variable will have no effect.

#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

## Uncomment the following line to use case-sensitive completion.

#CASE_SENSITIVE="true"

## Uncomment the following line to use hyphen-insensitive completion.
## Case-sensitive completion must be off. _ and - will be interchangeable.

#HYPHEN_INSENSITIVE="true"

## Uncomment the following line to disable bi-weekly auto-update checks.

#DISABLE_AUTO_UPDATE="true"

## Uncomment the following line to automatically update without prompting.

#DISABLE_UPDATE_PROMPT="true"

## Uncomment the following line to change how often to auto-update (in days).

#export UPDATE_ZSH_DAYS=13

## Uncomment the following line if pasting URLs and other text is messed up.

#DISABLE_MAGIC_FUNCTIONS=true

## Uncomment the following line to disable colors in ls.

#DISABLE_LS_COLORS="true"

## Uncomment the following line to disable auto-setting terminal title.

#DISABLE_AUTO_TITLE="true"

## Uncomment the following line to enable command auto-correction.

#ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.

#COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.

#DISABLE_UNTRACKED_FILES_DIRTY="true"

## Uncomment the following line if you want to change the command execution time
## stamp shown in the history command output.
## You can set one of the optional three formats:
## "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## or set a custom format using the strftime function format specifications,
## see 'man strftime' for details.

#HIST_STAMPS="mm/dd/yyyy"

## Would you like to use another custom folder than $ZSH/custom?

#ZSH_CUSTOM=/path/to/new-custom-folder

## Which plugins would you like to load?
## Standard plugins can be found in ~/.oh-my-zsh/plugins/*
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    )

#### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: Oh-My-Zsh SETUP
## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.zshrc - BEGIN:  Prepairing to Source: Oh-My-Zsh!"
fi
#### ~~~~~~~~~~~~~~~~~~~~

source $ZSH/oh-my-zsh.sh

#### ~~~~~~~~~~~~~~~~~~~~
## END: Oh-My-Zsh SETUP
## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.zshrc - END:    Oh-My-Zsh SETUP"
fi
#### ~~~~~~~~~~~~~~~~~~~~

#### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: Interactive OS Specific Section
## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.zshrc - BEGIN:  OS Specific Section"
fi
#### ~~~~~~~~~~~~~~~~~~~~

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Linux Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshrc - BEGIN:   LINUX CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    ####
    ## On Linux The following are specialized and optional if needed:
    ## If you need to use these swapped keys (Maybe you use Emacs Xaw-Fly-Keys?)
    ## enable the xmodmap and xinput lines below...  (they will help for that)

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
    ## Qubes Split SSH:
    ## NOTE: This section is only used for Qubes OS machines that use Qubes App
    ##       Split SSH schemes...  If you do that, un-comment the lines in this
    ##       secton...

    ## Set next line to the ssh key vault you want to use

#    SSH_VAULT_VM="ssh_vault"

#    if [ "$SSH_VAULT_VM" != "" ]; then
#        export SSH_AUTH_SOCK=~user/.SSH_AGENT_$SSH_VAULT_VM
#    fi

    ####
    ## Qubes Split GPG tweaks... If you don't use Qubes or Split GPG
    ## you can ignore these... or comment them out.  I did not comment
    ## them out because they won't hurt anything if you are not using them...

    alias gpg="/usr/bin/gpg2"
    alias gpq="qubes-gpg-client"
    alias gpw="qubes-gpg-client-wrapper"

    ####
    ### ls command on Linux is different than on Mac OS for some reason!
    ## Both platforms use GNU coreutils now so this may still be different
    ## because of iTerm2 vs Gnome Terminal, or maybe other configs outside of my
    ## zsh that are different on Linux than on Mac OS.. I have not figured out
    ## where the difference is but the platform adjusted ls alias defs below are
    ## working fine for now... If you don't like these settings change them...

    alias l="ls -lhFB --ignore='.#*' --ignore='#*' --group-directories-first"
    alias ll="ls -alhFB --ignore='.#*' --ignore='#*' --group-directories-first"
    alias lll="ls -alhF --group-directories-first"
    alias la="ls -A --group-directories-first"

    ####
    ## Mimic Mac OS pbcopy functions:
    ##  NOTE: You Must install the xclip Package from your Linux distro
    ##        to get this feature to work...

    alias pbcopy='xclip -sel clip'
    alias pbpaste='xclip -o -sel clip'

    #### ~~~~~~~~~~~~~~~~~~~~
    ## END: Linux Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshrc - END:    LINUX CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

elif [[ "$OSTYPE" == "darwin"* ]]; then

    #### ~~~~~~~~~~~~~~~~~~~~
    ## BEGIN: Mac OS Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshrc - BEGIN:  MAC OS CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

    ###
    ## Use the latest Emacs 27 built from source on [Rodrigo] OMG! The emacs that
    ## ships standard with MacOS is wicked old!!! Wat??? Note you have to do this
    ## trick to Both upper case "Emacs" and lower case "emacs" to catch all cases
    ## of programs trying to invoke it... If you do not build your own Emacs
    ## ignore the two lines below... Othewise enable the and adjust the path...

#    alias emacs="/Path/To-your/built-from-source/Emacs-27.app"
#    alias Emacs="/Path/To-your/built-from-source/Emacs-27.app"

    ##
    ## For some reason ls command on Mac OS is different than on Linux.
    ## Both platforms use GNU coreutils now so this may still be different
    ## because of iTerm2 vs Gnome Terminal, or maybe other configs outside of my
    ## zsh that are different on Linux than on Mac OS.. I have not figured out
    ## where the difference is but the platform adjusted ls alias defs below are
    ## working fine for now...

    alias l="ls -lhFB --color --ignore='.#*' --ignore='#*' --group-directories-first"
    alias ll="ls -alhFB --color --ignore='.#*' --ignore='#*' --group-directories-first"
    alias lll="ls -alhF --color --group-directories-first"
    alias la="ls -A --color --group-directories-first"

    #### ~~~~~~~~~~~~~~~~~~~~
    ## END: Mac OS Specific Configs...
    ## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
    if [ "$SH_DBG" = true ] ; then
        echo "\$DOTFILES/.zshrc - END:    MAC OS CASE"
    fi
    #### ~~~~~~~~~~~~~~~~~~~~

fi


#### ~~~~~~~~~~~~~~~~~~~~
## BEGIN: Generic Interactive Platform Independent Section
## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.zshrc - BEGIN:  Generic Section"
fi
#### ~~~~~~~~~~~~~~~~~~~~

###
## Misc custom aliases:

alias cl="clear"

export EDITOR='emacs'

## colored GCC warnings and errors

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

## Use Python 3 & PIP 3 (this may also be needed by shell scripts)

alias python="python3"

#### ~~~~~~~~~~~~~~~~~~~~
## END: Generic Interactive Platform Independent Section
## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
if [ "$SH_DBG" = true ] ; then
    echo "\$DOTFILES/.zshrc - END:    Generic Section"
fi
#### ~~~~~~~~~~~~~~~~~~~~

#### ~~~~~~~~~~~~~~~~~~~~
## END: .zshrc Evaluation - Leaving file...
## DEBUG Print Statements: (Export SH_DBG in your shell session to enable)
if [ "$SH_DBG" = true ] ; then
    echo "ZSH INTERACTIVE - END:    \$DOTFILES/.zshrc - Leaving File"
fi

#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## END: $HOME/.zshrc
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
