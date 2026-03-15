{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./hardware-my.nix
    ./my.nix
    ./extole.nix
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    devices = [ "nodev" ];
  };

  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  networking.hostName = "moa";
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.gnome.gcr-ssh-agent.enable = true;

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "mcyster" ];
    substituters = [
      "https://cache.nixos.org/"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 90d";
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  zramSwap.enable = true;
}
