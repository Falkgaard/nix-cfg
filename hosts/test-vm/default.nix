/*
TODO: Make a simple config like this possible:

# system-config.nix
{
   role          = "standard";      # optional; defaults to: `"standard"`.
   bootloader    = "grub";          # optional; defaults to: "grub"?
   bootdevice    = "sda";           # mandatory, no default.
   desktop_env   = "kde-plasma-6";  # optional; defaults to: `"minimal`".
   platform      = "x86_64-linux";  # optional; defaults to: `"x86_64-linux"`.
   extraProfiles = [];              # optional; defaults to: `[]`.
   users         = [
      { username = "falk";  }
      { username = "guest"; }
   ];
}
*/

{ pkgs, inputs, ... }:
{
   imports = [
      ./hardware-configuration.nix
      ../../system/roles/home.nix
   ];
   
   networking.hostName = builtins.baseNameOf ./.; # TODO: Find better way?

   # Firewall, SSH, etc (but in profiles/roles)

   system.stateVersion = "24.05"; # Do NOT edit.
}
