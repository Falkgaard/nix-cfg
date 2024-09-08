
   # (NOTE: WIP) (pseudo-code):

   let username = "$1";
   if let Some(user_cfg) = Directory::open("../users").try_get_file("${username}.nix"): {
      let description     = ...; # TODO: read from user_cfg
      let email           = ...; # TODO: read from user_cfg
      let preferred_shell = ...; # TODO: read from user_cfg
      println!( "${username} (${description})" );
      println!( "\tE-mail          : ${email}" );
      println!( "\tPreferred shell : ${preferred_shell}" );
      println!( "\tUser of the following hosts:" );
      for subdir in path("../hosts").get_subdirs(): {
         if subdir.get_file("users.nix").contains_string(username): {
            println!( "\t\t${subdir}" );
         }
      }
      exit(0);
   }
   else: {
      println!( "Invalid username! (`${username`})" );
      exit(-1);
   }
