{
  description = "r flake sample";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        rPackages = with pkgs.rPackages; [
          ggplot2
          ggsci
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ R ] ++ rPackages;
        };
      }
    );
}
