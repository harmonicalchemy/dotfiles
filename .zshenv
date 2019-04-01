# -*- mode: sh -*-
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  $HOME/.zshenv - Global Multiplatform ZSH Configs for: Non Interactive Shells...
#
#  Author:   Alisha Awen Sheppard - siren1@disroot.org
#  Created:  2019-001-24
#
#  $HOME/.zshenv is always sourced by ZSH upon startup, (all modes)... 
#  This file  is also sourced first before any of the other config files...
#  Therefore this file is an excellent place to define common configs needed for
#  all situations. (interactive, non-interactive, login, etc.) $PATH definitions
#  (used by all modes) will be set exclusively within this file only...
#  No need to duplicate things unnecessarily, which could also cause unexpected
#  side effects!  Everything else defined here is intended for: NON INTERACTIVE
#  use exclusively. Anything that sends output to the screen, or
#  expects a human response, should not be defined within this file...
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
#      First environment variables and now Zsh is not loading correctly...
#      I believe I have a lame Mac OS solution running now. (with band-aid)
#      So far on Mac OS it is working as long as you start Emacs from the shell.
#      Qubes (Fedora 29, Debian 9) etc. work nicely now...
#
#    2019-002-08 - Alisha Awen siren1@disroot.org
#      Reorganized this file to make it multiplatform like its companion .zshrc...
#
#    2019-001-24 - Alisha Awen siren1@disroot.org
#      Copied most (except one or two) exports from .zshrc to this new file...
#      Also copied some things from old legacy .profile into here as well...
#      Removed .profile from my Mac OS $HOME.  Not needed anymore according to
#      BASH official docs...  I am still trying to get Emacs environment in sync
#      with Zsh, Bash, etc...
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Set architecture flags to X86 64bit (all platforms):
export ARCHFLAGS="-arch x86_64"

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  BEGIN: OS Specific Definitions Section
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

##                 **** Info about Managing Path Definitions ****
#
#  NOTE1: Update the single line Path definitions below, from other lines that
#         are sometimes programmatically added to the bottom of other shell init
#         files after installing things!  Don't let them get all tangled up in
#         different places! Keep them all here in one place!
#
#  NOTE2: Make sure all /bin directory paths under `/user/local` occur BEFORE
#         `/usr/bin` directory paths within the export directive below.  This
#         is mostly for the sake of Homebrew on Mac OS...
#
#  NOTE3: You may need to make adjustments to the default path exports below
#         depending on your flavor of unix, and whether you have some of the
#         packages/plugins/binaries/libraries installed in a different place.
#         But for most cases, the exports already defined below are the default
#         paths on Linux and Mac OS.  The .rbenv paths assume you installed
#         .rbenv and used it to install ruby. (change it if you don't want it)
##

if [[ "$OSTYPE" == "linux-gnu" ]]; then

    #####
    # BEGIN: Linux Specific Definitions...
    #####

    ##
    # Export Linux specific $PATH:
    #   NOTE1:  Update the single line Path definitions below, from other lines
    #           that are sometimes programmatically added to the bottom of other
    #           shell init files after installing things!  Don't let them get all
    #           tangled up in different places! Keep them all here in one place!
    #
    #   NOTE2:  Make sure all /bin directory paths under `/user/local` occur BEFORE
    #           `/usr/bin` directory paths within the export directive below.
    #
    #   NOTE3:  You may need to make adjustments to the default path exports below
    #           depending on your flavor of unix, and whether you have some of the
    #           packages/plugins/binaries/libraries installed in a different place.
    #           But for most cases, the exports already defined below are the default
    #           paths on Linux and Mac OS.  The .rbenv paths assume you installed
    #           .rbenv and used it to install ruby. (change it if you don't want it)
    ##

    # Export Linux executable $PATH:
    export PATH="$HOME/.bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:$PATH"
    
    ##
    # Top Level Machine Specific Exports:

    # Define Main GIT Home directory: (for all or most of your cloned git projects)
    export GIT=$HOME/000-GIT

    # Define Main WWW directory: (for all or most of your web site and web app projects)
    export WWW=$HOME/WWW
    
    ##
    # Qubes Split SSH:
    # NOTE: This section is only used for Qubes OS machines that use Qubes App
    #       Split SSH schemes...  If you do that, un-comment the lines in this
    #       secton...
    #
    # Set next line to the ssh key vault you use:
    #SSH_VAULT_VM="ssh-vault"
    #
    #if [ "$SSH_VAULT_VM" != "" ]; then
    #  export SSH_AUTH_SOCK=~user/.SSH_AGENT_$SSH_VAULT_VM
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
    #export SFING="0x00005555AAAAFFFF00005555AAAAFFFF00005555"
    
    ##
    # Export Linux Manual $PATH:
    # TODO: Add this in later...
    
    #####
    # END: Linux Specific Definitions...
    #####
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    
    #####
    # BEGIN: Mac OS Specific Definitions...
    #####

    ##
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
    ##

    # Export Mac OS specific $PATH: (This may be different for older versions of Mac OS)
    export PATH="$HOME/.bin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/local/opt/php@7.2/bin:/usr/local/opt/php@7.2/sbin:$PATH"
    
    ##
    # Top Level Machine Specific Exports:
    
    # Define Main GIT Home directory: (for all or most of your cloned git projects)
    export GIT=$HOME/Documents/000-Alisha/000-GIT

    # Define Main WWW directory: (for all or most of your web site and web app projects)
    export WWW=$HOME/Documents/DATA/WWW

    ##
    # Define Path to Jack2 Repo:
    export JACK='/Users/alisha/Documents/001-Harmonic-Alchemy-Productions/Resources/003-Music-Apps/Audio-Loop-Back-Apps/Jack-2/github.src.repo'

    ##
    # Set Homebrew Cask app directory to user's: $HOME/Applications (not system apps)
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
    
    ##
    # Setup Mac OS Environment Paths: (both MANPATH and PATH)    

    # Export GNU Info Path: (This may be different for older versions of Mac OS)
    export INFOPATH="/usr/share/info:/usr/share/man:/usr/local/opt/gpg/share/info:/usr/local/opt/gpg/share/man:/usr/local/opt/coreutils/libexec/gnuman"

    # Export Manual Path: (This may be different for older versions of Mac OS)
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman"

    # Set Homebrew Cask app dir to ~/Applications (not system)
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

    ##
    # Ensure GnuPG gets the output of the 'tty' command.
    GPG_TTY=$(tty)
    export GPG_TTY

    ##
    # Ensure 'gpg-agent' (not ssh-agent) is running when a SSH client needs it.
    # NOTE: This assumes you are using a PGP "Auth" [A] subkey instead of the
    #       standard SSH key with ssh-agent as your local cached SSH key when
    #       connecting to SSH HOSTS.  If you connect with SSH the standard way
    #       instead, comment out the next two lines...
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    
    #####
    # END: Mac OS Specific Configs...
    #####
    
#else

    ##### 
    # Unknown OS? Huh? LOL! No harm done as the rest will stick... ;-)
    # TODO: Put Windows Cygwin stuff in here...
    ##### 
    
fi

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# END: OS Specific Definitions Section
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  BEGIN Global Definitions: (All Platforms)
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Use Python & PIP 3 (this may also be needed by shell scripts)
alias pip="pip3"
alias python="python3"

##
# Platform Independent Global Directory Definitions:
# NOTE: These are suggested defaults... Adjust these as needed for your own
#       environment setup...
##

# Define Global Path to Tools Presets (for tools like .dotfiles) home directory:
export TOOLS=$GIT/Gen-Dat/tools-presets

# Define Global Path to public .dotfiles (Github:HarmonicAlchemy)
export DF=$TOOLS/dotfiles

# Define Global Path to your "Personal Docs" home Directory:
export PD=$GIT/Gen-Dat/personal-docs

# Define Global Path to your "Personal Templates" home Directory:
export PT=$GIT/Doc-Templates/Personal-templates

# Define MWM WWW home directory:
export MWM=$WWW/MWM

# Define MWM-Clients WWW home directory:
export MWMC=$WWW/MWM-Clients

# Define MWM devOps home directory:
export MWMD=$WWW/00.devOps

# Define Sustainable Orcas Island (SOI) home directory:
export SOI=$MWM/SustainableOrcasIsland.org

# Define Global Path to HAP WWW home directory:
export HAP=$WWW/HAP

# Define Global Path to Open Media Arts Network (OMAN) WWW home directory:
export OMAN=$HAP/OpenMediaArtsNetwork.org

# Define Global Path to Grav Base Parent Directory: (contains all required Grav repos)
export GB=$MWMD/00.Grav/grav-base

# Define Global Path to my fork of: getgrav/grav on Github:harmonicalchemy
export GRAV=$GB/grav

# Define Global Path to Grav/Gantry 5 website Skeleton (YAGGS) home Directory:
export YAGGS=$MWMD/00.Grav/YAGGS

# Define Global Path to Roots WP R&D Project home Directory: (Trellis, Bedrock, Sage)
export RWP=$MWMD/01.Roots-WP-Projects

# Define Global Path to Private .pDotfiles (Bitbucket)
export PDF=$TOOLS/pDotfiles

# Define Global Path to HAP-Research home Directory:
export HAPR=$GIT/Scriv-Exports/HAP-Research

# Define Global Path to MCM-Research home Directory:
export MCMR=$GIT/Scriv-Exports/MCM-Research

# Define Global Path to MWM-Research home Directory:
export MWMR=$GIT/Scriv-Exports/MWM-Research

# Define Global Path to Personal-Docs home Directory:
export PDOC=$GIT/Scriv-Exports/Personal-Docs

# Define Global Path to HAP-templates home Directory:
export HAPT=$GIT/Doc-Templates/HAP-templates

# Define Global Path to MCM-templates home Directory:
export MCMT=$GIT/Doc-Templates/MCM-templates

# Define Global Path to MWM-templates home Directory:
export MWMT=$GIT/Doc-Templates/MWM-templates

# Create New Grav Website Project Skeleton:
# Usage:  $ makegrav $WWW/your-website-.com/public/
#    This command alias only works when you are within:
#    $GRAV.  (i.e., grav-base/grav/.)
#    Provide the required path to your website's project
#    directory with /public/ added to the end ('public' should
#    be the directory name that your web server config uses for
#    an Apache style "web-root" folder.  My VPS use "public"
#    You could also for example: Generate side projects locally
#    within one web project folder and call them: public1,
#    public2, public3, (for testing etc.)
# Results:
#    The /public/ directory will be created within your web
#    site's project folder and it will hold all the files
#    needed to start up a bsre bones Grav website running
#    the default Grav theme... (all ready for your next steps)
alias makegrav='$GRAV/bin/grav new-project -s'

# Start Grav Website server on "localhost" using System Router
# mini php web server:  (this saves you from having to config your
# local develop machine with Apache/Ngnix etc.)
alias rung='php -S localhost:8000 system/router.php'

##
# Load NVM: (Node.js, NPM) etc...
# NOTE: This assumes you cloned or installed 'creationix/nvm' from Github locally
#       in your $HOME environment.  The next lines set up that environment for you...
#       If you are not using NVM than comment out this section!!  You will
#       eventually need this for some nice web-apps and tools though!
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##
# Load rbenv Ruby Version Management Tool:
# NOTE: Make sure you have cloned rbenv from Github to $HOME/.rbenv!
#       If you decide not to use rbenv comment out this section and remove
#       the .rbenv paths from above path export line as well...
if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END: ~/.zshenv
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
