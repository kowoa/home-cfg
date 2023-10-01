{
  description = "home directory config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };

    macos-pkgs = import nixpkgs {
      system = "x86_64-darwin";
      config.allowUnfree = true;
    };
    macos-unstable = import nixpkgs-unstable {
      system = "x86_64-darwin";
    };
  in {
    homeConfigurations = {
      "kowoa@kdhpc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit unstable;};
        modules = [./home.nix];
      };
      "kodah@kdhmacbp" = home-manager.lib.homeManagerConfiguration {
        pkgs = macos-pkgs;
        extraSpecialArgs = {unstable = macos-unstable;};
        modules = [./macos/home.nix];
      };
    };
  };
}
