{ config, pkgs, ... }: {
   home.packages = with pkgs; [ open-vm-tools ];
}
