{ config, pkgs, ... }:

{
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    # Launcher
    fuzzel

    # Terminal
    alacritty

    # Status bar
    waybar

    # Notificações
    mako

    # Clipboard
    wl-clipboard

    # Screenshot
    grim
    slurp

    # File manager
    xfce.thunar

    # Audio
    pavucontrol

    # Network tray
    networkmanagerapplet

    # Portal (ESSENCIAL)
    xdg-desktop-portal-wlr
  ];

}
