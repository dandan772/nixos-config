final: prev:
let
  originalResolve = prev.davinci-resolve-studio;

  bash = prev.bash;
  writeText = prev.writeText;
  xkeyboard_config = prev.xkeyboard_config;
  perl = prev.perl;

  patches = [
    { old = ''\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B''; new = ''\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B''; }
    { old = ''\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00''; new = ''\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00''; }
    { old = ''\x41\xb6\x01\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00''; new = ''\x41\xb6\x00\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00''; }
  ];

  perlSubs =
    let lib = prev.lib;
    in lib.concatStringsSep ";" (lib.map (p: ''s|${p.old}|${p.new}|g'') patches);

in {
  davinci-resolve-studio = originalResolve.override (old: {
    buildFHSEnv = fhs:
      let
        davinci = fhs.passthru.davinci.overrideAttrs (innerOld: {
          __intentionallyOverridingVersion = true;
          version = innerOld.version + "-custom-patched-v1";

          nativeBuildInputs = (innerOld.nativeBuildInputs or []) ++ [ perl ];

          postFixup = ''
            ${innerOld.postFixup or ""}

            echo "Applying binary patches to Resolve binaries..."
            patch_if_exists() {
              local f="$1"
              if [ -f "$f" ]; then
                echo "Patching $f"
                ${perl}/bin/perl -0777 -Mbytes -pe '${perlSubs}' "$f" > "$f.patched" || {
                  echo "ERROR: Patch failed for $f"
                  exit 1
                }
                if [ ! -s "$f.patched" ]; then
                  echo "ERROR: Patch produced empty output for $f"
                  exit 1
                fi
                mv "$f.patched" "$f"
                chmod +x "$f" || true
              else
                echo "Skip: $f not found"
              fi
            }

            patch_if_exists "$out/bin/resolve"
            patch_if_exists "$out/opt/resolve/bin/resolve"

            echo "Binary patching complete."
            echo "Installing license file…"
            mkdir -p $out/.license
            cat > $out/.license/blackmagic.lic <<'EOF'
LICENSE blackmagic davinciresolvestudio 999999 permanent uncounted
hostid=ANY issuer=CGP customer=CGP issued=28-dec-2023
akey=0000-0000-0000-0000 _ck=00 sig="00"
EOF
          '';
        });
      in
      old.buildFHSEnv (fhs // {
        extraBwrapArgs = [];
        runScript = "${bash}/bin/bash ${writeText "davinci-wrapper" ''
          export QT_XKB_CONFIG_ROOT="${xkeyboard_config}/share/X11/xkb"
          export QT_PLUGIN_PATH="${davinci}/libs/plugins:$QT_PLUGIN_PATH"
          export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/lib32:${davinci}/libs
          unset QT_QPA_PLATFORM

          export __NV_PRIME_RENDER_OFFLOAD=1
          export __GLX_VENDOR_LIBRARY_NAME=nvidia

          ${davinci}/bin/resolve
        ''}";
        extraInstallCommands = ''
          mkdir -p $out/share/applications $out/share/icons/hicolor/128x128/apps
          ln -s ${davinci}/share/applications/*.desktop $out/share/applications/
          ln -s ${davinci}/graphics/DV_Resolve.png $out/share/icons/hicolor/128x128/apps/davinci-resolve-studio.png
        '';
        passthru = { inherit davinci; };
      });
  });
}
