{ config, pkgs, ... }:

{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    #alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

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
