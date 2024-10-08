{ pkgs, configs, lib, ... }: {
   
   programs.kitty = {
      
      enable = true;
      
      # environment ... TODO
      # extraConfig ... TODO
      # package     ... TODO
      # keybindings ... TODO
      # theme       ... TODO
      
      font.name = lib.mkDefault "FiraCode"; # TODO: throughout this config we want to tie fonts and palettes to stylix somehow
      
      settings = {
         # Fonts:
            #font_family                  = lib.mkDefault              "JetBrains Mono";
            bold_font                     = lib.mkDefault                        "auto";
            italic_font                   = lib.mkDefault                        "auto";
            bold_italic_font              = lib.mkDefault                        "auto";
            font_size                     = lib.mkDefault                        "11.0"; # in pts
            force_ltr                     = lib.mkDefault                          "no";
            adjust_line_height            = lib.mkDefault                             0;
            adjust_column_width           = lib.mkDefault                             0;
            disable_ligatures             = lib.mkDefault                       "never";
            font_features                 = lib.mkDefault "FiraCode-Retina +zero +liga";
            box_drawing_scale             = lib.mkDefault          "0.001, 1.0, 1.5, 2";
         # Cursor:
            cursor_shape                  =         "block"; # block|beam|underline
            cursor_blink_interval         =              -1; # in secs (0: disable, negative: use system default)
            cursor_stop_blinking_after    =          "15.0"; # in secs
         # Scrollback & Mouse:
            scrollback_pager              =            "less --chop-long-lines --RAW-CONTROL-CHARS +INPUT_LINE_NUMBER";
            scrollback_pager_history_size =               0; # in Mb (negative or 0: disable)
            scrollback_lines              =            2000; # (negative: infinite:)
            wheel_scroll_multiplier       =           "5.0"; # (negative: flip direction)
            touch_scroll_multiplier       =           "1.0"; # (negative: flip direction)
            mouse_hide_wait               =           "0.6"; # in secs
         # URL:
            url_color                     =       "#0087BD"; # mouse-over color
            url_style                     =         "curly"; # none|single|double|curly
            open_url_modifiers            =     "kitty_mod";
            open_url_with                 =       "default";
         # Selection:
            copy_on_select                =            "no";
            strip_trailing_spaces         =         "smart"; # smart|always
            rectangle_select_modifiers    =      "ctrl+alt";
            terminal_select_modifiers     =         "shift";
            select_by_word_characters     = ":@-./_~?&=%+#";
            click_interval                =            "-1"; # in secs (negative: use system default)
            focus_follows_mouse           =            "no"; # TODO: unify with equivalent Hyprland setting?
            pointer_shape_when_grabbed    =         "arrow"; # arrow|beam|hand
         # Performance:
            repaint_delay                 =              16; # in ms
            input_delay                   =               2; # in ms
            sync_to_monitor               =           "yes";
         # Terminal bell:
            enable_audio_bell             =            "no";
            visual_bell_duration          =           "0.0"; # in secs (0: disable)
            window_alert_on_bell          =           "yes";
            bell_on_tab                   =           "yes";
            command_on_bell               =          "none"; # program|none
         # Window Layout:
            window_padding_width          =           "8.0"; # in pts
            confirm_os_window_close       =              -1;
            # TODO
         # Tab Bar:
            # TODO
         # Color Scheme:
            #include                      = "~/.config/kitty/theme.conf"; # TODO: hard-coding it here for now!
            background                    = lib.mkDefault "#403E41";
            foreground                    = lib.mkDefault "#FCFCFA";
            cursor                        = lib.mkDefault "#FFD7AF";
            cursor_text_color             = lib.mkDefault "#000000";
            selection_foreground          = lib.mkDefault "#403E41";
            selection_background          = lib.mkDefault "#FCFCFA";
            color0                        = lib.mkDefault "#403E41"; # Dull Black
            color1                        = lib.mkDefault "#FF6188"; # Dull Red
            color2                        = lib.mkDefault "#A9DC76"; # Dull Green
            color3                        = lib.mkDefault "#FFD866"; # Yellow
            color4                        = lib.mkDefault "#FC9867"; # Blue
            color5                        = lib.mkDefault "#AB9DF2"; # Magenta
            color6                        = lib.mkDefault "#78DCE8"; # Cyan
            color7                        = lib.mkDefault "#FCFCFA"; # Dull White
            color8                        = lib.mkDefault "#727072"; # Light Black
            color9                        = lib.mkDefault "#FF6188"; # Light Red
            color10                       = lib.mkDefault "#A9DC76"; # Light Green
            color11                       = lib.mkDefault "#FFD866"; # Light Yellow
            color12                       = lib.mkDefault "#FC9867"; # Light Blue
            color13                       = lib.mkDefault "#AB9DF2"; # Light Magenta
            color14                       = lib.mkDefault "#78DCE8"; # Light Cyan
            color15                       = lib.mkDefault "#FCFCFA"; # Bright White
            #background_blur              = lib.mkDefault        32;
            background_opacity            = lib.mkDefault    "1.00";
            dim_opacity                   = lib.mkDefault    "0.50"; # dim text dimming
            dynamic_background_opacity    = lib.mkDefault     "yes";
         # Advanced:
            allow_remote_control          =  "yes";
         # OS-Specific Tweaks:
            # TODO
         # Keyboard Shortcuts:
            # TODO
         # Background Image:
            background_image             = lib.mkDefault "../../../../../../resources/local-user/images/terminal-backgrounds/01.png";
            background_image_layout      =               "tiled"; # tiled|mirror-tiled|scaled|clamped|centered|scaled
            background_image_linear      =               "no"; # linear interpolation for scaling
            background_tint              =               "0.75";
      }; # end of: `program.kitty.settings`
   }; # end of: `program.kitty`
} # end of: <module>

