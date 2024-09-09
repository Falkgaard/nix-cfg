{ pkgs, home-manager, ... }:
{

   config.programs.firefox.enable = true;
   imports = [ ./stylix.nix ];
}
