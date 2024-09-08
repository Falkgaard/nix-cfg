{ pkgs, configs, ... }: {
   programs.starship = {
      enable                = true;
      enableFishIntegration = true;
      settings              = { /*TODO*/ };
   };
}
