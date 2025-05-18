{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation {
  pname = "BlexMonoLiga";
  version = "0.1.0";
  src = fetchurl {
    url = "https://github.com/tdarshana/Blex-Mono-Liga-Powerline/releases/download/rel-v0.1/ligalex-mono-powerline.zip";
    sha256 = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
  };

  nativeBuildInputs = [ unzip ];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp *.ttf $out/share/fonts/truetype/
  '';

  dontConfigure = true;
  dontBuild = true;

  meta = {
    description = "Plex Mono Font Ligaturized with Powerline support";
    homepage = "https://github.com/tdarshana/Blex-Mono-Liga-Powerline";
    platforms = stdenv.lib.platforms.all;
  };
}
