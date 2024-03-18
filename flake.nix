{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		flake-utils.url = "github:numtide/flake-utils";
	};
	outputs = { self, nixpkgs, flake-utils }:
		flake-utils.lib.eachDefaultSystem
			(system:
				let
					pkgs = import nixpkgs {
						inherit system;
					};
				in
				with pkgs;
				{
					devShells.default = mkShell {
						buildInputs = [
							beam.packages.erlang_26.elixir_1_16
							beam.packages.erlang_26.erlang
							beam.packages.erlang_26.rebar3
							gleam
						];
					};
				}
			);
}
