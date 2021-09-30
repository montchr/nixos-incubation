{ config, hmUsers, pkgs, ... }:
let
  inherit (hmUsers) cdom;

  username = "cdom";
  home =
    if pkgs.stdenv.isDarwin then
      "/Users/${username}"
    else
      "/home/${username}";
  email = "chris@cdom.io";
  githubUsername = "montchr";
  sshKeys = [
    # yubikey
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3tWcOwvNOfHXX3YvtLmJRigxATUh++bWRCAM07uy3mbNvEteT5bF/7nixO44gep0Hv24jaqLeGjCaTxFXrmt1NGgvmAXcsoS4I3+N2xfiFZPIKoiF0EONDsInjm4h5eNoPPE4Rd9xLju4S4tXaXDcL37PunQZJ+aR6CRVf/geM+H4y70cvYHV6uakMAfuv/0+AEMLwlSIN7OpDN8B+JGI4rQhBsekRkkkcZlPYO4vT63aTvLCYFxJ/fR45oMKW57lvZUrbRMHbKRkOfyhBF3qbYR/9aMEUd7gjYBfLJ1hQaHlp2aV49m53WFBjmjqjFcxDPxS/HMk/Hazowkw0G6iNzSNHnO5wI/BxIEahavYvd4VOQXpaWs/G58t8kdQol8WFufLjAReP0j16TqcWEHwy1ktMcrpYfDlLSlNcuaUeXJNIyvD3WmfRDXBnxlBenFIqe9lnK8RUVCcxM+lEEJbMWs1ZuWmgXjbt3UkFhSKSv2Adlm2/OfBBCyO46hVmhLfkwzB69aXYqUjPthlvtCDuLxrmT+DZeWsucUKPp2L9PXS6LpbpnIWCqmnGIPLjHBX2X3EOKwrtLAGN5wv7zLv88qHOD0MET2KVZkfTLg04FkcNowNwAlQ8xBBjpt6xEWNFMH532ZRO1CT0VTUNB7nEW2JET1SULsRT/bTUbKQHQ== chris@cdom.io"
    # Blink on iOS
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG2HrKDL60obU2mEkV1pM1xHQeTHc+czioQDTqu0gP37 blink"
  ];
  xdg = {
    bin = "${home}/.local/bin";
    cache = "${home}/.cache";
    config = "${home}/.config";
    data = "${home}/.local/share";
  };
in
{
  home-manager.users = { inherit cdom; };

  users.users.${username} = {
    inherit home;
    isNormalUser = true;
    uid = 1000;
    description = "Primary user account";
    hashedPassword = "$6$cmmnia0KcFp9EW2$86jtbUy9LUPXBrbZj2B7Vbzmm9qrYFaCp8U8DV55SbA1sibHzKneKNY597EkgXSYY7yXXlYf1Yxaw/hmKwRGU.";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = sshKeys;
  };

  environment = {
    variables = {
      # `$DOTFIELD_DIR` must point to its absolute path on the system -- not
      # to its location in the Nix store. ZSH may cache a path to an old
      # derivation.
      DOTFIELD_DIR = config.dotfield.path;

      # If `$DOTFIELD_HOSTNAME` matches `$HOSTNAME`, then we can assume the
      # system has been successfully provisioned with Nix. Otherwise,
      # `$DOTFIELD_HOSTNAME` should remain an empty string.
      DOTFIELD_HOSTNAME = config.networking.hostName;

      XDG_BIN_HOME = "${xdg.bin}";
      XDG_CACHE_HOME = "${xdg.cache}";
      XDG_CONFIG_HOME = "${xdg.config}";
      XDG_DATA_HOME = "${xdg.data}";

      GITHUB_USER = githubUsername;
      LESSHISTFILE = "${xdg.cache}/lesshst";
      WGETRC = "${xdg.config}/wgetrc";
    };
  };
}
