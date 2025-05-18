{ stdenv, fetchurl }:
stdenv.mkDerivation {
    name = "nsight_systems";
    src = fetchurl {
        url = "https://developer.nvidia.com/downloads/assets/tools/secure/nsight-systems/2025_3/nsight-systems-2025.3.1_2025.3.1.90-1_amd64.deb";
        hash = "";
    };
}
