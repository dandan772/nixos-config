{ pkgs, ... }:

{
  users.users.dan = {
    isNormalUser = true;
    description = "Dan";
    extraGroups = [ "libvirt" "networkmanager" "wheel" ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
