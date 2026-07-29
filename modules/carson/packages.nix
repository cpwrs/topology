{inputs, ...}: {
  flake.modules.nixos.carson = {pkgs, ...}: {
    users.users.carson.packages = [
      pkgs.gdb
      pkgs.python3
      pkgs.nmap
      pkgs.dig
      pkgs.openssl
      pkgs.tcpdump
      pkgs.traceroute
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
      pkgs.anki
    ];
  };

  flake.modules.darwin.carson = {pkgs, ...}: {
    users.users.carson.packages = [
      pkgs.gdb
      pkgs.python3
      pkgs.nmap
      pkgs.devenv
      pkgs.fzf
      pkgs.anki
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
