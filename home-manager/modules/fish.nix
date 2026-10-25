{
		programs.fish = {
		enable = true;

		shellAliases = 
			let 
				flakeDir = "~/flake";
			in {
				nr = "sudo nvim ${flakeDir}/home-manager/modules/niri/cfg/rules.kdl";
				niri-cfg = "cd ${flakeDir}/home-manager/modules/niri/cfg";
				fish-cfg = "sudo nvim ${flakeDir}/home-manager/modules/fish.nix";

				ls = "eza";
				l = "ls -l";
				la = "ls -a";
				lla = "ls -la";
				lt = "ls --tree";
				cat = "bat";
				c = "clear";
				nv = "nvim";
				shutdown = "shutdown now";
				ff = "clear && fastfetch";

				tmx = "tmux new -As";

				sw = "nh os switch";
       				upd = "nh os switch --update";
        			hms = "nh home switch";

        			pkgs = "sudo nvim ${flakeDir}/home-manager/home-packages.nix";

        			r = "ranger";
        			v = "nvim";
        			se = "sudoedit";
        			microfetch = "microfetch && echo";

        			gs = "git status";
        			ga = "git add";
        			gc = "git commit";
        			gp = "git push";

        			".." = "cd ..";
		};

		shellInit = ''
			set -g fish_greeting ""
			fastfetch
		'';
	};
}
