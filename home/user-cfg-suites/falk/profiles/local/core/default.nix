{ pkgs, home-manager, ... }:
{
   home.programs.firefox.enable = true;
   imports = [ ./stylix.nix ];
}
