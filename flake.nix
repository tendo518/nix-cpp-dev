{
  description = "A C++ development environment using Nix Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        {
          devShells.default =
            pkgs.mkShell.override
              {
                # Override stdenv in order to change compiler
                stdenv = pkgs.clangStdenv;
              }
              {
                packages = with pkgs; [
                  cmake
                  ninja
                  pkg-config
                  clang-tools
                ];

                buildInputs = with pkgs; [
                  fmt
                  nlohmann_json
                  boost
                ];

                shellHook = '''';
              };
        };
    };

}
