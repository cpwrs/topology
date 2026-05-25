{
  config,
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.installer = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = with config.flake.modules.nixos; [
      installer
      iso
    ];
  };

  flake.modules.nixos.installer = {lib, ...}: {
    users.users.root.openssh.authorizedKeys.keys = builtins.attrValues self.keys.yubikeys;

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
