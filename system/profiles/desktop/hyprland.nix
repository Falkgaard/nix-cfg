{ pkgs, inputs, ... }:
{
   programs.hyprland = {
      enable          = true;
      xwayland.enable = true;
   };

   environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL          = "1";
   };

   hardware = {
      graphics.enable           = true;
      nvidia.modesetting.enable = true; # TODO: What if AMD..?
   };

   xdg.portal = {
      enable       = true;
      extraPortals = with pkgs; [
         xdg-desktop-portal-gtk
         xdg-desktop-portal-hyprland
         kdePackages.xdg-desktop-portal-kde
      ];
   };

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
