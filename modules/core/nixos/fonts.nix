{
  flake.modules.nixos.core = {
    lib,
    pkgs,
    ...
  }: {
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
          serif = lib.singleton "DejaVu Serif";
          sansSerif = lib.singleton "DejaVu Sans";
          monospace = lib.singleton "JetBrainsMono Nerd Font";
          emoji = lib.singleton "Noto Color Emoji";
        };
      };
    };

    console = {
      earlySetup = true;
      font = "Lat2-Terminus16";
      packages = lib.singleton pkgs.terminus_font;
    };
  };
}
