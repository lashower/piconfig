# raspconfig
Since a Raspberry Pi allows you to hotswap your OS using a SD card, I wanted a more automated method for configuring it to my specifications.

I learned about Chef IO, which is a distribution tool that allows you to configure environments based off a cookbook. Using chef, you can specify what options you want configured on your Pi.

While Chef Cookbooks are typically platform independent, this is primarily designed for the Raspberry Pi.

Tested devices:
Hardware Raspberry Pi 3
Raspbian GNU/Linux 8 (jessie)

## What's included
Currently, piconfig will setup these based on what you set in the attributes:
* Setup for new users.
* Kodi (Entertainment system)
* NodeJS (Seems like it adds an old version)
* vim (Command line file editor)
* htop (Real time performance monitoring in command line)
* Command line shortcuts
  * l (List all files and directories in current location)
  * ll (Same as l, but with more details)
  * la (Same as ll, but with hidden files)
  * myip (Displays your IP address)
  * emu (Shorthand for emulation station used in RetroPie start)
* tree command fix
* .bashrc enhancements
* [RetroPie](https://retropie.org.uk/)
  * You can install all available emulators for RetroPie.
  * For complete list of available emulators, check out my RetroPie github (TODO).
* [conky](https://wiki.archlinux.org/index.php/conky)
* User language (locale) fix for US.

## Requirements
### Platforms
Raspbian GNU/Linux 8 (jessie)
I will try my best to support any ARM based OS. Feel free to create an issue if necessary.

### Cookbooks
* conky (under development)
* [locale](https://supermarket.chef.io/cookbooks/locale)
* RetroPie (under development)

### Attributes
#### Setup options
```
node['piconfig']['setup']['users'] = false -- Set to true if you want to create new users. See User options.
node['piconfig']['setup']['RetroPie'] = false -- Set to true if you want to install RetroPie.
node['piconfig']['setup']['locale'] = false -- Set to true if you want to set the default locale to en_US.
node['piconfig']['setup']['default'] = true -- Set to true if you want to install some default packages. (Recommended)
node['piconfig']['setup']['conky'] = false -- Set to true if you want to install conky.
```

#### User options
```
default['piconfig']['users'] = ['isaac','gene','john'] -- The list of users you want to create on your PI.
```
For each user create these properties
```
default['piconfig']['user']['<username>']['comment'] = 'JRR Tolkien'
default['piconfig']['user']['<username>']['password'] = '$1$FhNcGRiJ$OuOYI2NYa.a6ShGF6nZlw0'
```

For password encryption see [Password Shadow Hash](https://docs.chef.io/resource_user.html#password-shadow-hash). Keep in mind hashes are distinct for each pi, so you will need to run 'openssl passwd -1 "theplaintextpassword"' on your pi to have the proper configuration.

### RetroPie options
See my RetroPie Github project for more info.
