# topology

A nix flake that outputs my OS configurations.
Mostly following the [dendritic](https://github.com/mightyiam/dendritic) pattern using [flake-parts](https://flake.parts) as my top level configuration and entry point.


## Bootstrapping a new NixOS
- Flash the following ISO image to a USB drive and boot from it:  
  `nix build .#nixosConfigurations.installer.config.system.build.isoImage`
- SSH in from any other topology host
- Partition, format, and mount the disk of the new machine:  
`sudo disko --mode destroy,format,mount --flake .#hostname`
- Generate host and user SSH keys, place and permit them in the mounted filesystem, and add them to `./modules/keys.nix` to become age recipients. This is required before install because root has no password and user hashed password files are age encrypted.
- Rekey all age secrets from an existing topology host: `agenix -r`
- Copy the nixos-facter report to the new host directory:  
`sudo nixos-facter > ./modules/hosts/hostname/facter.json`
- `sudo nixos-install --flake .#hostname`
