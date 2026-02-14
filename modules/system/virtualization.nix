{ config, pkgs, ... }:

{
  # Habilita libvirtd
  virtualization.libvirtd.enable = true;
  virtualization.libvirtd.socketEnable = true;

  # QEMU
  virtualization.qemu.package = pkgs.qemu;

  # DNS/DHCP se quiser
  services.dnsmasq.enable = true;

  # Programas
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
