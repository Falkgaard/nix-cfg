{ config, pkgs, lib, ... }:
let
   username = "guest"; # TODO: Not fond of hard-coding this here... find a better solution.
in {
   imports = [];

   home = { # TODO: move into core profile? Also, use XDG
      username       = username;
      homeDirectory  = lib.mkDefault "/home/${username}";
      stateVersion   = "24.05"; # Do NOT edit.
   };
}
