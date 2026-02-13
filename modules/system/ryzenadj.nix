{ config, pkgs, ... }:

{
  systemd.services.ryzenadj = {
    description = "RyzenAdj TDP Limit";
    after = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.ryzenadj}/bin/ryzenadj -f 85";
      RemainAfterExit = true;
    };
    wantedBy = [ "multi-user.target" ];
  };
}
