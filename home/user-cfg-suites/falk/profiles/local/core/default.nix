{ pkgs, home-manager, ... }:
{
   programs.firefox.enable = true;
   imports = [ ./stylix.nix ];
}
