{ pkgs, ... }:
{
   console = {
      font         = "ter-132n";
      packages     = [pkgs.terminus_font];
      useXkbConfig = true;
      earlySetup   = false;
   };
 
   boot = {
      consoleLogLevel = 0;
      initrd.verbose  = false;
      plymouth.enable = true;
      kernelParams    = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "i915.fastboot=1"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
      loader = {
         timeout                  = lib.mkDefault 0;
         efi.canTouchEfiVariables = true;
         systemd-boot = {
            enable             = true;
            editor             = false;
            configurationLimit = 3;
         };
      };
   };
}

