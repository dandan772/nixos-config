{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;

  virtualisation.qemu.package = pkgs.qemu;

  services.dnsmasq.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
