{ config, pkgs, lib, ... }:

let
  dockerPackage = pkgs.docker_29.override {
    version = "29.5.2";
    cliRev = "v29.5.2";
    cliHash = "sha256-kHgDZVr6mAyCtZ6bSG9FWV0GhWDfXLXzHYFrmjFzO9w=";
    mobyRev = "docker-v29.5.2";
    mobyHash = "sha256-lux7tTyF6vm5wuIXs+z3Ygd2v4JjgHbRvOXNA4kjNtg=";
  };
in
{
  environment.systemPackages = with pkgs; [
    vim
    mtr
    traceroute
    tcpdump
    acpi
    dmidecode
    pciutils
    lshw
    lsof
    procps
    psmisc
    fd
    file
    which
    usbutils
    git
    jq
    zip
    unzip

    direnv
    opencode
    tmux
    screen
    miller
    ngrok

    wl-clipboard

    python3
    poetry

    gimp
    google-chrome

    yad

    eclipses.eclipse-sdk

    code-cursor
    cursor-cli
    ripgrep
    mdcat

    zoom-us

    nvd
    nix-index
    comma
    btop
  ];

  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    package = dockerPackage;
  };

  users.users.mcyster.extraGroups = [ "docker" ];

  users.users.wal = {
    isNormalUser = true;
    description = "wal";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  users.users.bsmith = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  security.sudo.extraRules = [
    {
      users = [ "wal" ];
      commands = [
        { command = "ALL"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];

  services.smartd.enable = true;

  services.tailscale.enable = true;

  environment.variables.EDITOR = lib.mkForce "vim";
}
