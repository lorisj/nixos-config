# NixOS Config

This repository hosts my NixOS configuration.

The configuration is organized along three layers:

1. **Machine:**  physical hardware (e.g. `hp-spec-laptop`, `my-desktop-workstation`)
2. **OS:**  operating system layer (currently only `nixos`, in the future may add `wsl` and `darwin`)
3. **User:**  individual user account

## Layout

```
lib/
machines/
modules/
OS/
users/
```

### `lib/`
* `mksystem.nix`:  given a machine, OS and list of users, returns a nixosConfiguration.
* `registry.nix`:  register which machine/OS/user combinations to use.

### `machines/`

Each physical machine has a directory `machines/<name>/` containing:

* `configuration.nix`:  machine-wide configuration that is independent of OS and users.
* `hardware-configuration.nix`:  generated on the given machine by `nixos-generate-config --root /mnt`.
* `meta.nix`:  metadata such as `system` and `hostName`.

### `modules/`

Reusable modules for specific applications. For instance:

* `modules/display/`: for window managers
* `modules/audio/`: for PipeWire, etc.

### `OS/`
Each OS (`nixos`, `wsl`, ...) has a nix file `<operating-system-name>.nix`, which is an OS-level configuration shared across machines and users.

### `users/`

Per-user configuration:

* `users/<user>/machine/`:  settings for a user on a specific machine, independent of OS.
* `users/<user>/OS/`: settings for a user on a specific OS, independent of machine.
* `users/<user>/home-manager.nix`  user-specific configuration independent of machine or OS.
