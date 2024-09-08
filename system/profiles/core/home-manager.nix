{ pkgs, inputs, system-lib, config, ... }:
let
   hostName     = config.system.name;
in {
   imports      = [ inputs.home-manager.nixosModules.default ];

   home-manager = {
      backupFileExtension = "hm-backup";
      extraSpecialArgs    = { inherit inputs; };
      useUserPackages     = true;
      useGlobalPkgs       = true;
      users               = builtins.listToAttrs
         (system-lib.forEachHostUser /*of*/ hostName /*do:*/
             (hostUserName:
               {
                  name  = hostUserName;
                  value = import ../../../home/user-cfg-suites/${hostUserName}/user-cfg-instances/${hostName}.nix;
               }
            )
         );
   };
}
