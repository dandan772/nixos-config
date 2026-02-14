{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;

  services.dnsmasq.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
  ];
}
