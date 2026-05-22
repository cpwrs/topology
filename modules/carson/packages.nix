{inputs, ...}: {
  flake.modules.nixos.carson = {pkgs, ...}: {
    users.users.carson.packages = [
      pkgs.opencode
      pkgs.gdb
      pkgs.python3
      pkgs.nmap
      pkgs.devenv
      pkgs.kicad-small
      pkgs.d-spy
      pkgs.fzf
      pkgs.hotspot
      inputs.helium.packages.${pkgs.system}.default
      pkgs.zathura
      pkgs.obs-studio
      pkgs.obsidian
      pkgs.thunderbird
      pkgs.wireshark
      pkgs.gimp
    ];
  };

  flake.modules.darwin.carson = {pkgs, ...}: {
    users.users.carson.packages = [
      pkgs.opencode
      pkgs.gdb
      pkgs.python3
      pkgs.nmap
      pkgs.devenv
      pkgs.fzf
      inputs.helium.packages.${pkgs.system}.default
    ];

    homebrew.casks = [
      "kicad"
      "obsidian"
      "thunderbird"
      "wireshark"
    ];
  };
}
