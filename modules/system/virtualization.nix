{ config, pkgs, ... }:
{
  # Libvirt with QEMU/KVM
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  # Programs
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice 
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
  ];

  # Optional DNS/DHCP
  services.dnsmasq.enable = true;
  
  # Enable dconf (required for virt-manager)
  programs.dconf.enable = true;
}
