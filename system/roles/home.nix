{ pkgs, ... }:
{
   imports = [
      ../profiles/core
      ../profiles/boot/quiet.nix
     #../profiles/boot/grub.nix
     #../profiles/boot/plymouth.nix
      ../profiles/desktop/kde-plasma6.nix
      ../profiles/general/audio.nix
   ];
}
