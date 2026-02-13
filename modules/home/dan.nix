{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";

  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting
    '';
  };

  home.packages = with pkgs; [
    git
  ];
}
