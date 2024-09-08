# (NOTE: WIP) (pseudo-code):

   let old_hostname = "$1";
   let new_hostname = "$2";

   if let Some(hosts_dir) = Directory::open("../hosts"): {
      if let Some(old_host_dir) hosts_dir.try_get_subdir(old_username): {
         if is_valid_hostname(new_hostname): {
            old_host_dir.rename(new_hostname);
            # TODO: rename every "../home/user-cfg-suites/*/user-cfg-instances/{old_hostname}.nix" to "{new_hostname}.nix"
            println!( "[SUCCESS]: Renamed `{old_hostname}` to `{new_hostname}`!" );
            exit(0);
         }
         else: {
            println!( "[ERROR]: `{new_hostname}` is not a valid hostname!" );
            exit(-1);
         }
      }
      else: {
         println!( "[ERROR]: Host with name `{old_hostname}` does not exist!" );
         exit(-2);
      }
   }
   else: {
      println!( "[FATAL]: Host directory is missing!" );
      exit(-3);
   }
