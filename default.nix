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
  multiPkgs = null;
  # for ocean_ncp this seems to be not defined correctly
  profile = pkgs.lib.optionalString (pkgs.stdenv.is64bit) ''
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -DPTRDIFF_MAX=0x7fffffffffffffff"
  '';

  extraOutputsToInstall = [ "dev" ];
  runScript = "bash";
}).env
