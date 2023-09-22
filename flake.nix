{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/23.05";
  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      compiler = "ghc927";
      pkgs = import nixpkgs { system = system; };
      hPkgs = pkgs.haskell.packages."${compiler}";
      myDevTools = with hPkgs; [
        ghc
        ghcid
        fourmolu
        hlint
        hoogle
        haskell-language-server
        implicit-hie
        retrie
        cabal-install
        pkgs.zlib
        QuickCheck
        hspec
      ];
      myPackages = with pkgs; [ texlive.combined.scheme-full ];
    in {
      devShells.${system}.default = with pkgs;
        mkShell {
          buildInputs = myDevTools ++ myPackages;
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath myDevTools;
        };
    };
}
