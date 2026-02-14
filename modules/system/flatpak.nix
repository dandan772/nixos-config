{ config, pkgs, ... }:

let
  desiredFlatpaks = [
#    "org.onlyoffice.desktopeditors"
 #   "com.discordapp.Discord"
  ];
in
{
  services.flatpak.enable = true;

  system.userActivationScripts.flatpakManagement = {
    text = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo

      installed=$(${pkgs.flatpak}/bin/flatpak list --app --columns=application)

      for app in $installed; do
        if ! echo "${toString desiredFlatpaks}" | ${pkgs.gnugrep}/bin/grep -q "$app"; then
          ${pkgs.flatpak}/bin/flatpak uninstall -y --noninteractive "$app"
        fi
      done

      for app in ${toString desiredFlatpaks}; do
        ${pkgs.flatpak}/bin/flatpak install -y flathub "$app"
      done

      ${pkgs.flatpak}/bin/flatpak uninstall --unused -y
      ${pkgs.flatpak}/bin/flatpak update -y
    '';
  };
}
