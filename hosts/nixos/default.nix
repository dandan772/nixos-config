{
  imports = [
    ./hardware-configuration.nix

    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/locale.nix
    ../../modules/system/audio.nix
    ../../modules/system/users.nix
    ../../modules/system/packages.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/nix.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/ryzenadj.nix
    ../../modules/system/virtualization.nix
    ../../modules/system/flatpak.nix
    ../../modules/system/niri.nix

    ../../modules/system/gnome-base.nix
    ../../modules/system/display-manager.nix
  ];

  system.stateVersion = "25.11";
}
