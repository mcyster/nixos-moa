# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # VPN comment out if you don't have
      ./vpn/network-extole.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "emu"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  networking.extraHosts = ''
    52.3.248.63 vpn.intole.net
    52.91.195.221 vpn.intole.net
    54.86.141.200 vpn.intole.net
  '';

  services.dnsmasq.enable = true;
  services.dnsmasq.extraConfig = ''
    server=/.intole.net/10.1.0.2
    conf-dir=/etc/dnsmasq.d
  '';

  # Select internationalisation properties.
  i18n = {
  #   consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    tcpdump
    acpi
    dmidecode
    lshw
    lsof
    vim
    git
    jq
    zip
    unzip
    chromium
    eclipses.eclipse-sdk
  ];

  environment.interactiveShellInit = ''
    export PATH="$PATH:$HOME/bin"

    shopt -s histappend
    shopt -s checkwinsize
  '';

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.netdata.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  services.xserver.desktopManager.gnome3.enable = true;
  #services.xserver.videoDrivers = [ "nvidia" ];
  #services.xserver.videoDrivers = [ "nvidiaBeta" ];
  services.xserver.videoDrivers = [ "nvidiaLegacy340" ];

  users.extraGroups.mcyster = {
    gid = 2042;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.mcyster = {
     isNormalUser = true;
     uid = 2042;
     group = "mcyster";
     extraGroups = [ "wheel" ];
  };


  environment.variables.EDITOR = pkgs.lib.mkOverride 0 "vim";
  programs.bash.enableCompletion = true;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

  nixpkgs.config.allowUnfree = true;
}
