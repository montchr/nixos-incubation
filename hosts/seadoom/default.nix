{ profiles, suites, ... }:
{
  imports = [
    # ./configuration.nix
    #./hardware-configuration.nix
    ./orig/configuration.nix
    ./orig/hardware-configuration.nix
    #profiles.linode
  ] ++ suites.base;

  bud.enable = true;
  bud.localFlakeClone = "/etc/nixos";

  services.openssh.openFirewall = true;
}
