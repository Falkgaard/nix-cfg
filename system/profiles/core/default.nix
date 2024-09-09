{ pkgs, config, ... }:
{
   programs.nix-ld.enable             = true;
   nixpkgs.config.allowUnfree         = true;
   nix.settings.experimental-features = [ "nix-command" "flakes" ];
   services.printing.enable           = true; # Might as well, right?

   #programs.firefox.enable = true; # Why can't I do this in home?

   imports = [
      ./cli.nix
      ./home-manager.nix
      ./locale.nix # TODO: Consider moving out of core (in case I ever want different locales for different systems)
      ./networking.nix
      ./nix.nix
      ./stylix.nix
      ./users.nix
   ];
}
