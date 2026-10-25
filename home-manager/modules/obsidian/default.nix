{ pkgs, ... }:

let
  excalidrawPlugin = pkgs.callPackage ./plugins/excalidraw.nix {};
  dataviewPlugin = pkgs.callPackage ./plugins/dataview.nix {};
  bettermathjaxPlugin = pkgs.callPackage ./plugins/bettermathjax.nix {};
in
{
  programs.obsidian = {
    enable = true;

    defaultSettings.communityPlugins = [
      excalidrawPlugin
      dataviewPlugin
      bettermathjaxPlugin
    ];

    vaults.para.target = "para";
  };
}
