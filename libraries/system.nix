{ inputs, outputs, ... }:
## Assertions to enforce: (TODO)
#   1. assert that `../users` *ONLY* contains `.nix`-files with the following exception(s): `README.md`.
#      1. assert that every filename base has a valid name.
#   2. assert that `../hosts` *ONLY* contains sub-dirs.
#      1. assert that every sub-dir has a valid name.
#   3. assert that every host dir in `../hosts` contains the following (additional files are OK but discouraged unless essential or informational):
#      1, `default.nix`.
#      2. `hardware-configuration.nix`.
#      3. `users.nix` (NOTE: validity of the content should get validated during parsing later).
#      4. 'system_type' (which should just contain a system string like "x86_64-linux").
#      5. 'role'        (which should just contain a role string like "minecraft-server").
#   4. assert that every user in `../users` has a corresponding `../home/user-cfg-suites/USER`.
#   5. assert that every host user instance has a corresponding `../home/user-cfg-suite/USER/user-cfg-instances/HOST.nix`.
let
   lib        = inputs.self.outputs.lib;
   system-lib = inputs.self.outputs.system-lib;
   #pkgs       = inputs.self.outputs;
in rec {
      # TODO: Decide on organization (group by domain or alphabetically?)

      userList = builtins.map (e: stripFileExtension e) (listNixFiles ../users);

      userInfoMap = builtins.listToAttrs
         (builtins.map
            (userName: { name = userName; value = import ../users/${userName}.nix; } )
            userList
         );

      hostList = listSubDirs ../hosts; # TODO: Ensure|assert valid internal structure.

      hostUsersMap = builtins.listToAttrs
         (builtins.map
            (host: { name = host; value = listHostUsers host; } )
            hostList
         );

      extractFileExtension = fileName:
         builtins.elemAt
            (builtins.match
               "[^.]*[.]*([a-zA-Z0-9|_|-|.]*)"
               (ensureString fileName "`fileName` must be a string!" )
            )
            0;

      stripFileExtension = fileName:
         builtins.elemAt
            (builtins.match "([^.]*)[.]*[a-zA-Z0-9|_|-|.]*" fileName)
            0;

      isValidName = name:
         (builtins.match "([a-zA-Z]+[a-zA-Z0-9|_|-]*)" name) != null;

      isValidUserName = isValidName;

      isValidHostName = isValidName;

      isListOfStrings = x:
         (builtins.isList x) && (builtins.all (e: builtins.isString e) x);

      isExistingUserName = x:
         listContains userList x;

      isExistingHostName = x:
         listContains hostList x;

      # TODO: make case insensitive (always or as option)?
      isFileOfExtension = fileName: fileType: fileExtension:
            (
                  (ensureString fileType "`fileType` must be a string!")
               ==
                  "regular"
            )
         &&
            (
                  (extractFileExtension fileName)
               ==
                  (ensureString fileExtension "`fileExtension` must be a string!")
            );

      isFileOfExtensionInList = fileName: fileType: fileExtensionsList:
         builtins.any (fileExtension: isFileOfExtension fileName fileType fileExtension) fileExtensionsList;

      isNixFile = fileName: fileType:
         isFileOfExtension fileName fileType "nix";

      listContains = list: x:
         builtins.any (e: e == x) list;

      listNixFiles = dirPath:
         builtins.attrNames (
            lib.filterAttrs
               (isNixFile)                 # predicate
               (builtins.readDir dirPath)  # file-type map (content of dir)
         );

      listSubDirs = dirPath:
         lib.attrNames (
            lib.filterAttrs
               (_: type: type == "directory")  # predicate
               (builtins.readDir dirPath)      # file-type map (content of dir)
         );

      listHostUsers = host:
         builtins.map
            (e: e.username)
            (import ../hosts/${host}/users.nix);

      getDescriptionOfUser = username:
         "TODO"; # `optionalStringOrDefault /*description read from users/username.nix*/ username;

      getPreferredShellOfUserOrNull = username:
         "fish"; # TODO

      getHostUserArgs = hostName:
         import ../hosts/${ensureExistingHostName hostName}/users.nix;

      ensure = x: pred: errMsg:
         if (pred x) then x else throw errMsg;

      ensureString = x: errMsg:
         ensure x (builtins.isString) errMsg;

      ensureBool = x: errMsg:
         ensure x (builtins.isBool) errMsg;

      ensureListOfStrings = x: errMsg:
         ensure x (isListOfStrings) errMsg;

      ensureValidUserName = x:
         ensure (ensureString x "Username must be a string!")
                (isValidUserName)
                "`${x}` is not a valid username!";

      ensureExistingUserName = x:
         ensure (ensureValidUserName x)
                (isExistingUserName)
                "`${x}` is not an existing username!";

      ensureValidHostName = x:
         ensure (ensureString x "Hostname must be a string!")
                (isValidHostName)
                "`${x}` is not a valid hostname!";

      ensureExistingHostName = x:
         ensure (ensureValidHostName x)
                (isExistingHostName)
                "`${x}` is not an existing hostname!";

      optionalOrDefault = x: pred: default: errMsg:
         if (builtins.isNull x) then default else if (pred x) then x else throw errMsg;

      optionalListOfStringsOrDefault = x: default: name:
         optionalOrDefault
            x
            (isListOfStrings)
            (ensureListOfStrings default "`default` must be a list-of-strings!")
            "Value `${name}` must be null or a list-of-strings!";

      optionalListOfStrings = x:
         optionalListOfStringsOrDefault x []; # TODO: Contemplate.

      optionalStringOrDefault = x: default: name:
         optionalOrDefault
            x
            (builtins.isString)
            (ensureString default "`default` must be a string!")
            "Value `${name}` must be null or a string!";

      optionalBoolOrDefault = x: default: name:
         optionalOrDefault
            x
            (builtins.isBool)
            (ensureBool default "`default` must be a bool!")
            "Value `${name}` must be null or a bool!";

      optionalString = x:
         optionalStringOrDefault x ""; # TODO: Contemplate.

      forEachHost = f:
         builtins.map
            (f)
            (hostList);

      forEachHostUser = hostName: f:
         builtins.map
            (f)
            (hostUsersMap.${hostName}); # TODO: account for non-existing attribute case

      forEachHostUserArgSet = hostName: f:
         builtins.map
            (f)
            (getHostUserArgs hostName);

      mkHostUser = args@{ /*platform,*/ ... }:
         let
            userName       = ensureExistingUserName args.username;
            preferredShell = if userInfoMap.${userName} ? preferredShell
                             then inputs.nixpkgs.${userInfoMap.${userName}.preferredShell} or null
                             else null;
         in {
            name  = userName;
            value = { # TODO: add let..in block with validation?
               isNormalUser = (args.isNormalUser or true);
               isSystemUser = (args.isSystemUser or false);
               description  = (userInfoMap.${userName}.description or userName);
               shell        = (preferredShell);
               packages     = []; # TODO: Revisit.
               extraGroups  = (args.extraGroups or [ "networkmanager" "wheel" ]);
               #extraGroups  = (optionalListOfStringsOrDefault args.extraGroups [ "networkmanager" "wheel" ] "extraGroups"); # TODO: strip duplicates (if any)
            };
         };

      # Example usage:
      #    `users.users = mkHostUsers "ExampleHost";` (TODO: in `../system/core/users.nix`?)
      mkHostUsers = hostName:
         builtins.listToAttrs # mkHostUser returns a KV set, so we convert the list of them into an attr set.
            (forEachHostUserArgSet /*of*/ hostName /*do*/ (
               hostUserArgSet: mkHostUser hostUserArgSet
            )
         );

      mkHostSystem = hostName:
         lib.nixosSystem {
            specialArgs = { inherit inputs outputs system-lib; };
            modules     = [ ../hosts/${hostName}    ];
               #inputs.home-manager.nixosModules.default # HM (TODO: R.O.D).
               #outputs.nixosModules.vm-host             #     TODO: R.O.D.
         };

      mkHostSystems =
         builtins.listToAttrs
            (forEachHost
               ( hostName: { name = hostName; value = mkHostSystem hostName; } )
            );

      mkUserHome = userName: hostName:
         lib.homeManagerConfiguration {
            pkgs             = inputs.nixpkgs.legacyPackages.${import ../hosts/${hostName}/platform};
            extraSpecialArgs = { inherit inputs outputs system-lib; };
            modules          = [
               ../home/global/profiles/core                                           # Global core config.
               ../home/user-cfg-suites/${userName}/profiles/local/core                # User   core config.
               ../home/user-cfg-suites/${userName}/user-cfg-instances/${hostName}.nix # User@Host   config.
            ];
         };

      mkUserHomes = builtins.listToAttrs # `[{K;V;}*] -> {K=V;*}`
         (builtins.foldl' # Fold data `[[{K;V;}*]*] -> [{K;V;}*]`.
            (l: r: l ++ r)      # Fold.arg#1: Binary OP; concat lists.
            []                  # Fold.arg#2: Fold expr initial empty list state.
            (forEachHost /*do*/ # Fold.arg#3: Generated input data of form `[[{K;V;}*]*]`.
               (hostName: # Generate `[{K;V;}]*]` data for each host; i.e. `[[{K;V;}*]*]`:
                  forEachHostUser /*of*/ hostName /*do*/
                     (hostUserName: # Generate `{K;V;}` for each user; i.e. `[{K;V;}]*]`:
                        {
                           name  = "${hostUserName}@${hostName}";    # Key   `K` of form `user@host`.
                           value = mkUserHome hostUserName hostName; # Value `V` of form `{/*home config*/}`.
                        }
                     )
               )
            )
         );

   }
