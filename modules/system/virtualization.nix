{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;

  virtualisation.qemu.package = pkgs.qemu;

  networking.dnsmasq.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
