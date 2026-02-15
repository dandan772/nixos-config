{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;


  programs.firefox.enable = true;
  
  environment.systemPackages = with pkgs; [
    ryzenadj
    davinci-resolve-studio   
 clinfo 
  ];


hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
];

}
