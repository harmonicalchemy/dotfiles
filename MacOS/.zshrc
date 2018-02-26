##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  ~/.zshrc - My local Z Shell Configurations...
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen-use oh-my-zsh

# Set bullet-train prompt Theme - <aas>[added 2016-002-23]<aas/>
antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Other prompt themes I have tried and may want to try again later:
#antigen theme arrow
#antigen theme bira
#antigen theme bureau
#antigen theme miloshadzic

# Install Plugins - <aas>(added 2016-002-23)<aas/>
#
# OS X Plugins:
if [ "$OSTYPE"="darwin11.0" ]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
fi
# General Plugins:
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

# Load all above plugins/themes...
antigen-apply

# <aas date="2014-006-09">Added this after reading:
#      http://hackercodex.com/guide/mac-osx-mavericks-10.9-configuration/
#      I am not sure if this should be set here for OSX Sierra
# </aas>
# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Use emacs
export EDITOR='emacs'
export INFOPATH="/usr/share/info:/usr/share/man:/usr/local/opt/gnupg@2.1/share/info:/usr/local/opt/gnupg@2.1/share/man/man1:/usr/local/opt/gnupg@2.1/share/man/man7:/usr/local/opt/gnupg@2.1/share/man/man8"

# Define Main MWM WWW directory
export WWW='~/DATA/WWW/'

# Define Main MWM Roots Project directory
export ROOTS='~/DATA/WWW/000-MWM-Roots-Projects/'

# Use 256 colors
export TERM="xterm-256color"

# Set Homebrew Cask app dir to ~/Applications (not system)
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Set Mono to use the assemblies from other Homebrew formulae
export MONO_GAC_PREFIX="/usr/local"

#
# Custom Aliases:
#

alias l="ls -al"
alias ll="ls -l"
alias la="ls -A"

# Mosh (ssh) to vps1.MWM.com (as serverpilot user)
alias vps1='mosh -ssh="ssh -p 6227" serverpilot@VPS1.MarketingWebMedia.com'

# Mosh (ssh) to vps1.MWM.com (as system sudo user)
alias svps1='mosh -ssh="ssh -p 6227" magos@VPS1.marketingwebmedia.com'

# Mosh (ssh) to vps2.MWM.com (as serverpilot user)
alias vps2='mosh -ssh="ssh -p 6227" serverpilot@VPS2.MarketingWebMedia.com'

# Mosh (ssh) to vps2.MWM.com (as system sudo user)
alias svps2='mosh -ssh="ssh -p 6227" magos@VPS2.marketingwebmedia.com'

# alias for copy working directory to clipboard
alias pwdc="pwd | pbcopy"

# alias for $clear
alias cl="clear"

# Use Python & PIP 3
alias pip="pip3"
alias python="python3"

# <aas>[2015-012-20]
# Install ZSH Help - (from last homebrew ZSH Upgrade Caveats)
# <aas/>
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

#######
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#
# Ensure GnuPG gets the output of the 'tty' command.
GPG_TTY=$(tty)
export GPG_TTY
#
# Ensure gpg-agent is running when a SSH client needs it.
gpg-connect-agent /bye
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#
#####


####
# NOTE: Keep the PATH sections below always last in this file...
####

# Make sure all bin directories under user/local occur before usr/bin:
export PATH="/usr/local/bin:/usr/local/opt/gnupg@2.1/bin:/usr/local/opt/libressl/bin:/usr/local/opt/openssl/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/git/bin:/opt/local/bin:$PATH"
# Use latest PHP 7.1 on command line:
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# Sourcing of RVM to PATH must occur last in path:
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  END ~/.zshrc
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
