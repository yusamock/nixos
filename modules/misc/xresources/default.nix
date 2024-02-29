{ config, pkgs, ...}:

{

xresources = {
  path = ".Xresources";
  extraConfig = ''

! __  ___ __ ___ _ __ ___ ___ 
! \ \/ / '__/ __| '__/ __/ __|
!  >  <| |  \__ \ | | (__\__ \
! /_/\_\_|  |___/_|  \___|___/
                             
! special
*.foreground:   #dadada
*.background:   #141b1e
*.cursorColor:  #dadada

! black
*.color0:       #141b1e
*.color8:       #232a2d

! red
*.color1:       #e57474
*.color9:       #e57474

! green
*.color2:       #8ccf7e
*.color10:      #8ccf7e

! yellow
*.color3:       #e5c76b
*.color11:      #e5c76b

! blue
*.color4:       #67b0e8
*.color12:      #67b0e8

! magenta
*.color5:       #c47fd5
*.color13:      #cf4fd5

! cyan
*.color6:       #6cbfbf
*.color14:      #6cbfbf

! white
*.color7:       #dadada
*.color15:      #dadada

! st
st.borderpx: 35
'';

  };
 }

