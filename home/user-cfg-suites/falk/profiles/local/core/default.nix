{ pkgs, config, ... }:
{
   home.packages = [ firefox ];
   imports       = [ ./stylix.nix ];
}
