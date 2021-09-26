{ config, lib, pkgs, inputs, ... }:
let
  # configDir = "${config.dotfield.configDir}/emacs";
  # doomDir = "${config.my.xdgPaths.config}/doom";

  # ediffTool = (pkgs.writeScriptBin "ediff-tool"
  #   (builtins.readFile "${configDir}/bin/ediff-tool"));

  emacsPkg = with pkgs; ((emacsPackagesNgGen emacsPgtkGcc).emacsWithPackages (epkgs: [
    epkgs.vterm
  ]));
in
{
  nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];

  environment.systemPackages = with pkgs; [
    emacsPkg
  ];
}
