# -*- mode: sh -*-
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  File:          $HOME/.zshrc
#                 Multiplatform ZSH Configuration for Interactive Shells...
#  Created:       2017-004-23
#  Author:        Alisha Awen Sheppard
#  Git Username:  harmonicalchemy
#  Ref:           https://www.zsh.org/
#  Repo:          Github.com:harmonicalchemy/dotfiles.git
#  Environment:   Linux, BSD, (Qubes 4.0 App VMs) and Mac OS
#                 (not for hosted VPS or bare metal servers)
#
#  $HOME/.zshrc is sourced by ZSH at the start of an interactive shell session.  It 
#  contains commands to set up aliases, functions, options, key bindings, etc.
#  for interactive use only.  Here is where the Antigen ZSH package manager,
#  fancy bullet train prompts, and any variables that are only used in the
#  interactive shell like colors etc.
#
#  This simple version of Harmonic Alchemy "Dotfiles" does not need to do
#  anything fancy like define $ZDOTDIR. Also there is no current need for a
#  .zlogin, .zlogout, or .zprofile.  _yet_  There are no current plans for these
#  extra config files until I reach a more automated dotfiles stage with auto configs
#  for remote VPS host environments folded in...  First lets get this all working
#  great manually...
#
#  Please do add/remove definitions depending on your particular machine
#  environment(s) but please try to keep the structure and sections below the
#  same as they are now... There is a reason for that!  Add your custom mods
#  within the sections that they belong in.  Please don't try to move sections
#  around etc.  You may break some things!  Be careful...  Sections are well
#  defined below with comment banners for us dumb humans to be able to read...
#
#  Change Log: (descending chronological order)
#
#    2019-003-16 - Alisha Awen Sheppard -  siren1@disroot.org
#      While I am troubleshooting Mac OS problems, I am now trying this on my 
#      older Macbook Pro to see how things go with Mac OS El Capitan, which is
#      no longer supported by Apple or Homebrew.  If I can get this working there
#      that will be a nice thing for folks who can only afford cheap old Macs
#      (i.e., The "real" rest of us, if a Mac is still that computer for the rest
#      of us that is)...  My first serious home box was a used refurbished
#      Mac IIx (that was a long time ago)...  It was still considered pretty
#      powerful when I got it. (it was my first Digital Audio Workstation (DAW)
#      for making music back around 1995) ;-)
#
#    2019-002-14 - Alisha Awen siren1@disroot.org
#      I have been troubleshooting Zsh problems on Mac OS for a while... 
#      First environment variables and now ZSH is not loading correctly...
#      However, I believe I have a working Mac OS solution running now 
#      (with band-aid).  Mac OS it will work fine as long as you start Emacs 
#      from the shell. Linux (Fedora 29, Debian 9). work nicely now...
#
#    2019-002-02 - Alisha Awen siren1@disroot.org
#      I am testing re-configuring this on Fedora now on a new branch
#      within my private dotfiles Repository.  I had to branch because
#      I started changes on the Mac as well.  I will sort all this out later.
#      For now I need to get Linux back in operation.  Then I will be able
#      to sync with remotes again and update Github!
#
#    2019-001-24 - Alisha Awen siren1@disroot.org
#      This file is being restructured to be multiplatform. Many things have
#      been moved to .zshenv...  Everything has changed now!  No going back!
#      During this process I discovered my previous Zsh/Antigen/Oh-My-Zsh setup 
#      was all messed up and out of date.  (probably the reason behind all my 
#      other problems! (time will tell soon enough)...  I updated Homebrew, zsh
#      (see below under Load Antigen Zsh Plugin Manager heading) Once all that
#      has been updated, upgraded, if this is working well on Mac OS, I will
#      then update my dotfiles repository (get all this working privately first)
#
#    2018-002-26 - Alisha Awen siren1@disroot.org
#      Made this file generic and added it to my Github .dotfiles repository...
#
#    2017-004-23 - Alisha Awen siren1@disroot.org
#      This file was created by first copying my existing .bashrc file from my
#      old MacBook Pro configuration and then modifying that for my newly
#      installed ZSH environment on my new iMac.
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Load Antigen Zsh Plugin Manager first:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# NOTE1: On Mac OS after installing zsh and zsh-completions (via Homebrew)
#        you need to go to your terminal and issue the following:
#                   $> chsh -s /usr/local/bin/zsh
#        It never hurts to do this over again once and a while.
#        ("Who knows what that little nervous looking man is doing
#        behind that curtain over there to the side of the Great
#        Apple of OZ?" ;-)
# NOTE2: I may be experiencing problems applying Antigen after some things
#        were set...  Now I am doing those things after Antigen apply...
#
# Source Antigen Plug-in Manager startup config: (antigen.zsh)
export ZSHA_BASE=$HOME/.antigen
source $ZSHA_BASE/antigen.zsh
#
# Tell Antigen to use oh-my-zsh:
antigen use oh-my-zsh


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  BEGIN Pre-Antigen Apply - OS Specific Configs:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    #####
    # BEGIN: Linux Specific Configs...
    #####
    
    ##
    # Linux Specific Zsh Antigen Configurations...
    #
    # Set bullet-train Prompt Theme - <siren1>[added 2016-002-23]<siren1/>
    antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    #
    # Other prompt themes you might want to explore:
    #POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
    #antigen theme bhilburn/powerlevel9k powerlevel9k
    #antigen theme arrow
    #antigen theme bira
    #antigen theme bureau
    #antigen theme miloshadzic
    
    #####
    # END: Linux Specific Configs...
    #####
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    
    #####
    # BEGIN: Mac OS Specific Configs...
    #####
    
    ##
    #  Activate Homebrew zsh-completions:
    fpath=(/usr/local/share/zsh-completions $fpath)
    # You may also have to force rebuild of `zcompdump`:
    # $> rm -f ~/.zcompdump; compinit
    
    ##
    # Mac OS Zsh Antigen Specific Configs...
    # Set bullet-train Prompt Theme - <siren1>[added 2016-002-23]<siren1/>
    antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    #
    # Other prompt themes you might want to explore:
    #POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
    #antigen theme bhilburn/powerlevel9k powerlevel9k
    #antigen theme arrow
    #antigen theme bira
    #antigen theme bureau
    #antigen theme miloshadzic
    #
    # You May want to try these iTerm frendly themes:    
    #    tylerreckart/odin
    #    wesbos/Cobalt2-iterm.git
    #
    #    if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    #        antigen theme wesbos/Cobalt2-iterm.git cobalt2.zsh-theme
    #    else
    #        antigen theme tylerreckart/odin odin.zsh-theme
    #    fi
    #
    #
    # Install Mac OS specific Antigen bundles...
    antigen bundle bower
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
    antigen bundle xcode    
        
    #####
    # END: Mac OS Specific Configs...
    #####
    
#else

    ##### 
    # Unknown OS? Huh? LOL! No harm done the rest will stick... ;-)
    # TODO: Put Windows CigWin stuff in here...
    ##### 
    
fi

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# END Pre-Antigen Apply - OS Specific Configs:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BEGIN Antigen Apply Global Config Section:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Finish Antegin plugins/themes Init: (all platforms) 
#
# Install antigen Plugins: - <siren1>(added 2016-002-23)<siren1/>
# General Plugins for all 'nx' flavors:
antigen bundle git
antigen bundle git-extras
antigen bundle git-flow
#antigen bundle heroku

antigen bundle ssh-agent
antigen bundle gpg-agent

antigen bundle colored-man-pages
antigen bundle emoji
antigen bundle mosh

antigen bundle gnu-utils
antigen bundle jsontools
antigen bundle vagrant
antigen bundle Composer
antigen bundle cargo

antigen bundle rust
antigen bundle golang
antigen bundle python
antigen bundle ruby
antigen bundle gem
antigen bundle rails

antigen bundle history
antigen bundle pip
antigen bundle command-not-found
antigen bundle autojump
antigen bundle npm
antigen bundle web-search
antigen bundle tmux

##
# Syntax Highlighting:
antigen bundle zsh-users/zsh-syntax-highlighting

##
# Compleations:
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

##
# Apply ALL above Antegin plugins/themes
# after OS Specific Section...
antigen apply
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# END: Antigen Apply Global Config Section
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  BEGIN Post Antigen Apply - OS Specific Configs:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    #####
    # BEGIN Linux Specific Configs...
    #####

    # Mimic Mac OS pbcopy functions:
    # NOTE: First install xclip Package from your Linux distro to get this
    #       feature...
    alias pbcopy='xclip -sel clip'
    alias pbpaste='xclip -o -sel clip'
        
    ## Custom Linux directory listings:
    #  I had to break this out of the global section.  Mac OS is different!
    ## On Mac you have to prefix ls with "g" (i.e. $ gls)
    alias l="ls -alhFB --color --ignore='#*' --group-directories-first"
    alias ll="ls -l"
    alias la="ls -A"

    ##
    # Qubes Split SSH:
    # NOTE: This section is only used for Qubes OS machines that use Qubes App
    #       Split SSH schemes...  If you do that, un-comment the lines in this
    #       secton...
    
    # Set next line to the ssh key vault you use:
    #SSH_VAULT_VM="vault-ssh"

    #if [ "$SSH_VAULT_VM" != "" ]; then
    #	export SSH_AUTH_SOCK=~user/.SSH_AGENT_$SSH_VAULT_VM
    #fi

    ##
    # Qubes Split GPG tweaks...
    # NOTE: This section is only used for Qubes OS machines that use Qubes
    #       Split GPG schemes...  If you do that, un-comment the lines below
    #       within this secton and add your public key fingerprint:
    #alias gpg="/usr/bin/gpg2"
    #alias qgpg="qubes-gpg-client"
    #export QUBES_GPG_DOMAIN="vault-pgp"
    #export QUBES_GPG_AUTOACCEPT=86400
    #export SFING="<Your-PGP-Primary-Key-Fingerprint>"
    
    #####
    # END Linux Specific Configs
    #####
    
elif [[ "$OSTYPE" == "darwin"* ]]; then

    #####
    # BEGIN Mac OS Specific Configs
    #####
    
    ## Custom Mac OS directory listings:
    #  I had to break this out of the global section.  Mac OS is different!
    # Mac OS Homebrew added back standard unix commands that were removed by Apple)
    # On Mac you have to prefix ls with "g" (i.e. $ gls)
    # Apple is getting more and more non-unix like! Which I don't like!
    # It is funny because I believe Microsoft is finally doing the opposite!
    alias l="gls -alhFB --color --ignore='#*' --group-directories-first"
    alias ll="gls -l"
    alias la="gls -A"

    #####
    # END Mac OS Specific Configs
    #####
    
#else

    ##### 
    # Unknown OS? Huh? LOL! No harm done the rest will stick... ;-)
    # TODO: Put Windows CigWin stuff in here...
    ##### 

fi

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END: Post Antigen Apply - OS Specific Configs
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  BEGIN Final Platform Independent Globals Section:
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Use Emacs:
export EDITOR='emacs'

alias cl="clear"

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END: Final Platform Independent Globals Section
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END $HOME/.zshrc
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
