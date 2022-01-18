#!/bin/bash
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File:          $DOTFILES/.bin/generate_gitconfig.sh
## Created:       2021-012-25
## Modified:      2022-001-18
## Author:        Alisha Awen - Siren1disroot.org
## Copyright:     (© 2019 - 2022 by Alisha Awen, Siren1@disroot.org, all rights reserved)
## Git Username:  harmonicalchemy
## Repo:          https://github.com/harmonicalchemy/dotfiles.git
## Licence:       GNU General Public License v3.0
## Environment:   Linux, BSD, (Qubes 4.0 nx App VMs) and Mac OS
##                (i.e., anywhere you need to have a .gitconfig)

## Purpose:
##   Genearate .gitconfig in your $HOME directory via this bash script using
##   defined environment variables... This is needed because .gitconfig cannot
##   read Environment Vars directly... The output of this script will translate
##   the $ENV_VARS to their actual values when it generates a new ~/.gitconfig
##   for the target platform...

##   Platform specific conditionals are not needed in this script because the
##   Environment Variables are already set to match the specific platform OS
##   within .zshenv and .bash_common (depending on the platform you are running
##   on when they are loaded)...

##   .bash_common and .zshenv files do the work of figuring out and setting
##   the $ENV_VARS needed by this script.... So this script is super simple!
##   Too bad GIT cannot do that alone, otherwise this would not be needed...
##   Too bad since this script must run every time you invoke a shell!
##   The script automatically replaces existing ~/.gitconfig files without
##   asking or printing output!  This is so it will work with non-interactive
##   sessions too... This script invokes another script (which may well be
##   non-interactive!  I need to test this well to make sure strange things
##   DON'T happen...  To be continued... ;-)

## NOTE1:
##   All Environment Vars below were created within .bash_common or .zshenv...
##   This script must be run (AFTER) they do, otherwise you will get an error!

## NOTE2:
##   If you need to change your gitconfig for some reason change it below within
##   this file... Don't edit .gitconfig alone anymore... (it will be replaced!)

###
## Change Log: (descending chronological order)

## 2021-012-26 - Alisha Awen - Siren1@disroot.org
##     Created this new file... all ~/.gitconfig files will now be created
##     programmatically by this script... The configs below are based on the
##     latest commit of $DOTFILES/GIT/dot.gitconfig as of the creation date of
##     this script.  Edit this from now on... $DOTFILES/GIT/dot.gitconfig may
##     be going away soon!
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cat <<EOF > $HOME/.gitconfig
# -*- mode: gitconfig; -*-
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## File: ~/.gitconfig - (AUTO GENERATED FILE)
##
## This .gitconfig was generated via DOTFILES/.bin/generate_gitconfig.sh
## Edit that file, not this auto generated one... 
## (~/.gitconfig will be replaced the next time this script is run!!!
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### ~~~~~~~~~~~~~~~~~~~~~~ Identity ~~~~~~~~~~~~~~~~~~~~~~
##  Use the fingerprint of your PGP signing subkey [S]

[user]
	name = Your Name
	email = your@email-address.com
	signingkey = 0xFFFFAAAA55550000FFFFAAAA55550000FFFFAAAA!

### ~~~~~~~~~~~~~~~~~~~~~~ Appearance ~~~~~~~~~~~~~~~~~~~~~~

[color]
	ui = auto
;        interactive = auto
;        diff = auto

[color "branch"]
	current = cyan
	local = green
	remote = yellow
	
[color "status"]
	header = normal
	added = green
	changed = yellow
	untracked = red bold
	nobranch = red reverse

[color "diff"]
	meta = yellow bold
	frag = magenta bold
	old = red bold
	new = green bold
	whitespace = red reverse
	
## Cleanup unnecessary files and optimize local repo:

[gc]
	auto=1

### ~~~~~~~~~~~~~~~~~~~~~ Core Vars ~~~~~~~~~~~~~~~~~~~~~

[core]
	editor = $EMACS
	excludesfile = ~/.gitignore_global
	whitespace = fix,-indent-with-non-tab,trailing-space,cr-at-eol

### ~~~~~~~~~~~~~~~~~~~~ Email and Web ~~~~~~~~~~~~~~~~~~

[sendemail]
	smtpencryption = tls
;        smtpserver = <mail-server.example.com>
;        smtpuser = <your-email@example.com>
;        smtppass = <password>
;        smtpserverport = <smtp-port>

[web]
	browser = firefox

### ~~~~~~~~~~~~~~~~~~~~ External Apps ~~~~~~~~~~~~~~~~~~

###
## Configure Git with Emacs eDiff:
##
## Update 2020: I got tired of configuring Kdiff3 for git and instead now I
## have GIT configured to use Emacs eDiff mode for diffing and merging,
## everything...  I will only use Kdiff3 now as a stand alone gui tool
## when I am not using emacs...  There are some use cases for that...
## "Kdiff3 Is the best multiplatform open-source GUI based alternative
## my opinion.. So it stays in the tool chest... %^)

## This configuration requires you to have a wrapper scropt: ediff.sh
## in your local ~/.bin dir. This script is already a member of this DOTFILES
## repository.  Every thing is configured to "just work" so you dont have to 
## do anything... However if you would like to learn more about this script,
## check out:
##	https://github.com/paulotome/emacstool.git
## Read the README.md to see what has already been done for you within 
## Harmonic Alchemy DOTFILES.

[diff]
        tool = ediff
        guitool = ediff

[difftool "ediff"]
        cmd = $DF/.bin/ediff.sh $LOCAL $REMOTE $MERGED

[merge]
        tool = ediff

[mergetool "ediff"]
        cmd = $DF/.bin/ediff.sh $LOCAL $REMOTE $MERGED $BASE
        trustExitCode = true

## Configure GPG for Git:

[gpg]
	program = $GPG_PROG

[commit]
	gpgsign = true
EOF

#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##   END: generate_gitconfig.sh
#### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
