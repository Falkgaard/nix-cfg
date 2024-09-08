{ pkgs, config, ... }:
{
   home.packages = with pkgs; [
      mpv
      svp
   ];
}
