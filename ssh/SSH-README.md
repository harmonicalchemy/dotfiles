# SSH README

[![License](https://img.shields.io/badge/LICENSE-GPL%20v3.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

This directory contains example **SSH config** files which reflect the best practice methods from top security experts in the field.  In particular, [**Stribika's: The secure shell**](https://stribika.github.io/2015/01/04/secure-secure-shell.html), and his [**Github wiki**](https://github.com/stribika/stribika.github.io/wiki/Secure-Secure-Shell) where many other experts have contributed results of their own independent research.

I have written and continually update a document titled: **OpenSSH Configuration & Management** a `PDF` file which may also be included within this directory once I have a good draft for publishing.  Currently I am using it while I get my own configurations debugged and ready for real-world use.  All of these files are actually not ready for real-world use yet.  When they are ready, this file as well as: **dotfiles** project's main `README.md` will be updated to reflect that status.

**The configuration files:** `ssh_config` _(system wide configuration file: `/etc/ssh/ssh_config`)_ & `config` _(user's home directory configuration file: `$HOME/.ssh/config`)_ are used to separate Global `SSH` configurations from special-case configurations.

Special case configurations are normally kept within the local user accounts `config` file for that users' special case `HOST` connections... 

Global default configurations are normally kept within the system wide `/etc/ssh/ssh_config` file for ALL users to use in common...

In singular use-cases where you are the only user on the machine you could simply add the contents of `ssh_config` to the **bottom** of your `$HOME/.ssh/config` file and be done with it...  This is what I do for SSH configurations within `work VMs` on my: **Reasonably Secure Qubes Laptop**.

## SSH Configuration Notes:

### The Named HOST Sections:

When connecting to multiple hosts, these sections are used to flesh out _(override)_ specific hosts or services requiring special requirements that the global `HOST *` section cannot or would not be practical to handle as a global option.

>     
**Note:** _Consult the file: `ssh_config` within this directory for an example of what the global `HOST *` section may look like._

#### Modify `config` for Your own SSH hosts/services:

- Using the examples in the single user's file: `config`, copy and/or rename a specific `HOST <name>` section for any host that requires special treatment.  Change its name to the name of your special host or service requiring special treatment. _(e.g., `host1`, `host2`, `legacy-host`, `uncomplient-host`, etc.).

- Override keyword directives set within the global HOST * section that do not match the requirements of your difficult host or service by setting those same keyword directives within your special named host section here, using a different attribute that does match your difficult host's requirements...
 
Note: This method works well because the OpenSSH configuration parser takes the first value for any directive it finds: (first: from the command line, second: from this local $HOME/.ssh/config, and third: from the system wide `/etc/ssh/ssh_config` file which is used by ALL local user accounts intended for the OS your are building or modifying.  It is for this reason the global `HOST *` section must be placed last within (any) file you put it in (which could be at the bottom of this file as well, if that is your choosing). 

In other words: If the SSH configuration parsor finds a duplicate keyword configuration directive set later during it's parsig journey, it will ignore it... Keep this in mind when you use these examples to set up your own configurations. 

### The GLOBAL HOST * Section:

**Find the system-wide SSH configuration file:** `ssh_config` within this directory. It contains an example of what the global `HOST *` section may look like.

This file has been set to the **_singular most restrictive settings possible_** based on knowledge of top security experts in the field.  Modify it only if you have many hosts to connect with that will not work in such a restrictive configuration environment.

If you only have a few hosts that don't match these restrictive global settings, then create specific `<named> HOST` sections for them _(as shown under the previous **Named Host** heading above)_

Other possible settings are also listed _(ordered by decreasing security strength)_ within the comments above each `ssh-keyword~directive` to make it easier for you to choose from if you need to.  These alternate settings are also fine to use _(with a bit lesser strength)_.  Non of the suggested settings listed within the comments of `ssh_config` are considered unsafe to use. 

>     
**Warning:** There are many Articles/Tutorials on the web showing configuration examples that are known to be unsafe!  Most of those were written before 2013 and the **_Snowden files_**.  But many are current articles _(written by authors who don't care about security all that much, or are just **unaware**)_ .  Beware!

Try limiting your global configuration for ALL hosts to the single most secure algorithms first...  Then only if absolutely necessary, add other less strong algorithms one by one until you get things connecting successfully.

If you have to enable `diffie-hellman-group-exchange-sha256`, that also requires the creation of another configuration file...  See the comments under `KexAlgotithms:` in the example `sshd_config` file within this directory for instructions...  This same instruction can be found near the top of the example `config` file as well...

Happy con-fog-uring and debugging! _(use `ssh -v` option a lot until you get it workng perfectly)_...  Then go celebrate the fruits of your hard work!!! <3 <3 <3 Alisha ;-)

