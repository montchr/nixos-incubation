{ config, lib, ... }:
let
  inherit (lib.types) path;
  inherit (lib.our) mkOpt;

  dir = (toString ./.);
in
{
  options.dotfield = {
    configDir = mkOpt path "${dir}/config";
    dir = mkOpt path dir;
    path = mkOpt path config.bud.localFlakeClone;
    binDir = mkOpt path "${dir}/bin";
    libDir = mkOpt path "${dir}/lib";
    modulesDir = mkOpt path "${dir}/modules";
    vendorDir = mkOpt path "${dir}/vendor";
  };
}
