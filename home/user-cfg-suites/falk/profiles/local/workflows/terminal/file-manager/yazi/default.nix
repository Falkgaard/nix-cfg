{ pkgs, lib, inputs, ... }: {
   # nvim - DreamMaoMao/yazi.nvim
   programs.yazi = {
      enable                = true;
      enableFishIntegration = true;

      settings = {
         #log = {
         #   enabled = false;
         #};

         manager = {
            show_hidden    = true;
	    show_symlink   = true;
            layout         = [2 3 5];
	    scrolloff      = 5;
            sort_by        = "modified";
	    sort_sensitive = true;
            sort_dir_first = true;
           #sort_reverse   = true;
	    mouse_events   = [ "click" "scroll" "touch" "move" "drag" ];
	    title_format   = "{cwd}";
         };

	 preview = {
            tab_size       = 3;
	    max_width      = 1024;
	    max_height     = 1024;
	    image_filter   = "lanczos3";
	    image_quality  = 85;
	    sixel_fraction = 12;
	 };

	 opener = {

	 };

         input = {
            find_origin = "bottom-left";
            find_offset = [0 2 50 3];
         };
      };

      theme = {
         status = {
            separator_open  = "█";
            separator_close = "█";
         };
         
         #input = {
         #   border = { fg = "black"; };
         #};
      };
   };
}
