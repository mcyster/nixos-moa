{ config, pkgs, ... }:

{
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
    zed-editor
    gimp
    google-chrome
    zoom-us
    ngrok
    #python3
    #poetry
    #python310Packages.pyserial
    usbutils
    screen
    eclipses.eclipse-sdk
    #vscode
    miller
    #pkgs.gnome.gnome-tweaks
    ptyxis
    zed-editor
    code-cursor
  ];

  users.extraUsers.wal = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
  };
  users.extraUsers.bsmith = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
  };
  users.extraUsers.kaden = {
     isNormalUser = true;
  };

  environment.variables.EDITOR = pkgs.lib.mkOverride 0 "vim";
  #environment.variables.BROWSER = pkgs.lib.mkOverride 0 "google-chrome";
}
