{
  config,
  inputs,
  ...
}: {
  flake.nixosConfigurations.surface = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.modules.nixos; [
      surface
      core
      carson
      desktop
    ];
  };

  flake.modules.nixos.surface = {...}: {
    networking.hostName = "surface";
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.11";
    time.timeZone = "America/Chicago";

    services.brightness.enable = true;
    services.evremap = {
      enable = true;
      settings = {
        device_name = "Microsoft Surface Keyboard";
        phys = "usb-0000:00:14.0-1.3/input0";
        dual_role = [
          {
            input = "KEY_CAPSLOCK";
            hold = ["KEY_LEFTCTRL"];
            tap = ["KEY_ESC"];
          }
        ];
      };
    };
  };
}
