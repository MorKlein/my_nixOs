{ pkgs, lib, ... }:

let
  version = "*version*";

  fetchPluginFile = name: hash:
    pkgs.fetchurl {
      url = "*path*${version}/${name}";
      inherit hash;
    };
in
  pkgs.runCommand "obsidian-*plugin-name*-${version}" {
    main = fetchPluginFile "main.js" lib.fakeHash;
    manifest = fetchPluginFile "manifest.json" lib.fakeHash;
    styles = fetchPluginFile "styles.css" lib.fakeHash;
  } ''
    mkdir -p "$out"
    cp "$main" "$out/main.js"
    cp "$manifest" "$out/manifest.json"
    cp "$styles" "$out/styles.css"
  ''
