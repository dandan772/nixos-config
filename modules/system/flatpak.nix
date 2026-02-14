{ config, pkgs, ... }:

let
  desiredFlatpaks = [
    "org.onlyoffice.desktopeditors"
    # adiciona outros aqui
    # "com.discordapp.Discord"
    # "org.mozilla.firefox"
  ];
in
{
  # Habilita flatpak no sistema
  services.flatpak.enable = true;

  # Script declarativo
  system.userActivationScripts.flatpakManagement = {
    text = ''
      echo "==== Flatpak Declarative Sync ===="

      # Garantir flathub
      ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo

      # Lista instalados
      installed=$(${pkgs.flatpak}/bin/flatpak list --app --columns=application)

      # Remove o que não está declarado
      for app in $installed; do
        if ! echo "${toString desiredFlatpaks}" | ${pkgs.gnugrep}/bin/grep -q "$app"; then
          echo "Removendo $app (não declarado)"
          ${pkgs.flatpak}/bin/flatpak uninstall -y --noninteractive "$app"
        fi
      done

      # Instala os declarados
      for app in ${toString desiredFlatpaks}; do
        echo "Garantindo instalação de $app"
        ${pkgs.flatpak}/bin/flatpak install -y flathub "$app"
      done

      # Limpa dependências
      ${pkgs.flatpak}/bin/flatpak uninstall --unused -y

      # Atualiza tudo
      ${pkgs.flatpak}/bin/flatpak update -y
    '';
  };
}
