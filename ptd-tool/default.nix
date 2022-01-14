{ buildGoApplication
, fetchurl
, jq
, lib
, unzip
}:
buildGoApplication rec {
  pname = "ptd-tool";
  version = "8598cd75c3df84df973675402e5b7cc217552cdc";
  buildInputs = [ jq ];
  nativeBuildInputs = [ unzip ];
  src = fetchurl {
    url = "https://github.com/d-housekeeper/ptd-tool-binaryeater/archive/${version}.zip";
    sha256 = "10ynipxrfyyhf7s66a4k5r6gi8qva677gyj2vyjcmw4x59vq67bv";
  };
  modules = ./gomod2nix.toml;
  postBuild = ''
    mkdir -p $out/bin/
    cp ./generate-md-assets.sh $out/bin/
    cp -R ./assets/ $out/bin/assets/
  '';
}
