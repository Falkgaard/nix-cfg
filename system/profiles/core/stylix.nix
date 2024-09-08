{ pkgs, inputs, ... }:
let
      # See `https://tinted-theming.github.io/base16-gallery/` for options.
      base16_scheme_name = "gruvbox-material-dark-soft"; # "da-one-paper";
      base16_scheme      = "${pkgs.base16-schemes}/share/themes/${base16_scheme_name}.yaml";
      wallpaper_path     = ../../resources/images/wallpapers/01.png;
in {
   imports = [ inputs.stylix.nixosModules.stylix ];

   stylix  = {

      enable = true;

      # TODO: move these into `system/profiles`!
      targets = {
         console.enable     = true;
         fish.enable        = true;
         gnome.enable       = true;
         gtk.enable         = true;
         nixos-icons.enable = true;
         # grub = {
         #   enable   = true;
         #   useImage = true;
         # };
         #
         # feh.enable = true;
         #
         # nixvim = {
         #    enable                           = true;
         #    transparentBackground.main       = true;
         #    transparentBackground.signColumn = true;
         # };
         #
         # lightdm.enable = true;
         #
         # plymouth = {
         #    enable       = true;
         #    logo         = ./path/to/logo.TODO.png
         #    logoAnimated = true;
         # };
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
         name    = "Bibata-Modern-Ice";
         size    = 24;
      };

      opacity = {
         applications = 1.0;
         desktop      = 1.0;
         popups       = 1.0;
         terminal     = 1.0;
      };

      autoEnable = true; # TODO: Ponder.

      homeManagerIntegration = {
         autoImport   = true; # TODO: Ponder.
         followSystem = true; # TODO: Ponder.
      };

   }; # end-of: `stylix`
}

