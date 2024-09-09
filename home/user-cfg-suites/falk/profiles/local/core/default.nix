{ pkgs, config, ... }:
{
   home.programs.firefox.enable = true;
   imports = [ ./stylix.nix ];
}
