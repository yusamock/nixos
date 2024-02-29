{
  description = "bad wrote flake nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };

        st.url = "github:siduck/st";
	      hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = "x86_64-linux";
	config = {
	allowUnfree = true;
  permittedInsecurePackages = [
    "steam"
    "steam-original"
    "steam-run"
     ];
	 };
	};
    in
    {
    
      nixosConfigurations.blushie = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/yusa/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

	homeConfigurations.yusa = home-manager.lib.homeManagerConfiguration {
	  inherit pkgs;

	  extraSpecialArgs = { inherit inputs; };

	  modules = [ ./home.nix ];
	};
    };
}
