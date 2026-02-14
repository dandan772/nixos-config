{ config, pkgs, ... }:

{
  # Ativa o libvirtd no sistema
  virtualisation.libvirtd.enable = true;

  # QEMU para VMs
  virtualisation.qemu.package = pkgs.qemu;

  # DNSMASQ para rede NAT (opcional)
  services.dnsmasq.enable = true;

  # Ferramentas do usuário
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
