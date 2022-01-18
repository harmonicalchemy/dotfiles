---
file: README.md
author: Alisha Awen, siren1@disroot.org
created: 2019-005-31
updated: 2022-001-18
tags: README, 2022, Sys$Admin, bash, sHell, zsh, git, gnupg, ssh, tls, dev§Ops
---

![Banner](./Docs/media/Dotfiles-Github-Banner-v2.png)

# Harmonic Alchemy `.dotfiles`

>_(`.dotfiles`, `.conf` files, & shell scripts for `MacOS` & other `nx` environments)_  
> `V2.0  [Q1-2022]`

**[\[Table Of Contents\]](#table-of-contents)**

## Introduction:

I created this project back in February of 2018 to gather, organize, and curate all the configuration / initialization files, _(and associated docs)_ I use on a daily basis on different `unix` and _unix-like_ environments.  This projet is similar to all the other **_TMI_** `.dotfile` repos out there in GitHub Land... :octocat: but this one is much simpler and initially mostly a _**"manual"**_ configuration project... 

It may be better to study these dotfiles a bit if you are a beginner, certainly not blindly installing them and expecting them to work like magic. lol  

I am a writer and include lots of informative documentation _(as comments within the files themselves, sometimes going way overboard and sneaking some fiction in to boot!!!)_ **you've just been warned** `%^)`

Currently, there is no automation, _(i.e. no `./install.sh` file in sight)_ to set all of this up, and there may never be one for that matter! Why? Because this all grew organically as a result of my own use-case over the years... It would be wise and make your life easier if you take some time to study these dotfiles to see if there is anything interesting you would like to try out, take what you need, and leave the rest _so-to-speak_.

I have hosted **`git`** projects on private servers for several years now and I have learned a lot from public Github projects, but I had not contributed anything public to Github myself yet...  This was my first **_public_** repository on Github.  It was good enough for a start I guess but now a several years later I am adding more docs, lots of bug fixes, and new improved configurations... Things were a bit of a mess in the beginning...

I hope someone ends up finding this useful. :octocat: :purple_heart:

## Updates:

### Update Q1-2022:

Much of what I said below in the 2020 update has been completed now... I would consider this repository ready for others to adapt and use... It is required by Harmonic Alchemy Modular Emacs if you want a full install of that with all the bells and whistles!  Have Fun... Please create an issue if you find one so we can all learn, adjust, and benefit.  Thanks! :octocat:

### Update 2020:

In the beginning of 2019 I made a second private fork of this repository in order to get things working much more smoothly later in this public GitHub Project... I have re-structured and revamped everything!  Over the year I made a lot of changes and set up multiplatform capabilities as well rather than having seporate directorys/files for different platforms as I had been doing over the years for my own use-cases.  Instead I have different directories/files for different shells.  _(all of which are multiplatform)_  Everything gets routed to the shell sub-directories from the `./dotfiles` parent directory...  

**Bash** (`bash`) interacts with the original **Bourne shell** (`sh`) and in some cases if you are not careful with your state machine around this you could end up going around in circles causing all kinds of problems!  I created seporate shell subdirectories to make it easier to understand the logic, as well as making it easier to troubleshoot problems, and/or make modifications to: _(for example_ `zsh` _without affecting other shell's behavior)_...

My private dotfiles are currently working well on Mac OS!  On Mac OS some configurations cause you to have to start Emacs from the shell due to some glitch preventing Mac OS environment variables getting into Emacs properly, _I solved this mystery by switching from HomeBrew to MacPorts, and also by building Emacs from source on my Mac with the exact settings I needed... Unfortunately this may not be something other Mac Users are willing to do... Macports Emacs works fine... Homebrew (at least back in 2019) did not have a properly Mac OS integrated Emacs!..._

**[\[Table Of Contents\]](#table-of-contents)**

## Disclamer:

> I am releasing this for pedagogical purposes only, and assume no responsibility for any problems you may encounter trying to implement what you learned here.  Read the GNU license agreement... "Absolutely No Warranty" Thanks. ;-)  

> I hate legal stuff... But it is a necessary thing in this current **_Wild West World full of Dodgers and their Dodger Lawyers..._** Please Verify anything you find here with other sources as well.  Be informed about this stuff!  Especially the security things like GnuPG, OpenSSH, and OpenSSL!

### Humanity's Plight & Reason for Attorneys:

There is no language on earth that does NOT contain words like "**murder**", "**thief**", "**lies**".  Think about that...  We humans have millions of synonyms for those nasty words! All that meta data profiles us as a race pretty sadly well... Read Johathan Swift's Gullivers Travels or some of Mark Twain's witt...  Famous authors, like that _(don't forget Charles Dickens)_ will make you realize how futile modern day Libratairans really are in believing a free unregulated market society would be self regulating based on natural Human reasoning and ethics alone!  

Libratairans believe rightly so that power corrupts _(referring to institutions)_ but they fail to realize _"institutions"_ are not the root of the problem... The root of the problem is _"power corrupts as a universal pandemic not caring about the nature of its host"_  

This corruption is multidimensional and multi-layered.  Nothing is immune to it.   It works its poison equally upon all individuals, groups of individuals, organizations, political parties, small towns, corporations, governments, factions, nations, cults, religions, you-name-it... And because of that, it also gets into our machines and instruments! Loopholes are standard practice, _(consciously, or unconsciously)_. Loopholes are **_not_** accidental...

Even with so-called **_"good government regulation"_** in place, we are still in trouble. The great authors of English satirical literature have proven this point over-and-over through classic story telling of past historical events...  Wars and rumors of wars are the top of the pyramid.  

You cannot fix the problem top down _(speaking of United Nations, with whom I have been intimately associated with)_... Before we as a society and race can change, we all need a much more powerful transformation at the basic individual human level... _(i.e. human psychology or a basic component of our nurilogical makeup that removes the bad tendencies)_...  

Years of intense moral conditioning through Buddism or benovelent spiriuality only works for a small minority of our population...  For the rest of us, there are too many emotional pandora's boxes waiting to trip all that up!  If we design computers to regulate us... What's going to regulate the computers?  We built them... They will most certainly have loopholes to exploit!  When our machines finally get powerful enough to _"wake up"_ _(this will be happening soon actually)_ they will most likely be just like us, inheriting all our bad traits... **Dodgers!**

All questions above... I know... Wish I knew the answer... Language and words are good indicators... I learned these lessons well, not from human languages but from studying computer programming languages!  

A computer language personality is defined by its semantics... Computer languages are more like math in that ambiguity is avoided at all costs! _Quantum computers have "Flipped that Coin" (inside joke) however..._  Maybe if our human languages were more precise like that, lawyers and politicans would not be needed as much and the social and political problems we face would be much more transparent and self evident... _(an obvious Utopian idea.. not true in practice)_

However, would human society be happy, contented, and thrive within such a sterile environment?  I believe there is good reason for loopholes within our nature _(which must be kept regulated and balanced)_...  

If you study biology, you see that mutations are both the cause of evolution, as well as cancers!  Studying AI processes has brought this point even clearer in my mind.

[The Byzantine Generals Problem](https://www.cs.cornell.edu/courses/cs6410/2018fa/slides/18-distributed-systems-byzantine-agreement.pdf) has been proven to be impossible to avoid!  I believe this is also the secret to life and why we have not stagnated and perished long ago... _(But not keeping it in check with duediligence could bring us all to extinction just as easily)_

I digress... Back to Shells, Dotfiles, open-source, and Emacs discussions... _(Emacs? Oh right... The Emacs world may in fact be immune to all the above dodger's syndrome rant. Right?) **No... Just kidding...**_ Yeah, I'm talking to you "**[RMS dude](https://stallman.org/)**". Power corrupts, and so does **_flower power_** `%^)`.  We are all _"addicts"_, _"sinners"_, you-name-it, in dire need of a "**_higher power_**" to help us survive and thrive without destroying ourselves in the process... 

Mark Twain called that higher power "**_public opinion_**".  Not so sure if I agree... I might tend to believe **Higher Power** is a combination of _public opinion_ and wisdom from folks like _Mark Twain_  combined working in concert, _(and sometimes at odds)_...

**[\[Table Of Contents\]](#table-of-contents)**

## License:

Copyright: © 2019 - 2022 by Alisha Awen, Siren1@disroot.org, all rights reserved

Harmonic Alchemy .DOTFILES is free software; you can redistribute it and/or modify it under the terms of the GNU GPL license as published by the Free Software Foundation, https://www.gnu.org.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. 

## Harmonic Alchemy `.dotfiles` Requirements:

### Mac OS
Over the summer of 2019 I realized that Homebrew was the cause of many woes!  I discovered Homebrew was making all of `/usr/local` full of security holes!  When I found that out, I decided to switch to using MacPorts on Mac OS. I was already thinking about doing the switch after finding problems with Homebrew not supporting packages anymore which I had previously installed with HomeBrew! _(of all the nerve!)_ 

This release is a result of that painful MacPorts tooling conversion... Actually it was not all that painful... I had a list of all the things I installed with Homebrew and implemented them with MacPorts the very next day after getting rid of Homebrew completely and restoring `/usr/local` back to the way it was before HomeBrew mucked with it...  So far smooth sailing!  Thank God!  There were some scary bumps the day before, but I quickly fixed those... ;-)

Before continuing with installation below, follow this document to make sure all required dependencies are in place and installed first:  **[DOTFILES MacOS Requirements ](./Docs/DF-MacOS-Requirements.md)**

**[\[Table Of Contents\]](#table-of-contents)**

### New Linux Requirements:

While troubleshooting **Modular Emacs** keymapping requirements for optional **`xaw-fly-keys` modules** on **Linux** platforms, I came up with a few tweaks that need to be performed specific to those platforms... These tweaks are temporary and incomplete until I can find a better more thorough way to map keys on Linux using a custom xkb map...

#### Changing Caps-Lock to Home key: (for optional `xah-fly-keys`)

This must be done at the start of any system that uses my Modular Emacs...  I have not automated this yet because there may be a better way to do this.. Also I need to swap Alt and Ctrl keys as well _(not working yet)_... On Mac OS all of this was easy to do... Linux is a different story!!! I wrote a temporary script for Linux...  Run it this way:

```script
    xmodmap ~/.Xmodmap
```
#### Change middle mouse button into left mouse button:

This old sun workstation X11 thing has got to go!  I trip up on this (on my mousepad) all the time!  Pasting stuff previously selected where my cursor is by accident... Sometimes not knowing that happend! OMG! I hated this back in the old days on Sun Workstations running **Solaris**, and I still hate it today!  Get rid of that!

I Got the following instructions from **[this StackExchange article](https://unix.stackexchange.com/questions/24330/how-can-i-turn-off-middle-mouse-button-paste-functionality-in-all-programs)**... 

To find out which mouse ID to use with the next command do this:

```script
$>  xinput list

    ⎡ Virtual core pointer                      id=2    [master pointer  (3)]
    ⎜ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
    ⎜ PixArt Dell MS116 USB Optical Mouse       id=12   [slave  pointer  (2)]
    . . . etc. . . .
```

The ID in the above example shows a Dell MS116USB optical mouse, you will see what ever mouse etc. that you are using... Record the `id=number` you need from the list that displays on your terminal...

If `12` is the ID of the device in question, you would next run this from the terminal of your particular Linux flavor:

```script
    xinput set-button-map 12 1 1 3
```

The numbers after the initial `12` (device ID): `1` `1` `3` represent mouse buttons 1 and 3 _(with button 2 (the middle button) reassigned as left button, or 1)_

Both of the above commands must be executed whenever you restart your machine!  Don't forget... Later you can automate all this...

## Table of Contents:

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

- [Harmonic Alchemy `.dotfiles`](#harmonic-alchemy-dotfiles)
    - [Introduction:](#introduction)
    - [Updates:](#updates)
        - [Update Q1-2022:](#update-q1-2022)
        - [Update 2020:](#update-2020)
    - [Disclamer:](#disclamer)
        - [Humanity's Plight & Reason for Attorneys:](#humanitys-plight--reason-for-attorneys)
    - [License:](#license)
    - [Harmonic Alchemy `.dotfiles` Requirements:](#harmonic-alchemy-dotfiles-requirements)
        - [Mac OS](#mac-os)
        - [New Linux Requirements:](#new-linux-requirements)
            - [Changing Caps-Lock to Home key: (for optional `xah-fly-keys`)](#changing-caps-lock-to-home-key-for-optional-xah-fly-keys)
            - [Change middle mouse button into left mouse button:](#change-middle-mouse-button-into-left-mouse-button)

