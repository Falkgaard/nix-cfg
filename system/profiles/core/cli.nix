{ pkgs, inputs, ... }:
{
   # programs.bat = {
   #   enable       = true;
   #   config.theme = "base16";
   # };
   programs.git.enable      = true;
   programs.tmux.enable     = true;
   programs.neovim.enable   = true;
   programs.yazi.enable     = true;
   programs.starship.enable = true;
   programs.fish = {
      enable = true;
      vendor = {
         completions.enable = true;
         config.enable      = true;
         functions.enable   = true;
      };
   };
   environment.systemPackages = with pkgs; [
      neovim
      fish
      tldr
      wget
      curl
   ];
}