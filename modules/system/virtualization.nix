{ config, pkgs, ... }:

{
  # Libvirt
  virtualisation.libvirtd.enable = true;

  # Programas pro sistema
  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
    libvirt
  ];

  # DNS/DHCP opcional
  services.dnsmasq.enable = true;
}
