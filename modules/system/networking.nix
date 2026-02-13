{ ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager = {
    enable = true;
    settings = {
      connection = {
        "wifi.powersave" = 2;
      };
    };
  };
}
