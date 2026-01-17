{
  description = "The development environment for my site";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = {self, nixpkgs}:
  let
    forAllSystems = function: 
      nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (
        system: function nixpkgs.legacyPackages.${system}
      );
  in
  {
    devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./shell.nix { };
    });
  };
}
