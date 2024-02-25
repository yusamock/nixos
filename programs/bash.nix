{config, ...}:

{
  programs.bash ={
      enable = true;
      enableCompletion = true;

      shellAliases = {
        vi = "nvim";
        switch = "home-manager switch --flake .";
        home = "vi /etc/nixos/home.nix";
        npath = "cd /etc/nixos";
        shell = "nix-shell -p";
      };
      bashrcExtra = ''
          export PATH=$PATH:~/.cargo/bin
          '';
  };
}
