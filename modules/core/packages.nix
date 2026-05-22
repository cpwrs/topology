{
  flake.modules.nixos.core = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.git
      pkgs.wget
      pkgs.zip
      pkgs.unzip
      pkgs.btop
      pkgs.fd
      pkgs.jq
      pkgs.ripgrep
      pkgs.binutils
      pkgs.pciutils
      pkgs.usbutils
      pkgs.vim
      pkgs.psmisc
    ];
  };
}
