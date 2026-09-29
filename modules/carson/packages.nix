{inputs, ...}: {
  flake.modules.nixos.carson = {pkgs, ...}: {
    programs.wireshark.enable = true;
    users.users.carson = {
      extraGroups = ["wireshark"];
      packages = [
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
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
        pkgs.zathura
        pkgs.obs-studio
        pkgs.obsidian
        pkgs.thunderbird
        pkgs.wireshark
        pkgs.gimp
        pkgs.anki
      ];
    };
  };

  flake.modules.darwin.carson = {pkgs, ...}: {
    users.groups.access_bpf.members = ["carson"];
    users.users.carson.packages = [
      pkgs.gdb
      pkgs.python3
      pkgs.nmap
      pkgs.devenv
      pkgs.fzf
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    homebrew.casks = [
      "anki"
      "kicad"
      "obsidian"
      "thunderbird"
      "wireshark"
    ];
  };
}
