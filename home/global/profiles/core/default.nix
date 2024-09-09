{ config, pkgs, inputs, ... }: {
   home.packages = with pkgs; [ open-vm-tools ];
   wayland.windowManager.hyprland = {
      # set the flake package
      #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
   };
}
