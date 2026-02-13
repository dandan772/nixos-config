{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 2;
  boot.loader.systemd-boot.extraInstallCommands = ''
      echo "default auto-windows" >> /boot/loader/loader.conf
  '';
  
  boot.kernelPackages = pkgs.linuxPackages_6_18;
}
