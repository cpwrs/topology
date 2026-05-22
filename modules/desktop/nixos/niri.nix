{
  flake.modules.nixos.niri = {
    lib,
    pkgs,
    ...
  }: {
    environment = {
      systemPackages = [
        pkgs.niri
        pkgs.xwayland-satellite
        pkgs.wl-clipboard
      ];
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
    };

    xdg.portal.configPackages = lib.singleton pkgs.niri;

    services.displayManager = {
      sessionPackages = lib.singleton pkgs.niri;
      defaultSession = "niri";
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
