{ config, pkgs, inputs, ... }:

{

  imports = [
  ./programs/hyprland.nix
  ./programs/bash.nix
  ./programs/starship.nix
  ./programs/fonts.nix
  ];
  
  # basic info
  home.username = "yusa";
  home.homeDirectory = "/home/yusa";

  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  # packages ! 
  home.packages = with pkgs; [
    lsd
    ncspot
    spotify

    waybar
    prismlauncher
    librewolf
    
    ranger
    nwg-look
    git

    discord
    grim
    jmtpfs

    qbittorrent
  ];
  
  # why not stow? 
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # home-manager cool
  programs.home-manager.enable = true;
}
