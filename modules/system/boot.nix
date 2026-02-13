{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "iwlwifi.power_save=0" ];

  boot.kernelPackages = pkgs.linuxPackages_6_18;
}
