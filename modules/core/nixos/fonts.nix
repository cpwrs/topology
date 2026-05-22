{
  flake.modules.nixos.core = {pkgs, ...}: {
    fonts = {
      packages = [
        pkgs.dejavu_fonts
        pkgs.inter
        pkgs.nerd-fonts.jetbrains-mono

        pkgs.noto-fonts
        pkgs.noto-fonts-cjk-sans
        pkgs.noto-fonts-lgc-plus
        pkgs.noto-fonts-color-emoji
      ];

      fontconfig = {
        defaultFonts = {
          serif = ["DejaVu Serif"];
          sansSerif = ["DejaVu Sans"];
          monospace = ["JetBrainsMono Nerd Font"];
          emoji = ["Noto Color Emoji"];
        };
      };
    };

    console = {
      earlySetup = true;
      font = "Lat2-Terminus16";
      packages = [pkgs.terminus_font];
    };
  };
}
