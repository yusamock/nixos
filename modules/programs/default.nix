{ config, pkgs, ... }:

{
 
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  home = {

    file = {

      ".config/rofi/".source = ./rofi ;

    };

  };
}
