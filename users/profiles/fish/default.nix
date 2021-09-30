{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    plugins = [
      {
        inherit (pkgs.sources.fisher) src;
        name = "fisher";
      }
    ];
    shellAbbrs = {
      g = "git";
    };
  };
}
