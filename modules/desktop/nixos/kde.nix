{inputs, ...}: {
  flake.modules.nixos.kde = {pkgs, ...}: {
    imports = [inputs.qtengine.nixosModules.default];
    programs.qtengine = {
      enable = true;

      config = {
        theme = {
          colorScheme = "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeLight.colors";
          iconTheme = "breeze";
          style = "breeze";
          fontFixed.family = "Berkeley Mono SemiCondensed";
          fontFixed.size = 12;
          font.family = "Inter";
          font.size = 12;
        };

        misc = {
          singleClickActivate = false;
          menusHaveIcons = true;
          shortcutsForContextMenus = true;
        };
      };
    };

    qt = {
      enable = true;
      platformTheme = null;
    };

    security.polkit.enable = true;
    systemd = {
      user.services.polkit-agent = {
        wants = ["graphical-session.target"];
        wantedBy = ["graphical-session.target"];
        after = ["graphical-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };

    environment = {
      systemPackages = [
        pkgs.qt6.qtwayland
        pkgs.qt6.qtsvg
        pkgs.kdePackages.breeze
        pkgs.kdePackages.breeze.qt5
        pkgs.kdePackages.breeze-icons
        pkgs.kdePackages.dolphin
        pkgs.kdePackages.okular
        pkgs.kdePackages.filelight
      ];
    };

    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = ["kde"];
          "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        };
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.kdePackages.xdg-desktop-portal-kde
      ];
      xdgOpenUsePortal = true;
    };
  };
}
