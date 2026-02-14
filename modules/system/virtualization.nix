{ config, pkgs, ... }:

{
  # Habilita libvirtd
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.socketEnable = true;

  # QEMU
  virtualisation.qemu.package = pkgs.qemu;

  # DNS/DHCP se quiser
  services.dnsmasq.enable = true;

  # Programas
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
