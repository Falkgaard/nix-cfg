{
   description = "Falk's Omni-Config";

   inputs = {
      nixpkgs.url  = "github:nixos/nixpkgs/nixos-unstable";
      stylix.url   = "github:danth/stylix";
      home-manager = {
         url                    = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs";
      };
      hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
   };

   outputs = inputs@{ self, nixpkgs, stylix, home-manager, hyprland,  ... }:
   let
      inherit (self) outputs;
      system-lib = import ./libraries/system.nix { inherit inputs outputs; };
      lib        = nixpkgs.lib // home-manager.lib;
   in {
      inherit lib;
      inherit system-lib;

      # nixosModules       = ...;
      # homeManagerModules = ...;
      # packages           = ...;

      nixosConfigurations = system-lib.mkHostSystems;
      homeConfigurations  = system-lib.mkUserHomes;
   };
}
