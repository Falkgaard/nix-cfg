{ system-lib, config, ... }:
let
   hostName = config.system.name;
in {
   config.users.users = system-lib.mkHostUsers hostName;
}
