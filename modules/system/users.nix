{ pkgs, ... }:

{
  users.users.dan = {
    isNormalUser = true;
    description = "Dan";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}
