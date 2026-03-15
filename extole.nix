{ config, pkgs, ... }:

{
  imports = [
    ./wireguard-vpn-dev.nix
    ./wireguard-vpn-prod.nix
  ];

  services.dnsmasq = {
    enable = true;
    settings = {
      server = [ "/vpn.intole.net/8.8.8.8" "/.ec2.internal/10.1.0.2" "/.intole.net/10.1.0.2" ];
      conf-dir = "/etc/dnsmasq.d";
    };
  };

  networking.firewall.enable = true;

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    firefox
    awscli
    gnupg
  ];

  users.users.mcyster = {
    isNormalUser = true;
    uid = 1000;
    group = "users";
    extraGroups = [ "wheel" "audio" "video" "systemd-journal" "systemd-network" "dialout" ];
  };
}
