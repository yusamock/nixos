{ config, pkgs, ...}:

{
# seperate nixpkgs config

home.packages = with pkgs; [
      lsd
      ncspot
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

      spotify
      xorg.xrdb
   ];
}
