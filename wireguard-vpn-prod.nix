{ config, lib, pkgs, ... }:

{
  networking.wireguard.interfaces = {
    vpn-prod = {
      ips = [ "10.1.228.32/32" ];
      privateKeyFile = "/etc/wireguard/vpn-prod.key";
      peers = [
        {
          publicKey = "i7XotCMw77n6WUjeTYtcS22Ev+t+Q63+KzGCmVm0cyE=";
          allowedIPs = [ "10.1.0.0/16" ];
          endpoint = "54.147.21.12:443";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
