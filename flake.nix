{
  description = "Simple system monitor that only shows what matters";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" ];
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.stdenvNoCC.mkDerivation {
            pname = "eztop";
            version = "0.1.0";
            src = self;
            buildInputs = [ pkgs.python3 ];
            dontBuild = true;
            installPhase = ''
              install -Dm755 eztop $out/bin/eztop
            '';
            meta = {
              description = "Simple system monitor that only shows what matters";
              homepage = "https://github.com/theowiik/eztop";
              license = pkgs.lib.licenses.mit;
              mainProgram = "eztop";
              platforms = pkgs.lib.platforms.linux;
            };
          };
        });
    };
}
