{ stdenv, fetchurl }:
stdenv.mkDerivation {
    pname = "cudnn";
    version = "9.3";
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
        description = "Cuda Deep Neural Networks (CuDNN)";
        license = stdenv.license.eula;
    };
}
