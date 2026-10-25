{ pkgs, lib, ... }:

let
  version = "1.0.1";

  fetchPluginFile = name: hash:
    pkgs.fetchurl {
      url = "https://github.com/greasycat/BetterMathjax/releases/download/${version}/${name}";
      inherit hash;
    };
in
  pkgs.runCommand "obsidian-bettermathjax-${version}" {
    main = fetchPluginFile "main.js" "sha256-FC8JHArcCgG6VSq4l61ucfw+MW0EdTMG5izNMK+SnIM=";
    manifest = fetchPluginFile "manifest.json" "sha256-07Db0ZgSEdhpuRKOPOUb1nxXbKeZF9T1C1nVP16hcxg=";
    styles = fetchPluginFile "styles.css" "sha256-YY1roYqVjz032fqs5U01gVkRp2ID6b+XacsTMLqKYL4=";
  } ''
    mkdir -p "$out"
    cp "$main" "$out/main.js"
    cp "$manifest" "$out/manifest.json"
    cp "$styles" "$out/styles.css"
  ''
