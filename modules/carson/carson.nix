{
  self,
  inputs,
  ...
}: {
  flake.modules.darwin.carson = {lib, ...}: {
    imports = lib.singleton inputs.hjem.darwinModules.default;
    hjem.users.carson.enable = true;
    users.knownUsers = lib.singleton "carson";
    users.users.carson = {
      home = "/Users/carson";
      isHidden = false;
      uid = 501;
      openssh.authorizedKeys.keys = builtins.attrValues self.keys.yubikeys;
    };
  };

  flake.modules.nixos.carson = {
    config,
    lib,
    ...
  }: {
    imports = lib.singleton inputs.hjem.nixosModules.default;

    age.secrets.password.file = ./password.age;
    hjem.users.carson.enable = true;
    users.users.carson = {
      isNormalUser = true;
      extraGroups = lib.singleton "wheel";
      hashedPasswordFile = config.age.secrets.password.path;
      openssh.authorizedKeys.keys = builtins.attrValues self.keys.yubikeys;
    };
  };
}
