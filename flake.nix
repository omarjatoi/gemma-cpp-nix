{
  description = "Lightweight, standalone C++ inference engine for Google's Gemma models";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          gemma-cpp = pkgs.callPackage ./package.nix { };
          default = self.packages.${system}.gemma-cpp;
        }
      );
    };
}
