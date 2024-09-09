{ pkgs, config, ... }:
let
   # See `https://tinted-theming.github.io/base16-gallery/` for options.
   base16_scheme_name = "gruvbox-material-dark-soft"; # "da-one-paper";
   base16_scheme      = "${pkgs.base16-schemes}/share/themes/${base16_scheme_name}.yaml";
   wallpaper_path     = ../../../resources/local-user/images/wallpapers/01.png;
in {
   home.stylix = {

      enable = true;

      targets = {
         # alacritty.enable = true;
         # avizo.enable     = true;
         bat.enable         = true;
         # bemenu = {
         #    enable    = true;
         #    alternate = true;
         #    fontSize  = 10;
         # };
         #
         # bspwm.enable     = true;
         # btop.enable      = true;
         # dunst.enable     = true;
         # emacs.enable     = true;
         # feh.enable       = true;
         firefox.enable     = true;
         fish.enable        = true;
         # foot.enable      = true;
         # fuzzel.enable    = true;
         # fzf.enable       = true;
         # gedit.enable     = true;
         # gitui.enable     = true;
         gnome.enable       = true;
         gtk = {
            enable    = true;
            #extraCss = '' ''; # TODO
         };
         # helix.enable     = true;
         # hyprland.enable    = true;
         # hyprpaper.enable = true;
         # i3.enable        = true;
         # k9s.enable       = true;
         kde.enable         = true;
         kitty = {
            enable           = true;
            variant256Colors = true; # TODO: Ponder.
         };
         # lazygit.enable   = true;
         # mako.enable      = true;
         # mangohud.enable  = true;
         # ncspot.enable    = true;
         neovim = {
            enable                           = true;
            transparentBackground.main       = true;
            transparentBackground.signColumn = true;
         };
         # nixvim = {
         #    enable                           = true;
         #    transparentBackground.main       = true;
         #    transparentBackground.signColumn = true;
         # };
         # nushell.enable     = true;
         # qutebrowser.enable = true;
         # rofi.enable        = true;
         # sway.enable        = true;
         # swaylock = {
         #    enable   = true;
         #    useImage = true;
         # };
         # sxiv.enable   = true;
         tmux.enable     = true;
         # tofi.enable   = true;
         # vim.enable    = true;
         vscode.enable   = true;
         # waybar = {
         #    enable                 = true;
         #    enableCenterBackColors = true;
         #    enableLeftBackColors   = true;
         #    enableRightBackCOlors  = true;
         # };
         # wezterm.enable  = true;
         # wofi.enable     = true;
         # wpaperd.enable  = true;
         # xfce.enable     = true;
         xresources.enable = true;
         yazi.enable       = true;
#         zathura.enable    = true;
         # zellij.enable   = true;
      };

      /* Option A:  Tints an the wallpaper:
      let
         inputImage =  ../../../resources/local-user/wallpaper.png;
         brightness = -30;
         contrast   =  0;
         fillColor  =  "black"
      in
      image           = pkgs.runCommand wallpaper_path {} ''
                         ${pkgs.imagemagick}/bin/convert
                         "${inputImage}"
                         -brightness-contrast ${brightness}, ${contrast}
                         -fill ${fillColor}
                         $out
                      '';
      #*/

      /* Option B:  Recolorizes a wallpaper based on a theme:
      image            = pkgs.runCommand wallpaper_path {} ''COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${base16_scheme}) COLOR="#"$COLOR ${pkgs.imagemagick}/bin/magick xc:$COLOR $out'';
      #*/

      #/* Option C: Use image as-is:
      image            = wallpaper_path;
      #*/

      imageScalingMode = "fill"; # stretch|fill|fit|center|tile

      #polarity        = "dark";

      base16Scheme     = base16_scheme;

      fonts = {
         serif = {
            package = pkgs.dejavu_fonts;
            name    = "DejaVu Serif";
         };

         sansSerif = {
            package = pkgs.dejavu_fonts;
            name    = "DejaVu Sans";
         };

         monospace = {
            package = pkgs.dejavu_fonts;
            name    = "DejaVu Sans Mono";
         };

         emoji = {
            package = pkgs.noto-fonts-emoji;
            name    = "Noto Color Emoji";
         };

         sizes = {
            applications = 12;
            desktop      = 10;
            popups       = 10;
            terminal     = 12;
         };
      }; # end-of: `stylix.fonts`

      cursor = {
         package = pkgs.bibata-cursors;
         name    = "Bibata-Modern-Classic";
         size    = 24;
      };

      opacity = {
         applications = 1.0;
         desktop      = 1.0;
         popups       = 1.0;
         terminal     = 1.0;
      };

      autoEnable = true; # TODO: Ponder.

      # homeManagerIntegration = {
      #    autoImport   = true; # TODO: Ponder.
      #    followSystem = true; # TODO: Ponder.
      # };

   }; # end-of: `stylix`
}
