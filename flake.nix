{
  description = "System configuration flake!";

  inputs = {
     nixpkgs.url = "nixpkgs/nixos-unstable";
     nvf.url = "github:notashelf/nvf";
  };

  outputs = {self, nixpkgs, nvf, ...}:
   let
     lib = nixpkgs.lib;
   in {
   nixosConfigurations = {
      lutra = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./configuration.nix 
          nvf.nixosModules.default
	 ];
       };
      };
     };
 }
