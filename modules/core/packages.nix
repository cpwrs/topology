let
  packages = {
    pkgs,
    lib,
    ...
  }: {
    environment.systemPackages =
      [
        pkgs.git
        pkgs.wget
        pkgs.zip
        pkgs.unzip
        pkgs.btop
        pkgs.fd
        pkgs.jq
        pkgs.ripgrep
        pkgs.vim
      ]
      ++ lib.optionals pkgs.stdenv.isLinux [
        pkgs.binutils
        pkgs.pciutils
        pkgs.usbutils
        pkgs.psmisc
      ];
  };
in {
  flake.modules.nixos.core = packages;
  flake.modules.darwin.core = packages;
}
