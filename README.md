# nix-cfg

My NixOS Omni-Config (multi-host, multi-user NixOS flake with Home Manager + dotfiles/configs).

## Structure flow:

`flake.nix`-> (for each HOST) `hosts/HOST` -> (one ROLE) `system/role/ROLE` -> `system/profiles/core` + `system/profiles/*`(s) -> (for each USER of HOST) `home/user-cfg-suites/USER/user-cfg-instances/HOST.nix` -> `home/global/profiles/core` + `home/global/profiles/*`(s) + `home/user-cfg-suites/USER/profiles/local/core` + `home/user-cfg-suites/USER/profiles/local/*`(s).