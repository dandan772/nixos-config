{ pkgs, ... }:

{
  users.users.dan = {
    isNormalUser = true;
    description = "Dan";
    extraGroups = [ "kvm" "libvirt" "networkmanager" "wheel" ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };
}
