{ pkgs ? import <nixpkgs> {} }:

with pkgs; stdenv.mkDerivation {
  name = "pbrt";
  src = ./.;

  buildInputs = [
    cmake 
  ];
}

