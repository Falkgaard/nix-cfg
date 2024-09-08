{ pkgs, config, ... }:
{
   home.packages = with pkgs; [
      tree
      tldr
      bat
   ];
}
