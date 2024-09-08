{ pkgs, inputs, ... }:
{
   boot.loader.grub = {
     enable      = true;
     device      = "/dev/sda"; # TODO: Make into a variable to set in host config.
     useOSProber = true;
     efiSupport  = false;
    #gfxmodeEfi  = "auto";
     gfxmodeBios = "2560x1600";
    #font        = ;
    #fontSize    = ;
    #theme       = ;
   };
   #boot.loader.efi.canTouchEfiVariables = true;
}
