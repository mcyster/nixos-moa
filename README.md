# Nixos config for `emu`

This is the `/etc/nixos` directory on my workstation `emu`.

The configuration is minimal, most of the custom installation and configuration is done under my user using `nix-env` <http://nixos.org/releases/nix/nix-1.7/manual/#sec-nix-env> or `nix-shell` <http://nixos.org/releases/nix/nix-1.7/manual/#sec-nix-shell>

## This repo

Making changes:

* change configuration 
* `nixos-rebuild switch`
* check changes, reboot if needed
* `git add -A; git commit -m 'descriptive message'; git push origin master`

## Other user configs

<https://github.com/kragniz/configuration.nix/blob/master/configuration.nix> - Gnome3

See <https://nixos.org/nixos/manual/index.html#sec-installation>

Booted from a minimal Nixos image (17.03) on a USB stick

Had problems with booting the installed image after using gdisk, so I switched to fdisk.

This script bootstraps this machine: <nixos-bootstrap-setup>

