# modules/system/virtualization.nix
{ config, pkgs, ... }:

{
  # Libvirt
  services.libvirtd.enable = true;
  services.libvirtd.socketEnable = true;

  # QEMU/KVM
  virtualisation = {
    qemu.package = pkgs.qemu;
  };

  # DNS/DHCP se quiser
  services.dnsmasq.enable = true;

  # Programas pro usuário
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
