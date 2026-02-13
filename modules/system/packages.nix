{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    fish
    git
  ];
}
