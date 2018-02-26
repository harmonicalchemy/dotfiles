## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File: .profile
## Modified 2017-Apr-10: by Alisha Sheppard to include support for SSH.
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
#
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
