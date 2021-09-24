{ hmUsers, ... }:
{
  home-manager.users = { inherit (hmUsers) nixos; };

  users.users.nixos = {
    uid = 1001;
    hashedPassword = "$6$S3Yos7my$RtJ2w0VuycqPMJd2rz.dFBYHB00VMlFimeov8fhVllkBpaBB0LKqwSQQVz5vCd0E//n4Zd9TY78h2DeoSHwyA0";
    description = "stable";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
