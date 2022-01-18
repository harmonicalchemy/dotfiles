---
file: qubes-split-gpg-README.md
author: Alisha Awen, siren1@disroot.org
created: 2019-010-27
updated: 2022-001-18
tags: README, 2022, SysAdmin, gnupg
---

![Banner](./media/Dotfiles-Github-Banner-v2.png)

# Qubes Split GPG README

[![License](https://img.shields.io/badge/LICENSE-GPL%20v3.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

**Table of Contents**

- [Official Qubes OS Doc & Instructions](https://www.qubes-os.org/doc/split-gpg/)

- [Qubes Split GPG README](#qubes-split-gpg-readme)
    - [Introduction:](#introduction)
    - [The Qubes Split GPG Back End:](#the-qubes-split-gpg-back-end)
    - [The Qubes Split GPG Front End:](#the-qubes-split-gpg-front-end)

## Introduction:

Qubes-split-gpg represents my current best practice configuration for GnuPG, running on a Qubes based system.  Use this section if you are looking to configure a Qubes OS based system in a similar way. This is arguably the most secure way to use GPG2 on the planet!  If you don't believe this, do your own research... You will come to the same conclusion...

Qubes Split GPG is similar to using GPG with an external Yubikey, but even better than that because it allows you to keep your primary secret keys completely off line (air-gaped) and you do not have to transfer data through USB which is super vulnerable to side channel attacks!  Primary secret key operations are never done while the machine in question has networking enabled! Especially WiFi! Reference: https://www.qubes-os.org/doc/split-gpg/ - This will show you how to set everything up.

This directory contains example files (TEMPLATES) that work with GnuPG > V2.1.11 and even better if you upgrade to the latest current version of GnuPG (now at V2.2.x).  In security, frequent updates are mandatory!  Not just the security software... All your software and Apps!  

Unfortunately smart phones are not secure at all! Consider them to be corporate, government, and hacker spying devices in return for enticing social candy apps (also designed to profile you while you use them).  I don't keep any sensitive info on my phone and I don't care to do social networking there either... I am back to using phones for what they were originally designed for :telephone:.  

This is our sorry state of affairs until someone manufactures a smart phone that is safe. Preferably one that is 100% open-source (hardware too)... Will that ever happen?  It must!  I am betting on current Blockchain and Smart Contract Tech to become much more stable and mature over the next couple of years!  We need that now but there are still problems with consensus algorithms, making a system that is reasonably BFT (Byzantine Fault Tolerant), and scaleable...

That is a tough one because in truth we are all bad players...  Oh! You never told a lie in your whole life? Wow!  You are a saint!  Our machines are not "bad players" (yet), but they make mistakes (bugs) and as you know.. "Garbage In, Garbage Out". Bugs can cause all kinds of collateral damage within applications, especially if those applications provide financial or legal services!

## The Qubes Split GPG Back End:

Isolated off-line (air-gaped) Qubes Split GPG back end (vault) domains act in a similar way to a key-card (like a YubiKey), only better because it locks the door and does not use or attach to a problematic USB attack surface... Instead, you to keep your primary secret keys completely locked away off line in an (air-gaped) vault. Primary secret key operations must never be done while the machine in question has networking enabled!  Especially WiFi!

The child folder within this section: `gpg-vault` contains config files for the Qubes Split GPG Back End or Vault...  You will find `gpg.conf` and `dirmngr.conf` within `gpg-vault`.  Both of these files have been custom tailored for back end functionality exclusively.  `gpg-vault/dirmngr.conf` is a dummy placeholder because this vault VM is isolated by itself. (unlike dirmngr.conf within is in the Front End Vault VM...

Although these files were tailor made for a Qubes OS based system, there is nothing fancy about them.  This config file contains standard gpg configuration directives read by the GPG configuration parser upon running of each command.  You may add any valid long option here on a blank line...  Command line abbreviations or the leading dashes are not allowed within the config files...  Simply add your directive on a blank line like this: 

     your-desired-gpg-directive gpg-directive-setting

## The Qubes Split GPG Front End:

The Qubes Split GPG front end is a network enabled App VM that gets internet access through another System VM called: [sys-firewall].  When GPG `(qubes-gpg-client)` is invoked, the back end process has keys loaded into a secure running gpg-agent which provides normal gpg2 services through a secure channel as if the agent were running on the App VM itself...

Split GPG AppVM front ends are used for email using Thunderbird with the enigma plugin via qubes-split-gpg back end for GPG integration... Split GPG is also used by GIT to sign commits etc. with a designated signing sub-key.
