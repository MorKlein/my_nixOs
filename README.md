# NixOs config

Конфиг для себя, почти полностью скопированный у [Andrey0189](https://github.com/Andrey0189/nixos-config-reborn/blob/master/README.md) и адаптированый под Niri

# Установка

	```bash
	mkdir ~/flake
	cd ~/flake
    git clone https://github.com/MorKlein/nixos-config
    cd nixos-config
    
    cp /etc/nixos/hardware-configuration.nix ./
	```|

**Отредактировать`flake.nix` при надобности**:

    ```diff
    ...
      outputs = { self, nixpkgs, home-manager, ... }@inputs: let
        system = "x86_64-linux";
    --  homeStateVersion = "26.05";
    ++  homeStateVersion = "<your_home_manager_state_version>";
    --  user = "morklein";
    ++  user = "<your_username>";
        hosts = [
    --    { hostname = "desktop"; stateVersion = "26.05"; }
    ++    { hostname = "<your_hostname>"; stateVersion = "<your_state_version>"; }
        ];
    ...


    ```bash
    cd nixos-config
    git add .
    nixos-rebuild switch --flake ./#<hostname>
    # or nixos-install --flake ./#<hostname> if you are installing on a fresh system
    home-manager switch
