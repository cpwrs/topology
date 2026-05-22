{
  flake.modules.nixos.core = {
    users = {
      mutableUsers = false;
      users.root.hashedPassword = "!";
    };
  };
}
