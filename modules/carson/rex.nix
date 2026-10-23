{
  flake.modules.nixos.carson = {
    services.rex.loginServer.accounts.carson.principals = [
      "tailscale:cpwrs@github"
    ];
  };
}
