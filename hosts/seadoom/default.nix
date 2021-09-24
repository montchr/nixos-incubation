{ profiles, suites, ... }:
{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
    profiles.linode
  ] ++ suites.base;

  bud.enable = true;
  bud.localFlakeClone = "/home/cdom/devos";
}
