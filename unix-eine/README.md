## Installation
To install, first clone this repository:  
```
git clone https://github.com/nereine/shs/tree/master/unix-eine
```
Then change working directory to the repository:
```
cd /path/to/sh-tools
```
and execute install.sh to sync the files using either `rsync` or `cp`:
```
./install.sh
```
# sh-tools  
A collection of private shell (bash) scripts for everyday computing. It is intended to be used with specific set of dotfiles which are maintained together in `artnoi-staple`. From 2020, the scripts are to be checked with `shellcheck` before being committed to `Master`.
### Examples 
#### up  
Cross-platform package manager/system update shortcut. Currently supports macOS, Debian and Arch Linux-based distros, and FreeBSD   
#### svstat
Shortcuts for service management. Works with systemd, Sys-V init, and runit  
#### showports  
Shell script that shows FreeBSD package origin  
#### ssc  
Shell script that `sed`s `sshd_config` (hence s s c)  
#### cpuset  
Shell script that sets CPU speed - now only works on Linux  
#### cattmp  
Shell script that uses `cat` and `watch` to monitor CPU temperature  
## License  
shit-tools is distributed under BSD License, in case anyone is interested  
## Dependencies  
up	: `brew` (macOS), `pkg` and `poudriere` (FreeBSD)  
catdisk	: `smartmontools`  
cpuset	: `cpufreq-set` or `cpupower`  
# dotfiles  
This is a collection of UNIX dotfiles. Most color themes (like those in `.Xresources` or `.vim/colors` are mixed from various other open-source projects, which I did not keep track of, so *I'm terribly sorry if I cannot give credit to the orginal creator of such themes*. 
`.bashrc`, `.bash_profile` and their source files (i.e. files in `.config/shell`) are needed if you want to use `sh-tools` shell script. 
## Credit 
- [Matthias' dotfiles](https://github.com/mathiasbynens/dotfiles) I derive most of bash config files from this repository.  
- Several other color schemes (terminal themes) - I forgot which line is from which project - and Google search didn't help. Perhaps I got some of it from a compilation like [this one](https://github.com/logico-dev/Xresources-themes).  
- [vim-afterglow](https://github.com/danilo-augusto/vim-afterglow) My favorite color scheme for `vim`. Does not work on some systems (currently).  
- Some files are modifications of my Linux distribution default config files - so very special thanks to **MX Linux** (for `.conkyrc` and some element in bash config files) and **Manjaro Linux** (for `.Xresources` with `urxvt` configuration)  
### Future 
This repo should grow as I use more dotfiles. Some complex dotfiles (e.g. `.tmux.conf`) might be forked from other popular choices out there. 
