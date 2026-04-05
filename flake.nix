{
  description = "Lightweight, standalone C++ inference engine for Google's Gemma models";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          gemma-cpp = pkgs.callPackage ./package.nix { };
          default = self.packages.${system}.gemma-cpp;
        };

        devShells.default = pkgs.mkShell {
          packages = [ pkgs.nixfmt ];
        };

        formatter = pkgs.nixfmt;
      }
    );
}
