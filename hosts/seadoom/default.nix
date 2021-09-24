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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}
