{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;


  home.packages = 
  	let
		unstable = inputs.unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system};
	in
  with pkgs; [
    # Packages in each category are sorted alphabetically

    # Desktop apps
    anki
    code-cursor
    imv
    mpv
    obs-studio
    obsidian
    pavucontrol
    telegram-desktop
    vesktop
    spotify

    # Games
    osu-lazer-bin
    steam

    # CLI utils
    bc
    bottom
    brightnessctl
    cliphist
    ffmpeg
    ffmpegthumbnailer
    fzf
    git-graph
    htop
    hyprpicker
    ntfs3g
    mediainfo
    microfetch
    fastfetch
    playerctl
    ripgrep
    showmethekey
    silicon
    udisks
    ueberzugpp
    unzip
    w3m
    wget
    wl-clipboard
    wtype
    yt-dlp
    zip
    unstable.codex
    lsd

    # Coding stuff
    jdk25
    nodejs
    python313

    # WM stuff
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xwayland-satellite

    # Other
    bemoji
    nix-prefetch-scripts
    sing-box
    bubblewrap
  ];
}
