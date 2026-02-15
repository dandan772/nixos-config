{ config, lib, pkgs, ... }:

{
  zramSwap = {
    enable = true;

    memoryPercent = 50;

    algorithm = "zstd";

    priority = 100;
  };

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
    "vm.page-cluster" = 0;
  };
}
