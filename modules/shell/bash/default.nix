{config, pkgs, ...}:

{

    home = {

      packages = with pkgs; [
        eza
        starship
        tree
        unzip
        zstd
      ];
    };

  programs.bash = {
      enable = true;
      enableCompletion = true;

      shellAliases = {
        vi = "nvim";
        switch = "home-manager switch --flake .";
        home = "vi /etc/nixos/home.nix";
        np = "cd /etc/nixos";
        homes = "np; switch; cd";
        shell = "nix-shell -p";
        ls = "eza";
        la = "eza -a";
        ll = "eza -l";
      };
      bashrcExtra = ''
          export PATH=$PATH:~/.cargo/bin
          eval "$(starship init bash)"

          '';
  };
}
