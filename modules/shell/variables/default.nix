{ config, pkgs, ...}:

{
  home = {

    username = "yusa";
    homeDirectory = "/home/yusa";
    
    stateVersion = "23.11";

    sessionVariables = {
      EDITOR= "nvim";

      WALLPAPER_DIR="~/Pictures/walls";

    };
  };
}
