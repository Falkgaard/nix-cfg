{ pkgs, inputs, ... }:
{
   boot.plymouth = {
      enable         = true;
      #themePackages = [];
      #theme          = "breeze"; #bgrt
      #logo           = ../../resources/images/NixOS.png;
      #font           = "?";
   };
}
