{ config, pkgs, ... }:

{
  # Libvirt
  virtualisation.libvirtd.enable = true;

  # DNS/DHCP se quiser
  services.dnsmasq.enable = true;

  # Programas que você quer ter no sistema
  environment.systemPackages = with pkgs; [
    virt-manager
    qemu      # opcional, mas não como parte do módulo virtualisation
  ];
}
