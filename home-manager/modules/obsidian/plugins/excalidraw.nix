{ pkgs }:

let
  version = "2.29.0";

  fetchPluginFile = name: hash:
    pkgs.fetchurl {
      url = "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/download/${version}/${name}";
      inherit hash;
    };
in
  pkgs.runCommand "obsidian-excalidraw-${version}" {
    main = fetchPluginFile "main.js" "sha256-TaIISk6v59MoSE+ldCAEufuZA0bEyE/ekkuIWl7MHBc=";
    manifest = fetchPluginFile "manifest.json" "sha256-SIC4hcUGQ++EjTHOqCl3bKLpZ0c1Ou4zTXHodfedMcA=";
    styles = fetchPluginFile "styles.css" "sha256-Fz6cFhoBxTs8FzNE4CPeTTJ/0GWOR2lhtGsOapMRfe0=";
  } ''
    mkdir -p "$out"
    cp "$main" "$out/main.js"
    cp "$manifest" "$out/manifest.json"
    cp "$styles" "$out/styles.css"
  ''
