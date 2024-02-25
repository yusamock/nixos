{ inputs, config, pkgs, defaultApplications, ... }:

{
  imports = [
  ./programs/fonts.nix
  ./programs/hyprland.nix
  ./programs/starship.nix
  ./programs/bash.nix
  inputs.ags.homeManagerModules.default
  ];

  # usr info
  home.username = "yusa";
  home.homeDirectory = "/home/yusa";
  
  # gtk
    gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    cursorTheme.name = "Qogir";
    iconTheme.name = "Qogir";
    theme.name = "Jasper-Grey-Dark-Compact";
  };

  # set cursor
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
  };

  # just dont mess up with this, pls.
  home.stateVersion = "23.11";

  home.packages = with pkgs; [

    git
    xorg.xrdb
    swww
    
    lsd
    pavucontrol
    wlogout
    
    discord
    qbittorrent
    obsidian
    
    waybar
    spotify
    neovim

    ranger
    porsmo
    wlogout

    ungoogled-chromium
    prismlauncher
  ];
  
  # rather gnu stow lol
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    PF_COL1=2;
  };

   # ags
     programs.ags = {
       enable = true;
       extraPackages = with pkgs; [
          gtksourceview
          webkitgtk
          accountsservice
       ];
     };
  
  # default browser
  xdg.mime.defaultApplications = {
  "text/html" = "firefox";
  "x-scheme-handler/http" = "firefox";
  "x-scheme-handler/https" = "firefox";
  "x-scheme-handler/about" = "firefox";
  "x-scheme-handler/unknown" = "firefox";
};

  # let home-manager do home-manager >:)
  programs.home-manager.enable = true;
}
