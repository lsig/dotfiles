{
  description = "lsig nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          # CLIs
          pkgs.oh-my-posh
          pkgs.awscli2
          pkgs.lazygit
          pkgs.ripgrep
          pkgs.neovim
          pkgs.zoxide
          pkgs.delta
          pkgs.ruff
          pkgs.stow
          pkgs.tmux
          pkgs.tree
          pkgs.bat
          pkgs.fnm
          pkgs.fzf
          pkgs.vim
          pkgs.zsh
          pkgs.fd
          pkgs.gh
          pkgs.go
          pkgs.uv

          # Apps
          pkgs.alacritty
          pkgs.raycast
        ];

      fonts.packages = [
        pkgs.nerd-fonts.hack
        pkgs.nerd-fonts.jetbrains-mono
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."lsig" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
