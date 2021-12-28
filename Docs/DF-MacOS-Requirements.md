---
file: DF-MacOS-Requirements.md
author: Alisha Awen Sheppard
created: 2019-010-27
updated: 2020-009-11
tags: MWM-README, 2020, Mac-OS, SysAdmin, bash, sHell, zsh
---
<!-- #MWM-README #2020 #Mac-OS #SysAdmin #bash #sHell #zsh -->

![Banner](./media/Dotfiles-Github-Banner-v2.png)

**[\[Table of Contents\]](#table-of-contents)**

# `dotfiles`: Postmortem Mac OS Tasks after HomeBrew Removal:

This document is an actual saga... With personal joke inflections and all!  Have fun with it!  Here is the setting for the story...  A few events during the summer and fall of 2019 convinced me to go through the pain of switching my **Mac OS** optional package manager from **Homebrew** to **Macports** _(Whaaat? omg! Is this is starting to get Mark Twain funny yet? You just wait... there is more...)_ This document addresses my painful but humorous process...

## Introduction:

I have been contemplating this switch all during 2019, but now in October I finally bit the bullet and am now committed to doing it.  I am in the middile of that process ~~_(this is day four)_~~ **_Update:_** _(I finished the base install on day 4, made another Clone of my Mac OS system at that point and with a stable system had to resume previous tasks)_   I have a log entry for `Friday, 2019 October 25` in: **MWM-Daily-Planning-Log...** where this process started... I copied most of that here to continue as a real document within my `.dotfiles` repository... Now I am nit-picking the rest as I do other work...  _(i.e., the house is built, the owners have moved in, but I need to come in from time to time to finish the little things without disrupting their lifestyle. ;-)_

Homebrew is getting worse and worse! I just reciently found out that Homebrew is not secure in many ways!  One of them is shooting all kinds of holes in **`/usr/local`** giving mallware a chance to probe in and install executibles in a directory that could later get elevated to root owned!  Yikes! That is my main reason for switching now... No more contemplating, procrastinating this... Its critical!

### Current Status:

Ummm... I'm in the final finishing stage...  You know, the house is built, the owners moved in... BUT... Lots of little nit picky stuff... is still not done... Maybe it will never get done?  Babies get born you know... then we forget...  Until something breaks that was supposed to be finished and inspected years ago. LOL... Mostly I am writing and updating this How-to guide for personal and public future reference... btw, my babies were born over 25 years ago, lol _(while I was still finishing building my first home!)_... The above is a figure of speech... You may relate though...

**[\[Table of Contents\]](#table-of-contents)**

## First Things First:

### Get your Time Machine backups and Mac OS clones up to date:

- Make an updated clone of your **Mac OS** machine's system  
- Update `TARDIS` Time Machine backups as well.  Make two renduant backups  

OK that was completed on 5PM Friday Oct 25...

### Remove Homebrew:

Use the following Official Homebrew Script:

```ruby
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```

This should also revert your `/usr/local` folder to its pre-Homebrew days.  I used the default Terminal App from Apple instead of iTerm2 to do this... Because iTerm2 will be gone after the above command completes!  Thank god I built Emacs from source!

Actually, something broke Emacs after the above anyway... But the default emacs still worked so I used that... _(my custom key commands gone... oh-well ;-)_

> **Note:** There used to be an older HomeBrew removal script that looked like below...  Some folks in the forums are recommending the following **old outdated script** or variants of it.  Those posts are old!  **Don't use this:** Do the above instead...  I put this in here in case I read something like this again and scratch my head? "did I do this?"  "No.. You did not...  relax ;-)"

```brainfuck
        cd `brew --prefix`
        git checkout master
        git ls-files -z | pbcopy
        rm -rf Cellar
        bin/brew prune
        pbpaste | xargs -0 rm
        rm -r Library/Homebrew Library/Aliases Library/Formula Library/Contributions 
        test -d Library/LinkedKegs && rm -r Library/LinkedKegs
        rmdir -p bin Library share/man/man1 2> /dev/null
        rm -rf .git
        rm -rf ~/Library/Caches/Homebrew
        rm -rf ~/Library/Logs/Homebrew
        rm -rf /Library/Caches/Homebrew
```

**[\[Table of Contents\]](#table-of-contents)**

### Apps/Tools Downloaded & Installed Directly:

There are a few applications that have been installed on my iMac that were not installed by any package managers, _(Apple App Store, Homebrew, or MacPorts)_...  I am listing them here so I will know for future reference...

#### iTerm2:

First install **iTerm2** so you can get your terminal back _(I had to fall back on Mac OS default terminal app after removing Homebrew)_ I was using Homebrew to install iTerm2 but now after experiencing this mess, I have decided to install all GUI apps _(especially iTerm2)_ directly from the from the Appdev's websites...  No need to trouble yourself building everything in the universe if the developers are on top of it...  Don't clutter your MacPorts like I did with Homebrew!!!

Therefore I am NOT installing **iTerm2** via **MacPorts**...  Instead I have installed the latest stable iTerm.app  _(extracted from the downloaded .zip file)_ from: **[iTerm2 Developers Website](https://www.iterm2.com/downloads.html)**.

Once that is done, proceed with the MacPorts installs below from a new shiny iTerm2 window...

#### KeePassXC:

KeePassXC is another app I will be installing from the main AppDev website as a normal .dmg file installed as a normal Apple application, a straight forward easy install with auto updates etc... It is a stand alone app.  Does not require X11 or other things... It has to be able to run allways... I cannot loose it during a package manager change or something critical like that... I manage both SSH keys (ssh-agent) and PGP keys etc. with KeepassXC databases...

#### Zsh:

The Shell itself, `zsh` as well as `zsh-completions` must both be installed by **Macports** But that's it... For your particular **`zsh`** environment you need to install **`oh-my-zsh`** manually. _(which you already did long ago but update it now)_

If you need to install `oh-my-zsh` from scratch again use:
```md
    git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```
Follow the `README.md` file after that is done...

#### MacTeX:

Follow instructions, including the **_Please Read_** section on: **[Tug.org/mactex/](https://tug.org/mactex/)** to install what you need... There are two options, the BIG everything, and a more reasonable BasicTeX... I went ahead and installed the big one... _(plenty of disk space)_ and I aim to be a publishing wizard!
Once you have this, MacTeX has utilities for self update as well as TeXLive etc...  You don't need Apple, HomeBrew, or MacPorts for any of this... Got that?

To make **MadTex** _(lol "a typo" but decided to leave it cause it made me laugh!)_ binaries available on the command line, _(for Pandoc etc.)_ you have to set the following in your `$PATH` definition within your shells...

```script
    /Library/TeX/texbin
```
Put it after your `~/.bin` and `/opt` paths but before: `/usr/bin` and `/bin` etc...

#### Karabiner-Elements Mac OS Keymapping Utilities

I downloaded and installed this package directly from: https://pqrs.org/osx/karabiner _(a nice open-source project created by Takayyama Fumikiko pqrs.org)_

#### inkscape

Inkscape finally released Version 1.0 in May of 2020 and now I have a regular Mac OS App, no need for XQuartz etc.  Now Inkscape is definately _(the world's best vector graphics editor)_  Download and install it from: https://inkscape.org/release/inkscape-1.0/mac-os-x/1010-1015/dl/


#### Gimp:

Gimp may be the exception for now as I see the latest version available via Macports is ahead of ready to run packages from Gimp.org.  Therefore follow the instructions below in the MacPorts install section to find the command to install gimp `sudo port install gimp` LOL...

#### Blender v2.8+

This is the new released version 2.8 of Blender... I have been using it since it was still in Beta...  Best to install this directly from the source on any platform.  Not just Mac OS! Blender is all you need to create blockbuster quality 3D animations, or full length feature films with sound, lighting, efx, everything!  Or you can use it to design a house _(or boat)_ that you can walk through and inspect in VR! OMG! Fantastic Future... We are already here! And it is 100% Open Source! **_"Look Out Hollywood Here We Come!"_**

#### HLedger Accounting Software

I read some scary posts on MacPorts forums, and bug reports about HLedger causing problems with installed MacPorts libraries... I decided to clone the HLedger GitHub project and build the latest commit from the `master` branch.  Before doing this, I needed to install a complete **Haskell** development stack from: `haskellstack.org`...  That too was _NOT_ installed via MacPorts...  _(see below)_

#### Haskell Stack IDE

**`haskellstack.org`'s** recommended way for Mac OS (and all nx platforms for that matter) is to run the following script to install the full **Haskell** Dev Stack...

```yaml
    curl -sSL https://get.haskellstack.org/ | sh
```

> **Note:** This script will ask for root access using sudo in order to install dependencies and to install the binaries to `/usr/local/bin`.

#### Emacs

My **HomeBrew** installed **Emacs** was causing problems long before I switched to **MacPorts** and my remedy a year ago was to install **Emacs** from source, from my own private clone of the master **Gnu Emacs** git repository... I keep it up to date and now have the latest version of **GNU Emacs** for **Mac OS** configured any why I need it, with the libraries compiled in that I need to do things my way... `d%^)`

## Install Macports _(after removing HomeBrew)_

I am not including the instructions for installing MacPorts itself, as that is well documented already on **`guide.macport.org`**... [fyi RTFM](https://guide.macports.org/chunked/introduction.html) 

Instead, here are the common tasks you will need to use, daily, to maintain your installations: _(similar to all package managers, including HomeBrew)_

### Common MacPorts Tasks

#### Update Ports Tree:

```script
    sudo port selfupdate      # this is quick -or-
    sudo port -v selfupdate   # this gives detailed output
```

#### Which Ports Need Update?

```script
    port outdated
```

#### Upgrade Outdated Ports

- Upgrade all outdated:

```script
    sudo port upgrade outdated 
```

- Upgrade a specific port:

```script
    sudo port upgrade <port-name> 
```

#### List ports explicitly installed:

_(You will be using this one a lot!)_

```script
    port echo requested
```

#### List Everything Installed by MacPorts _(including all dependencies)_

```script
    port installed
```

#### Install a Port _(and/or clean up mess)_

- Normal Install Port:

```script
    sudo port install <portname>
```

- If a Port Install fails do this to clean up: _(sounds like make/configure command)_

```script
    sudo port clean <portname>
```

- Also delete any downloaded files that may be corrupted:

```script
    sudo port clean --dist <portname>
```

#### Uninstall a port _(does not remove dependencies)_

```script
    sudo port uninstall <portname>
```

#### Remove Inactive Versions

By default, upgrading ports in MacPorts does not remove the older versions. This is a safety measure. To save disk space, periodically uninstall old versions longer needed.

- List inactive ports:

```script
$> port installed inactive
    The following ports are currently installed:
    gnupg @1.4.16_0
    gnupg2 @2.0.22_2
    gpg-agent @2.0.22_1
    gpgme @1.5.0_0
    etc. . . .
```

- Check the list for any ports you might still want to keep...  
If you want to remove all of them at once in one run, do this:

```script
$> sudo port uninstall inactive
    Password:
    --->  Uninstalling p5.16-gnupg-interface @0.330.0_3
    --->  Cleaning p5.16-gnupg-interface
    --->  Uninstalling gnupg @1.4.16_0
    --->  Cleaning gnupg
    --->  Uninstalling gpgme @1.5.0_0
    --->  Cleaning gpgme
    etc. . . .
```

- Or simply select a specific inactive port...  
You must specify the exact version for this:

```script
$> sudo port uninstall HexFiend @2.1.2_1
    Password:
    --->  Uninstalling HexFiend @2.1.2_1
    --->  Cleaning HexFiend
```

#### MacPorts Glossary

[Here is a quick reference for things you may be wondering about](https://guide.macports.org/chunked/guide-terms.html#glossary)

**[\[Table of Contents\]](#table-of-contents)**

## Install Macports Packages:

### Packages that need to be installed in Macports first:

> **Note:** While you are installing things with MacPorts, here is a nifty way to check which ports have been installed and whether they are active or not...

```script
    port echo requested
```

> The above lists all ports installed by you, but not their dependencies... If you know the package name you can simply use:

```script
    port installed | grep <package-name>
```

> You can use a partial name or other keyword to match more packages etc...  If you use the above command without piping to grep you will get a HUGE list! But if you already know the name of the package and want to know if it is installed... The above command and pipe will do the trick and return a one liner :octocat:

#### Unix & SysAdmin Tools:


##### Zsh:

The Shell itself, `zsh` as well as `zsh-completions` must both be installed by **Macports**  These are critical for getting my `zsh` environmet back with out errors showing, incomplete startup, etc... Yuck... Get these back right away!  You need your zsh back to normal asap so you can get the rest of this fixed faster!

```script
    sudo port -v selfupdate
    sudo port install zsh
    sudo port install zsh-completions
```

##### Other things, may or may not be critical...

- **`coreutils`** - You need this to get back standard GNU unix utils that Apple removed! Why did they do that? _(This is important to get installed right away for `.dotfiles` to work correctly on Mac OS!)_

```script
    sudo port install coreutils
```

- **`findutils`** - GNU versions of `find`, `locate`, `updatedb`, and `xargs` These will replace the ones that Apple installed... From Apple's fudged BSD utils... _(Not so critical for now...)_

```script
    sudo port install findutils
```

- **`readline`** - The GNU Readline library provides a set of functions for use by applications that allow users to edit command lines as they are typed in. Both Emacs and vi editing modes are available. The Readline library includes additional functions to maintain a list of previously-entered command lines, to recall and perhaps reedit those lines, and perform csh-like history expansion on previous commands. _(Not so critical for now...)_

```script
    sudo port install readline
```

- **`grep`** - This installs GNU `ggrep` To make this work as `grep` you need to set your path with: `/opt/local/libexec/gnubin` first before system bin paths... _(I use this version of grep a lot and feel it needs to be install sooner than later ;^)_

```script
    sudo port install grep
```

**[\[Table of Contents\]](#table-of-contents)**


#### Security, OpenSSH, OpenSSL, GNUPG etc:

- **`gnupg`** - Make sure you are installing GnuPG 2:

```script
    sudo port install gnupg2
```

Make sure GnuPG is now at least version `2.2.x`!

~~~bash
$>   which gpg
     /opt/local/bin/gpg

$>   gpg --version
     gpg (GnuPG) 2.2.17
     libgcrypt 1.8.5
     Copyright (C) 2019 Free Software Foundation, Inc.
     License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
     This is free software: you are free to change and redistribute it.
     There is NO WARRANTY, to the extent permitted by law.
~~~

GnuPG is All set now 2019-010-29

- **`pinentry-mac`** - GnuPG and other things need this...   
This package was automatically installed when I installed `gnupg2` above.

- **`pinentry`** - GnuPG and other things need this...   
I decided not to install the plain pinentry... The above pinentry-mac is good...

- **`openssh`** - The next two commands will install openssh, and then load it as well as make sure it will be started up at reboot as well...

```script
    sudo port install openssh
    sudo port load openssh
```

- **`openssl`** - After installing **`openssl`** it will not show up in the normal `port echo requested` list. But you can use `port installed` with `grep` to check it...

```script
    sudo port install openssl
    # . . . finish with no errors.
    port installed | grep openssl
       openssl @1.1.1d_0 (active)
```

OpenSSL is all set for Q4 2019...


**[\[Table of Contents\]](#table-of-contents)**

#### Python & pip:

**_(Or shall we say "Managing Parallel Python Universes 101 - for newbie gods and pTimeLords?)"_** :octocat:

**"Installing Python and its extras can be a bit confusing if installing with Macports"** - Alisha Awen...

By default, Macports comes with many python ports, e.g., python24, python27, python34, python38, etc... Each of them is a separate version of python (2.4, 2.7, 3.4,…). This provides the users the ability to install and maintain multiple versions of python at the same time...  _"Umm... Whaat did you just say?"_ Yep! Get ready for a big convoluted **`:recursive-octomess:`**!!!  Maybe... `<-[`_Todo: insert svg of Kline Bottle with octopus texture here._ `%^]`

> **Note:** **_Important best practices to remember:_**  

> **`python`** and **`pip`**, MUST/SHALL be installed globally _(as matching version pairs)_ via MacPorts, ...AND... nothing else Python related will be installed via MacPorts! Got that? Everything else below is based on this primary rule... _(with justification for doing so)_

> **Select Your Desired Global Python as Default:** Use: `sudo port select --set` command to set your desired Python version for your global environment... Then stick with that if you can... All Python projects will be installed in virtual environments... Any project needing lesser (or greater) versions of Python are safe running in these virtual environments...  _**and**, as an added benefit Macports base install is shielded and does not complain_...

> **Use Virtual Environments to Install ALL packages:**  After setting up your Global Python Environment with MacPorts above, from then on, if you need to install a package, you will install it within a virtual environment, Not Globally!  Do this even if your project will run fine within the current global Python Environment without any modifications...  This allows both package managers (**`pip`** and **MacPorts** to co-exist without stepping on each others toes, and prevents unnecessary convoluted recursive tracking headaches! 

> **Also Note:** If you are using **Python 3.3** or newer as your MacPorts Base Install, the **`venv`** module is the preferred way to create and manage virtual environments. **`venv`** is included in the Python standard library and requires no additional installation. You do NOT need to install the optional third party **`virtualenv`** package unless you plan to use an older version of Python _(before v3.3)_ as your MacPorts global base environment...

> **Never use `PIP` to install things globally!  Only use `PIP` within Virtual Environments:** I only use `pip` within a virtual environment to install packages _(specific to that virtual environment only)_.  I do this even if the package would build fine as is within my MacPorts global Python environment... This will keep your MacPorts Python install manageable... MacPorts does not need to be re-inventing the wheel causing more complicated setups than needed!!! **`pip`** does a fine job managing Python packages if it is allowed to do this without interferring with MacPorts package management doing the same thing!!! This scheme keeps the two package managers isolated from each other, which prevents possible configuration side effects...

My latest MacPorts config _(after upgrading Mac OS to High Sierra in August of 2020)_ I installed only **Python 3** (`pythhon38` with matching `PIP`)  via **MacPorts**...

When you install python through Macports, it will also auto install the `python select port` tool. The `port select` tool is for viewing and switching among python global versions. 

The **`port select --set`** command is used to set your current environment. _(see below)_ You must `set` and `check` that before using `Python3` or `pip`, on your machine...

_(command examples below assume you are only using and sticking to a MacPorts Globally Installed Python V3.3+, therefore you will only use the `port select` command once and leave it there...)_

> **Q3-2020** My current setup has the latest **Python3: `python38`** and matching **PIP: `Py38-pip`** set as my default global MacPorts installed environment... `python` is aliased to: `python3` as well...

In the past, **`virtualenv`** was a third party tool used in previous Python 2 and early Python 3 versions to install individual virtual python environments for Apps that require different settings than the global environment... This third party tool is no longer needed after **Python33** Since I installed and set **python38** globally, the examples below will not be using `virtualenv` to set up virtual environments...

I am using the newer recommended built in **`venv`** module to create virtual Python environments... **`venv`** is included in the **Python 3.3+** standard library and requires no additional installation...

See examples for setting up Virtual Environments and installing Packages within them below the **Global `python` / `pip` section** under the: **Virtual Environment `python`** heading...

As noted above, in the Important Best Practices Note, when installing **`pip`** via **MacPorts**, its version should match a version of Python you have installed.  When you use `port select` to set your default Python version, also use `port select` to set `pip` to the same version...  Don't forget to do this in pairs! _(see examples below)_

The following examples are for setting your Global System Wide Python... To set python for individual projects, don't use MacPorts... Use `venv` to set up a virtual environment and then use `pip` to install within that isolated environment instead... _(command examples below global examples)_

##### Global `python`/ `pip` Examples:

```script
##
# List MacPorts Installed Versions of Python:

port select --list python

# Install Latest Python3 & matching PIP via MacPorts:
# This WILL be set as your global Python Environment 
# (as set up via MacPorts)...

port search python3
sudo port install python38
sudo port install py38-pip

# Set Global Python Environment:

sudo port select --set python python38
sudo port select --set pip pip38

which python   # see results of above command...
```

After doing the above, make sure your Macports bin dir is in your PATH and stands before the default Mac OS bin paths, but after you local `$HOME` and `/usr/local/` paths.

**[\[Table of Contents\]](#table-of-contents)**

##### Virtual Envronment `python` / `pip` Examples:  

After doing the minimal Global Python Install via MacPorts above, everything else will be done exclusively within a virtual environment.  Even packages that could be installed within your Global Python environment without issue, will get installed within their own Virtual Environment.  This is to keep MacPorts and PIP package managers from stepping on each other's toes _(as noted above)_

Make it a golden rule to only use `pip` to install things in virtual environments... **`pip`** is the Python-native tool for managing package installations but you shouldn't pip-install things into your global base Python installation!  That will end up in a confusing mess trying to sort out fixed version dependencies between multiple software repositories after you have been pip-installing everything into your base Python installation for only a short while!

Instead... Once your Global Python Environment is set up _(as above)_ run the following commands anytime you need to install a new Python package from now on...  Don't do this any other way...

- **Move to a Parent Directory Where you intend to keep all your Python Projects & Create a New Virtual Env project within it:**

```bash
    cd ~/path-to-my-python-projects    # Your Python Projects dir...
```
- **Now Create A new Python Virtual Environment (project)**

```yaml
    python3 -m venv <my-new-project>

    # where <my-new-project> will be the name of a new sub-directory 
    # within your Parent Python Projects directory.  This new sub
    # directory will contain a new virtual Python project ready to
    # to istall and build a new Python package. Most likely you will
    # name it after Python App or Tool you intend to build there.

    # Everything you need will be set up for you within this 
    # directory including its own ./bin directory...
```

**For example:** If you need to insall **Magic Wormhole** _(A Python Package)_ after setting up a virtual environment for it on **Mac OS** _(as above)_ simply run `pip install` from within this virtual environment to build magic-wormhole from source, thus completing the task...

> **Important Note:** It is strongly advised **NOT** to run pip as root by prefixing the command with sudo, or running it as the root user...

Run the following commands within your newly created Python Virtual Environment to install the `magic-wormhole` Python app...

```yaml
$>    cd ./magic-wormhole   # Virtual Env previously set up
$>    source ./bin/activate # Activate this virtual environment
(magic-wormhole) $> pip install magic-wormhole
```

After the above is done, _(while still within the Virtual Environment)_ run Magic Wormhole from within any directory _(e.g., where the files you need to transfer are located etc.)_ using this command:

```yaml
(magic-wormhole) $> wormhole
```
Use what ever options you need with the above command to get your job done... Then exit the Virtual Environment with this command:

```yaml
(magic-wormhole) $> deactivate
```

Any time you need to run the `wormhole` command you need to go to it's project directory and issue: `source ./bin/activate` as in the above example...  When you are done you may exit the Virtual Environment as needed with the `deactivate` command. _(example above as well)_...

> **Note:** _(More Instructions for managing virtual environments may be added later... I need a good use-case project to build first then this will get written as I push through sand bars and untangle snags...)_

**[\[Table of Contents\]](#table-of-contents)**

#### Spelling:

- **`aspell`** - Spelling package needed by Emacs, and pretty much everything else!  
- **`aspell-dict-en`** - English Dictionary for aspell
- **`aspell-dict-ca`** - Canadian English Dictionary for aspell

- **`hunspell`** - Spelling package neede by Emacs, and pretty much everything else!  
- **`hunspell-en_CA_large`** - Canadian Dictionary for hunspell  
- **`hunspell-en_GB_large`** - British Dictionary for hunspell  
- **`hunspell-en_US_large`** - ~~British~~ ~~Colonist's~~ USA Dictionary for hunspell
- **`hunspell-en_SP_large`** - Spanglish USA Dictionary for hunspell... _No... This does not exist yet... Maybe I should make one?  Sure! Why not?_

##### Install aspell and dictionaries via MacPorts:
```yaml
$>  sudo port install aspell
$>  sudo port install aspell-dict-ca
$>  sudo port install aspell-dict-en
```

##### Install Hunspell and dictionaries via MacPorts:

```yaml
$>  sudo port install hunspell
$>  sudo port install hunspell-en_CA_large
$>  sudo port install hunspell-en_GB_large
$>  sudo port install hunspell-en_US_large
```

Spelling all set for Q3-2020

### Now install everything else:

> **Note:** Some packages previously installed by HomeBrew are going to now be downloaded and installed another way, separately outside MacPorts because that seems to be the recommended way for those packages living in Mac OS land now...

> One such package is the entire LaTeX / TeX suite.  I am using MacTeX for that...  Downloading the stand alone MacTeX PKG, verifying it, and then using that to install my LaTeX environmemt outside MacPorts... TeX has its own package management... MacTeX is TeX package management for Macs ;-) No need for extra MacPorts confusion... :octocat:

#### Dev Tools:

- **`autoconf`** - You may not need this right away but soon when you try to build something. ;-) 
- **`automake`** - You may not need this right away but soon when you try to build something. ;-)

- **`cmake`** -  You may not need this right away but soon when you try to build something.  
- **`etc`**...

> I'm not going to list the rest like the ones above... _(you know... The developer libraries)_. 

In fact, I am not installing any of these now... I will get them when I need them, most likely as dependency for the first real apps I do need built now.  Impulse buying of tools is NOT a good idea... Only buy a tool when you need it for a specific job, and you don't already have one that would do the trick...  Even following that rule you will end up with a box full of the same tool, or worse, several different boxes not connected, containing clones of the same tool, also not connected in any organized fashion!  Better to start with a fresh empty library containing only universal basics... It will get mucked up over time anyway...  ;-)

OK, alright already... Install GCC with all the goodies/langs you use now... You Will need it next for a job... like very soon... so there... ;-P :octocat:

- **`kdiff3`** - I am no longer using this, but if I do it will be installed from the AppDev website, not MacPorts... I do all my diffing with eDiff and zTree diff etc. within Emacs...

**[\[Table of Contents\]](#table-of-contents)**


##### Lisp: _(because that is really where we would rather live from now on)_

- **`sbcl`** - Steel Bank Common Lisp...

- **`leiningen`** - leiningen is for Clojure Lisp...

#### Publishing Writing Tools:

- **`Ghostscript`** - Ghostscript has security issues now!  Do not install it!  There are other alternatives...

##### Pandoc: 

After deciding above not to install **HLedger** _(Haskell Stack dependent)_ via **MacPorts**, _(due to some issues I did not document)_ I will not be installing Pandoc via **MacPorts** either for the same reason... _(Pandoc was written in Haskell)_...

Now I am having issues installing Pandoc via Macports on Mac OS El Capitan as well _(testing if_ **Harmonic Alchemy Modular Emacs** _can run on older Mac machines)_... 

Therefore going forward, **Pandoc** will be installed via the command line...

> **Note:** _(Haskell Stack IDE must be installed first! see above)_

###### Clone Pandoc Repo:

```yaml
$>  git clone https://github.com/jgm/pandoc
```
###### Build Pandoc with Stack/Haskell:

```yaml
$>  cd pandoc
$>  stack setup
$>  stack install
```

> **Note:** Stack setup will automatically download the **ghc** compiler if you don’t have it. Stack install will install the pandoc executable into: **`~/.local/bin`**, which you should add to your **`PATH`**. This process will take a while, and will consume a considerable amount of disk space.  Also... If this is the first time you used Stack, a new full index will also be downloaded to be installed for the first time... That will take even more time! Later installs only update the index...

**[\[Table of Contents\]](#table-of-contents)**

#### Graphic Design Tools:

- **`gimp`** - MacPorts provides a simple and effective way to install the world's best photo and image editor on the planet! No not PhotoShop... Ugh!

```script
    sudo port -v selfupdate
    sudo port install gimp
```

As of summer 2020 Gimp is now a stand alone Mac App... The X environment is no longer needed...

- **`graphviz`** - Mostly needed for Emacs...

```script
    sudo port install graphviz
```

## Temporary Edit Workspace:

### Placeholders:

- **``** -

- **``** -

- **``** -

- **``** -

### OLD HomeBrew List: _(some of these may be useful)_

The following packages were installed by Homebrew and need their equivilents to be installed by MacPorts...  Many of these will not be re-installed as I don't think I use them anymore... I have to do some research on that... Then the list will be reduced to only what I install via MacPorts...

```

rlwrap
rtmpdump
ruby-build

shared-mime-info
spdylay
sphinx-doc
sqlite
swig
texinfo
tidy-html5
tmux

lynis       			tree
lzo         			unbound
mailutils       		unixodbc
mcrypt      			webp
x265
mhash        			xz
mosh        			ykpers

    gsasl        			mpfr        			zlib
    gts          			multimarkdown   		zsh
    harfbuzz        		nasm        			zsh-completions
    httpd       			ncurses      			zsh-syntax-highlighting
    hunspell        		netpbm
```

### HomeBrew Cask List:

GUI Apps installed by HomeBrew Cask...

```
supercollider
virtualbox
libreoffice                    virtualbox-extension-pack
mactex                         vlc
java                           nvalt                          xquartz
java11                         osxfuse
karabiner-elements             qbittorrent
```

All of the above will be lost after un-installing Homebrew!  Some of these will be re-installed via MacPorts... Some of them will be installed stand alone from the Developers website... Some of them will not be installed because I don't need them anymore...

## Table of Contents:

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

- [`dotfiles`: Postmortem Mac OS Tasks after HomeBrew Removal:](#dotfiles-postmortem-mac-os-tasks-after-homebrew-removal)
    - [Introduction:](#introduction)
        - [Current Status:](#current-status)
    - [First Things First:](#first-things-first)
        - [Get your Time Machine backups and Mac OS clones up to date:](#get-your-time-machine-backups-and-mac-os-clones-up-to-date)
        - [Remove Homebrew:](#remove-homebrew)
        - [Apps/Tools Downloaded & Installed Directly:](#appstools-downloaded--installed-directly)
            - [iTerm2:](#iterm2)
            - [KeePassXC:](#keepassxc)
            - [Zsh:](#zsh)
            - [MacTeX:](#mactex)
            - [Karabiner-Elements Mac OS Keymapping Utilities](#karabiner-elements-mac-os-keymapping-utilities)
            - [inkscape](#inkscape)
            - [Gimp:](#gimp)
            - [Blender v2.8+](#blender-v28)
            - [HLedger Accounting Software](#hledger-accounting-software)
            - [Haskell Stack IDE](#haskell-stack-ide)
            - [Emacs](#emacs)
    - [Install Macports _(after removing HomeBrew)_](#install-macports-_after-removing-homebrew_)
        - [Common MacPorts Tasks](#common-macports-tasks)
            - [Update Ports Tree:](#update-ports-tree)
            - [Which Ports Need Update?](#which-ports-need-update)
            - [Upgrade Outdated Ports](#upgrade-outdated-ports)
            - [List ports explicitly installed:](#list-ports-explicitly-installed)
            - [List Everything Installed by MacPorts _(including all dependencies)_](#list-everything-installed-by-macports-_including-all-dependencies_)
            - [Install a Port _(and/or clean up mess)_](#install-a-port-_andor-clean-up-mess_)
            - [Uninstall a port _(does not remove dependencies)_](#uninstall-a-port-_does-not-remove-dependencies_)
            - [Remove Inactive Versions](#remove-inactive-versions)
            - [MacPorts Glossary](#macports-glossary)
    - [Install Macports Packages:](#install-macports-packages)
        - [Packages that need to be installed in Macports first:](#packages-that-need-to-be-installed-in-macports-first)
            - [Unix & SysAdmin Tools:](#unix--sysadmin-tools)
                - [Zsh:](#zsh-1)
                - [Other things, may or may not be critical...](#other-things-may-or-may-not-be-critical)
            - [Security, OpenSSH, OpenSSL, GNUPG etc:](#security-openssh-openssl-gnupg-etc)
            - [Python & pip:](#python--pip)
                - [Global `python`/ `pip` Examples:](#global-python-pip-examples)
                - [Virtual Envronment `python` / `pip` Examples:](#virtual-envronment-python--pip-examples)
            - [Spelling:](#spelling)
                - [Install aspell and dictionaries via MacPorts:](#install-aspell-and-dictionaries-via-macports)
                - [Install Hunspell and dictionaries via MacPorts:](#install-hunspell-and-dictionaries-via-macports)
        - [Now install everything else:](#now-install-everything-else)
            - [Dev Tools:](#dev-tools)
                - [Lisp: _(because that is really where we would rather live from now on)_](#lisp-_because-that-is-really-where-we-would-rather-live-from-now-on_)
            - [Publishing Writing Tools:](#publishing-writing-tools)
                - [Pandoc:](#pandoc)
                    - [Clone Pandoc Repo:](#clone-pandoc-repo)
                    - [Build Pandoc with Stack/Haskell:](#build-pandoc-with-stackhaskell)
            - [Graphic Design Tools:](#graphic-design-tools)
    - [Temporary Edit Workspace:](#temporary-edit-workspace)
        - [Placeholders:](#placeholders)
        - [OLD HomeBrew List: _(some of these may be useful)_](#old-homebrew-list-_some-of-these-may-be-useful_)
        - [HomeBrew Cask List:](#homebrew-cask-list)
    - [Table of Contents:](#table-of-contents)

<!-- markdown-toc end -->
