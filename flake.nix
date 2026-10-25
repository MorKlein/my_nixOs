{
	description = "My system configuration";

	inputs = {

		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

		unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
      			url = "github:nix-community/home-manager/release-26.05";
      			inputs.nixpkgs.follows = "nixpkgs";
    		};

		stylix = {
      			url = "github:danth/stylix/release-26.05";
      			inputs.nixpkgs.follows = "nixpkgs";
    		};
	};
  	outputs = { self, nixpkgs, home-manager, unstable, ... }@inputs: let
    		system = "x86_64-linux";
    		homeStateVersion = "26.05";
    		user = "morklein";
    		hosts = [
      			{ hostname = "desktop"; stateVersion = "26.05"; }
      		];

    		makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      			system = system;
      			specialArgs = {
        			inherit inputs stateVersion hostname user;
      			};

      		modules = [
        		./hosts/${hostname}/configuration.nix
      		];
    	};

  	in {
    		nixosConfigurations = nixpkgs.lib.foldl' (configs: host:
      		configs // {
        		"${host.hostname}" = makeSystem {
          		inherit (host) hostname stateVersion;
        	};
      	}) {} hosts;

    	homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      		pkgs = nixpkgs.legacyPackages.${system};
      		extraSpecialArgs = {
        		inherit inputs homeStateVersion user;
      		};

      	modules = [
        	./home-manager/home.nix
      	];
      };
   };
}

