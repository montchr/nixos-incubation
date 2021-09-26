{ config, lib, pkgs, inputs ... }:
{
  channels.latest.overlays = [
    inputs.emacs.overlay
  ];
}
