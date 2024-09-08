{ pkgs, config, ... }:
{
   home.packages = with pkgs; [
      krita
      blender
      libresprite
      imagemagick
   ];
}
