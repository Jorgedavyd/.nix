{ stdenv, fetchurl }:
stdenv.mkDerivation {
    pname = "cufft";
    version = "";
    src = fetchurl {
        url = "";
        sha256 = "";
    };
    unpackPhase = ''
    '';
    buildPhase = ''
    '';
    installPhase = ''
    '';

    dontConfigure = true;
    dontPatch = true;

    meta = {
        description = "Cuda Fast Fourier Transform";
        license = stdenv.license.eula;
    };
}
