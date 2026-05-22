{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.iso = {
    config,
    lib,
    ...
  }: {
    imports = lib.singleton "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix";
    isoImage.makeEfiBootable = true;
    isoImage.makeUsbBootable = true;
    isoImage.storeContents = lib.singleton config.system.build.toplevel;

    hardware = {
      enableAllHardware = true;
      enableAllFirmware = true;
    };

    users.users.root = {
      initialHashedPassword = "";
      openssh.authorizedKeys.keys = builtins.attrValues self.keys.yubikeys;
    };
    services.getty.autologinUser = "root";

    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "prohibit-password";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    networking.firewall.allowedTCPPorts = lib.singleton 22;
  };
}
