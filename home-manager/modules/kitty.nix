{lib , ... }: {
  programs.kitty = {
		enable = true;
		
		shellIntegration.enableFishIntegration = true;
		
		settings = {
			font_size = "9";
			background_opacity = lib.mkForce "0.98";
			
			hide_window_decorations = true;

			cursor_shape = "beam";
			cursor_trail = 1;

			window_margin = 22;

			confirm_os_window_close = 0;

			shell = "fish";
		};
		
	};
}
