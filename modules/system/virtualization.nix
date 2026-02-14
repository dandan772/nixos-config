{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true; # Garante permissões de escrita em dispositivos de bloco
      swtpm.enable = true; # Útil para Windows 11 (TPM)
      ovmf.enable = true;  # Habilita suporte a UEFI
    };
  };

  # Opcional: Útil para redes de VMs
  services.dnsmasq.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
