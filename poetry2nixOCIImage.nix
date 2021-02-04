{ pkgs ?  import <nixpkgs> {} }:
let
    poetry2nixOCI = import ./poetry2nix.nix { pkgs = pkgs.pkgsCross.gnu64; };
in
    pkgs.dockerTools.buildLayeredImage {
    name = "numtild-dockertools-poetry2nix";
    tag = "0.0.1";
    contents = [ poetry2nixOCI ];
}
