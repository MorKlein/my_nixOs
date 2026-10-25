{ pkgs, user, ... }: {

  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "astronaut";
    })
  ];

  services = {
	xserver = {

	  enable = true;

	  displayManager.setupCommands = ''
	    ${pkgs.xrandr}/bin/xrandr \
	      --output DP-1 --auto --primary \
	      --output HDMI-1 --off
	  '';
	};

	sing-box.enable = true;
	
	displayManager.sddm = {
		enable = true;
		# Experimental
		wayland.enable = false;

		package = pkgs.kdePackages.sddm;
		extraPackages = with pkgs; [
		  kdePackages.qtmultimedia # Video backgrounds/audio
		];
		theme = "sddm-astronaut-theme";
	};
  };
}
