{
   username       =  builtins.baseNameOf ./.; # Do *NOT* edit. TODO: Find better way?
   email          =  null;
   description    = "Guest";
   preferredShell = "fish";
   persistent     =  false; # TODO: time limit before clean up?
}
