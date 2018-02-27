##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  ~/.zshrc - Local Z Shell Configuration
#  Note: This was originally created for MacOS but it could be easily adapted
#  to work in other 'nx' environments...  (see MacOS section below)
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen-use oh-my-zsh

# Set bullet-train prompt Theme - <siren1>[added 2016-002-23]<siren1/>
antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Other prompt themes you might want to explore:
#antigen theme arrow
#antigen theme bira
#antigen theme bureau
#antigen theme miloshadzic

# Install antigen Plugins - <siren1>(added 2016-002-23)<siren1/>
# General Plugins for all 'nx' flavors:
antigen bundle bower
antigen bundle command-not-found
antigen bundle Composer
antigen bundle git
antigen bundle git-extras
antigen bundle history
antigen bundle python
antigen bundle rails
#antigen bundle tmux
antigen bundle vagrant
antigen bundle web-search
antigen bundle zsh-users/zsh-syntax-highlighting

# Compleations:
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-history-substring-search

# <siren1 date="2014-006-09">Added this after reading:
#      http://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
#      I am not sure if this should be set here for OSX Sierra
# </>
# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Use emacs
export EDITOR='emacs'

# Export your INFO/MAN path: (modify as needed for your environment)
export INFOPATH="/usr/share/info:/usr/share/man:/usr/local/opt/gnupg@2.1/share/info:/usr/local/opt/gnupg@2.1/share/man/man1:/usr/local/opt/gnupg@2.1/share/man/man7:/usr/local/opt/gnupg@2.1/share/man/man8"

# Define Main WWW Development directory
export WWW='<~/path/to/dev/www/>'

# Define other Project directories here if needed:
export myproject='<~/path/to/project/dir/>'

# Use 256 colors
export TERM="xterm-256color"


#####
# Custom Aliases:
alias l="ls -al"
alias ll="ls -l"
alias la="ls -A"
#####


#####
# Mosh stuff - (you should install mosh on both your server
# and local machines.  Use it instead of ssh directly.
# This will save you a lot of headaches!  Trust me!

# Mosh (ssh) to your VPS (as serverpilot user)
alias vps1='mosh serverpilot@VPS1.example.com'

# Mosh (ssh) to your VPS (as system sudo user)
alias vps1='mosh admin@VPS1.example.com'
#####


#####
# MacOS pbcopy aliases... (with unix variants)

# alias MacOS's pbcopy/pbpaste commands for linux:
# (requires xclip package install)
alias pbcopy='xclip -sel clip'
alias pbpaste='xclip -o -sel clip'

# alias to copy working directory to clipboard
# (MacOS only unless you also use the above unix versions)
alias pwdc="pwd | pbcopy"
#####


# alias for $clear
alias cl="clear"

# Use Python & PIP 3
alias pip="pip3"
alias python="python3"

# <siren1>[2015-012-20]
# Install ZSH Help - (from last homebrew ZSH Upgrade Caveats)
# <siren1/>
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help


####################
# BEGIN MacOS only section:
# (possibly change some of this to make it work in other 'nx' env)

# Install MacOS ONLY antigen Plugins - <siren1>(added 2016-002-23)<siren1/>
# (You really don't need this unless you also have a Mac... ;-)
if [ "$OSTYPE"="darwin11.0" ]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
fi

# Set Homebrew Cask app dir to ~/Applications (not system)
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Set Mono to use the assemblies from other Homebrew formulae
export MONO_GAC_PREFIX="/usr/local"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Ensure GnuPG gets the output of the 'tty' command.
GPG_TTY=$(tty)
export GPG_TTY

# MacOS only: Ensure gpg-agent is running when a SSH client needs it.
gpg-connect-agent /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# END MacOS only section:
####################

####################
# BEGIN Final Section:
# Keep this section LAST!
# (i.e., Ddon't add things in here unless they must be put last)

# Load ALL above plugins/themes... 
antigen-apply

# NOTE: Keep the PATH sections below always last in this file...
# Make sure all bin directories under user/local occur before usr/bin:
export PATH="/usr/local/bin:/usr/local/opt/gnupg@2.1/bin:/usr/local/opt/libressl/bin:/usr/local/opt/openssl/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/opt/local/bin:$PATH"

# Use latest PHP 7.1 on command line:
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# Sourcing of RVM to PATH must occur last in path:
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# END Final Section:
####################

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END ~/.zshrc
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
