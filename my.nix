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
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

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
  ];

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
    extraGroups = [ "wheel" ];
  };

  users.users.bsmith = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.users.kaden = {
    isNormalUser = true;
  };

  environment.variables.EDITOR = lib.mkForce "vim";
}
