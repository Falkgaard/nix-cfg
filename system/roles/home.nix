{ pkgs, ... }:
{
   imports = [
      ../profiles/core
     #../profiles/boot/quiet.nix (Not working out as I had hoped...)
      ../profiles/boot/grub.nix
     #../profiles/boot/plymouth.nix (Kinda disappointing.)
      ../profiles/desktop/kde-plasma6.nix
      ../profiles/desktop/hyprland.nix
      ../profiles/general/audio.nix
   ];
}
