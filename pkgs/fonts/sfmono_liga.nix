{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "liga-sfmono";
  version = "unstable-2021-08-02";

  src = fetchFromGitHub {
    owner = "shaunsingh";
    repo = "SFMono-Nerd-Font-Ligaturized";
    rev = "main";
    sha256 = "sha256-0000000000000000000000000000000000000000000="; # fill in actual hash
  };

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp *.otf $out/share/fonts/opentype/
  '';

  dontConfigure = true;
  dontUnpack = true;
  dontBuild = true;

  meta = {
    description = "San Francisco Mono Nerd Font with Ligatures";
    homepage = "https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized";
    license = stdenv.lib.licenses.unfree;
    platforms = stdenv.lib.platforms.all;
  };
}
