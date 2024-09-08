{ pkgs, config, lib, ... }:
{
   time.timeZone            = "Europe/Malta";
   i18n.defaultLocale       = "en_US.UTF-8";
   i18n.extraLocaleSettings = {
      LC_ADDRESS               = "en_DK.UTF-8";
      LC_IDENTIFICATION        = "en_DK.UTF-8";
      LC_MEASUREMENT           = "en_DK.UTF-8";
      LC_MONETARY              = "en_DK.UTF-8";
      LC_NAME                  = "en_DK.UTF-8";
      LC_NUMERIC               = "en_DK.UTF-8";
      LC_PAPER                 = "en_DK.UTF-8";
      LC_TELEPHONE             = "en_DK.UTF-8";
      LC_TIME                  = "en_DK.UTF-8";
   };

   # Configure keyboard:
   console.keyMap = lib.mkForce "sv-latin1";
   services.xserver.xkb = {
      layout  = "se";
      variant = "";
   };
}
