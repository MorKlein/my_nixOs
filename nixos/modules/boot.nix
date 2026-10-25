{
  boot.loader = {
  	systemd-boot.enable = false;

  	efi.canTouchEfiVariables = true;

	timeout = 5;

    	grub = {
      		enable = true;
      		efiSupport = true;
      		devices = [ "nodev" ];
      		useOSProber = true;
      		default = "saved";
    		};

	};
}
