{ config, pkgs, ... }:

{
  # Libvirt
  virtualisation.libvirtd.enable = true;

  # QEMU
  virtualisation.qemu.package = pkgs.qemu;

  # DNS/DHCP se quiser
  services.dnsmasq.enable = true;

  # Programas
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
