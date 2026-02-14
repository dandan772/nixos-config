{ config, pkgs, ... }:

{
  virtualization.libvirtd.enable = true;
  virtualization.libvirtd.socketEnable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
  ];

  services.dnsmasq.enable = true;
}
