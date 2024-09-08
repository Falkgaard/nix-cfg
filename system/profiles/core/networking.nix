{ pkgs, config, ... }:
{
   #networking.hostName             = config.system.name;
   networking.networkmanager.enable = true;
}
