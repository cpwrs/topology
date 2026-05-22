{
  flake.modules.nixos.core = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.man-pages
      pkgs.man-pages-posix
    ];

    documentation = {
      man.enable = true;
      man.cache.generateAtRuntime = true;
      doc.enable = false;
      info.enable = false;
      nixos.enable = false;
    };
  };

  flake.modules.darwin.core = {
    lib,
    pkgs,
    ...
  }: {
    environment.systemPackages = lib.singleton pkgs.man-pages-posix;

    documentation = {
      man.enable = true;
      doc.enable = false;
      info.enable = false;
    };
  };
}
