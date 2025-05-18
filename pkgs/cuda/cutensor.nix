{ stdenv, fetchurl }:
stdenv.mkDerivation {
    pname = "cutensor";
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
        description = "Cuda Tensor Operations";
        license = stdenv.license.eula;
    };
}
