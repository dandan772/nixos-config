{ config, pkgs, ... }:

{
  # Libvirt
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.socketEnable = true;

  # DNS/DHCP
  services.dnsmasq.enable = true;

  # Programas
  environment.systemPackages = with pkgs; [
    virt-manager   # GUI pra gerenciar VMs
    qemu           # Máquina virtual em si
    libvirt        # Biblioteca necessária pro virt-manager
  ];

  # Permite que usuários do grupo 'libvirt' usem KVM sem sudo
  users.groups.libvirt = {};
}
