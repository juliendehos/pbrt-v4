{ pkgs ? import <nixpkgs> {} }:

with pkgs; stdenv.mkDerivation rec {
  name = "pbrt-v4";

  src = fetchFromGitHub {
    owner = "mmp";
    repo = name;
    rev = "39f1679";
    sha256 = "1g12pnb5m8jqpqqa6nk8j342vkvbbd9a742akism4r5k3r1cvbvi";
    fetchSubmodules = true;
  };

  buildInputs = [
    cmake 
    glfw
    xorg.libX11
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXi
    xorg.libXxf86vm
    zlib
  ];

  postPatch = ''
    substituteInPlace src/ext/CMakeLists.txt --replace "HalfTest" ""
    substituteInPlace src/ext/CMakeLists.txt --replace "IexTest" ""
    substituteInPlace src/ext/CMakeLists.txt --replace "IlmImfTest" ""
    substituteInPlace src/ext/CMakeLists.txt --replace "IlmImfUtilTest" ""
    substituteInPlace src/ext/CMakeLists.txt --replace "ImathTest" ""
    substituteInPlace src/ext/CMakeLists.txt --replace "cctest" ""
  '';

  #doCheck = false;

}

