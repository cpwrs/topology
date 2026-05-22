{
  flake.modules.nixos.graphical-shell = {pkgs, ...}: {
    environment = {
      systemPackages = [
        pkgs.quickshell
        pkgs.bibata-cursors
      ];
    };
  };
}
