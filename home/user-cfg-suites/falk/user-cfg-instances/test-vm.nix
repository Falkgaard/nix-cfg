{ config, pkgs, lib, ... }:
let
   username = "falk"; # TODO: Not fond of hard-coding this here... find a better solution.
in {
   imports = [
      ../profiles/global/workflows/graphics
      ../profiles/local/desktop/hyprland.nix
      ../profiles/local/general/home
      ../profiles/local/general/media
      ../profiles/local/workflows/terminal
      ../profiles/local/workflows/coding
   ];
   
   home = { # TODO: move into core profile? Also, use XDG
      username       = username;
      homeDirectory  = lib.mkDefault "/home/${username}";
      stateVersion   = "24.05"; # Do NOT edit.
   };
}
