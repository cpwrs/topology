{
  flake.modules.nixos.core = {...}: {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };
  };

  flake.modules.darwin.core = {
    services.openssh.enable = true;
  };
}
