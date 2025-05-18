{ stdenv, fetchurl }:
stdenv.mkDerivation {
    pname = "cublas";
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
        description = "Cuda General matrix to matrix multiplication";
        license = stdenv.license.eula;
    };
}
