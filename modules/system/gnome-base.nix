{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    geary
    gnome-music
    gnome-photos
    gnome-tour
    gnome-weather
    gnome-contacts
    gnome-maps
    gnome-software
  ];
}
