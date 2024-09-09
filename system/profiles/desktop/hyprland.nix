{ pkgs, inputs, ... }:
{
   programs.hyprland.enable = true; 
   /*{
      wayland.windowManager.hyprland = {
      enable  = true;
      # set the flake package
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
   };*/
}

   # imports = [
   #    ./monitors.nix
   #    ./keymaps.nix
   # ];
   
   #options = {
   #   hyprlandExtra  = lib.mkOption {
   #      default     = "";
   #      description = ''
   #         Extra Hyprland config lines.
   #      '';
   #   };
   #}; 
