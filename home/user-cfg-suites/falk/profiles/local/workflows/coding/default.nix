{ pkgs, config, ... }:
{
   imports = [ ../terminal ]; # For neovim and more.

   programs.vscode = {
      enable                     = true;
      enableUpdateCheck          = true;
      enableExtensionUpdateCheck = true;
      #extensions                = [ pkgs.vscode-extensions.TODO.nix ];
      #userSettings              = TODO!
      #keybindings               = TODO?
      #mutableExtensionDir       = TODO?
      #globalSnippets            = TODO?
      #languageSnippets          = TODO?
      #userTasks                 = TODO?
   };

   home.packages = with pkgs; [];
}
