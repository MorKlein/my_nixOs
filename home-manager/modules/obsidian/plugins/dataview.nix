{ pkgs, lib, ... }:

let
  version = "0.5.70";

  fetchPluginFile = name: hash:
    pkgs.fetchurl {
      url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/${version}/${name}";
      inherit hash;
    };
in
  pkgs.runCommand "obsidian-dataview-${version}" {
    main = fetchPluginFile "main.js" "sha256-a7HPcBCvrYMOc1dfyg4r+9MnnFYuPZ0k8tL0UWHrfQA=";
    manifest = fetchPluginFile "manifest.json" "sha256-kjXbRxEtqBuFWRx57LmuJXTl5yIHBW6XZHL5BhYoYYU=";
    styles = fetchPluginFile "styles.css" "sha256-MwbdkDLgD5ibpyM6N/0lW8TT9DQM7mYXYulS8/aqHek="; 
  } ''
    mkdir -p "$out"
    cp "$main" "$out/main.js"
    cp "$manifest" "$out/manifest.json"
    cp "$styles" "$out/styles.css"
  ''
