{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "parsec";
  targetPkgs = pkgs: (with pkgs; [
    getopt
    flex
    binutils
    bison
    gcc
    gnumake
    bc
    pkg-config
    m4
    which
    cmake
    gettext
    autoconf
    xorg.libX11
    xorg.libX11
    xlibs.xorgproto
    xlibs.libXext
    xlibs.libXt
    xlibs.libXmu
    xlibs.libXi
    xlibs.libXau
    yasm
    # as noted in the README, x264 crashes due to double free.
    # However one can use the upstream version
    x264
  ]);
  extraOutputsToInstall = [ "dev" ];
  runScript = "bash";
}).env
