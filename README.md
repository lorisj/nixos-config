# NixOS config

This is my NixOS config. 

It is split up into three distinctions:

1. **Machine:** The physical hardware machine, i.e. `my-dell-laptop`, `my-desktop-workstation`
2. **OS:** The OS (for now just `nixos`, in the future maybe `wsl` and `darwin`) 
3. **User:** The end user/account.
 

## File structure
The config is split up as follows:


### `/lib`
#### `mksystem.nix`    
Given a machine, OS, and set of users, build a system with that OS and users.
#### `registry.nix`:
Actually define the targets, i.e. if I wanted user `loris` on system 

### `/machines/`
For each physical machine `machine-name`, create folder `/machines/machine-name`, and in there, create:

#### `.../configuration.nix`
Global configuration (machine wide, meaning independent of OS and user) here.
#### `.../hardware-configuration.nix`
Generated file when running `nixos-generate-config --root /mnt`
#### `.../meta.nix`
Define systemwide constants/metadata, in particular the following are required:
- system
- hostName

### `/modules/`
These represent modules that are application specific, i.e. `/modules/display/` for window managers, `/modules/audio/` for pipewire, and so on.

### `/OS`
For each OS, define configurations that are independent of system and user here.

### `/users/`
#### `/users/${userName}/machine/`
For each machine that `${userName}` is on, define user config that is independent of OS but specific to this machine and this user.
#### `/users/${userName}/OS/`
For each OS that `${userName}` is on, define user config that is independent of the system, but specific to this OS and this user.
#### `/users/${userName}/home-manager.nix`
User configuration that is specific to `${userName}`, but independant of OS and system.

