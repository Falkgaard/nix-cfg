{ pkgs, config, ... }:
{
   programs.firefox.enable = true;
   imports = [ ./stylix.nix ];
}
