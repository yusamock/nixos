{ config, pkgs, inputs, ... }:

{

  imports = [
  ./modules
  ];
  
  # why not stow? 
  home.file = {
  };

  # home-manager cool
  programs.home-manager.enable = true;
}
