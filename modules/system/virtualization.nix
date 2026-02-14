{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.socketEnable = true;

  services.dnsmasq.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
  ];
}
