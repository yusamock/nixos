{ config, lib, pkgs, ... }:

{

	home.packages = with pkgs; [
		swww
		rofi
	];

	wayland.windowManager.hyprland = {
		enable = true;

		extraConfig = ''

		# monitor config
		monitor=DP-1,1920x1080@165,0x0,1
		
		# set variables
		$terminal = st
		$browser = librewolf
    $mainMod = SUPER

		$fileManager = st -e ranger
		$menu = sh ~/.config/rofi/launchers/launcher.sh

		# autostart
		exec = xrdb merge .Xresources & waybar
   	exec-once = swww init && swww img ~/Downloads/japanese_street_shop.png

		# default env vars
		env = XCURSOR_SIZE,24
		env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that

		input {
		    kb_layout = us
		    kb_variant =
		    kb_model =
		    kb_options =
		    kb_rules =

		    follow_mouse = 1

		    touchpad {
			natural_scroll = false
		    }

		    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
		}

		general {

		    gaps_in = 5
		    gaps_out = 20
		    border_size = 0
		    col.active_border = rgba(00000099)
		    col.inactive_border = rgba(00000060)

		    layout = dwindle

		    allow_tearing = false
		}

		decoration {

		    rounding = 4

        blur {
			    enabled = true
			      size = 6
			        passes = 2		
			          vibrancy = 0.9
		    }

		    drop_shadow = false
		    shadow_range = 4
		    shadow_render_power = 3
		    col.shadow = rgba(1a1a1aee)
		}

		animations {
		    enabled = true

		    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

		    animation = windows, 1, 7, myBezier
		    animation = windowsOut, 1, 7, default, popin 80%
		    animation = border, 1, 10, default
		    animation = borderangle, 1, 8, default
		    animation = fade, 1, 7, default
		    animation = workspaces, 1, 6, default
		}

		dwindle {
		    pseudotile = true
		    preserve_split = true
		}

		master {
		    new_is_master = true
		}

		gestures {
		    workspace_swipe = false
		}

		misc {
		    force_default_wallpaper = 0 
		    disable_hyprland_logo = true
		}

    # windowrule
    windowrulev2 = opacity 0.95 0.95,class:^(St)$


		# binds
		bind = $mainMod, RETURN, exec, $terminal
		bind = $mainMod, SPACE, exec, ags -t applauncher
		bind = $mainMod, B, exec, $browser
		bind = $mainMod, Q, killactive,
		bind = $mainMod SHIFT, C, exit,
		bind = $mainMod, E, exec, $fileManager
		bind = $mainMod, V, togglefloating,
		bind = $mainMod, R, exec, $menu
		bind = $mainMod, P, pseudo, # dwindle
		bind = $mainMod, J, togglesplit, # dwindle
		bind = $mainMod, H, fullscreen,
		bind = $mainMod, G, exec, grim -g "$(slurp -d)" -t png - | wl-copy -t image/png

		# Move focus with mainMod + arrow keys
		bind = $mainMod, left, movefocus, l
		bind = $mainMod, right, movefocus, r
		bind = $mainMod, up, movefocus, u
		bind = $mainMod, down, movefocus, d

		# Switch workspaces with mainMod + [0-9]
		bind = $mainMod, 1, workspace, 1
		bind = $mainMod, 2, workspace, 2
		bind = $mainMod, 3, workspace, 3
		bind = $mainMod, 4, workspace, 4
		bind = $mainMod, 5, workspace, 5
		bind = $mainMod, 6, workspace, 6
		bind = $mainMod, 7, workspace, 7
		bind = $mainMod, 8, workspace, 8
		bind = $mainMod, 9, workspace, 9
		bind = $mainMod, 0, workspace, 10

		# Move active window to a workspace with mainMod + SHIFT + [0-9]
		bind = $mainMod SHIFT, 1, movetoworkspace, 1
		bind = $mainMod SHIFT, 2, movetoworkspace, 2
		bind = $mainMod SHIFT, 3, movetoworkspace, 3
		bind = $mainMod SHIFT, 4, movetoworkspace, 4
		bind = $mainMod SHIFT, 5, movetoworkspace, 5
		bind = $mainMod SHIFT, 6, movetoworkspace, 6
		bind = $mainMod SHIFT, 7, movetoworkspace, 7
		bind = $mainMod SHIFT, 8, movetoworkspace, 8
		bind = $mainMod SHIFT, 9, movetoworkspace, 9
		bind = $mainMod SHIFT, 0, movetoworkspace, 10

		# resize active windows
		bind = $mainMod SHIFT, right, resizeactive, 10 0
		bind = $mainMod SHIFT, left, resizeactive, -10 0
		bind = $mainMod SHIFT, up, resizeactive, 0 -10
		bind = $mainMod SHIFT, down, resizeactive, 0 10

		# Example special workspace (scratchpad)
		bind = $mainMod, S, togglespecialworkspace, magic
		bind = $mainMod SHIFT, S, movetoworkspace, special:magic

		# Scroll through existing workspaces with mainMod + scroll
		bind = $mainMod, mouse_down, workspace, e+1
		bind = $mainMod, mouse_up, workspace, e-1
		bind = $mainMod SHIFT, m, workspace, e+1
		bind = $mainMod SHIFT, n, workspace, e-1

		# Move/resize windows with mainMod + LMB/RMB and dragging
		bindm = $mainMod, mouse:272, movewindow
		bindm = $mainMod, mouse:273, resizewindow
		'';
	};
}

