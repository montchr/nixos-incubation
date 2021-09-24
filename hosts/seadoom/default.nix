{ profiles, suites, ... }:
{
  imports = [
    ./hardware-configuration.nix
    profiles.linode
  ] ++ suites.base;

  networking.hostName = "seadoom";

  bud.enable = true;
  bud.localFlakeClone = "/etc/nixos";

  time.timeZone = "America/New_York";

  services.openssh.permitRootLogin = "no";
  services.openssh.openFirewall = true;

  system.stateVersion = "21.05";
}
