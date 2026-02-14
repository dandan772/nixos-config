{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      # A opção ovmf.enable foi removida aqui, pois agora é padrão.
    };
  };

  services.dnsmasq.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
