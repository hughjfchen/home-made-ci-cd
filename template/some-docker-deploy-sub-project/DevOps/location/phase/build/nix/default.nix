{ compiler ? "ghc865" }:

let
  config = {
    packageOverrides = pkgs: rec {
      haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
          "${compiler}" = pkgs.haskell.packages."${compiler}".override {
            overrides = haskellPackagesNew: haskellPackagesOld: rec {

              MY_SUB_PROJECT_NAME =
                haskellPackagesNew.callPackage ./MY_SUB_PROJECT_NAME.nix { };
            };
          };
        };
      };
    };
  };

  pkgs = import <nixpkgs> { inherit config; };

  inherit (pkgs) dockerTools stdenv buildEnv writeText;

  MY_SUB_PROJECT_NAME = pkgs.haskell.packages.${compiler}.MY_SUB_PROJECT_NAME;

  static-MY_SUB_PROJECT_NAME = pkgs.haskell.lib.justStaticExecutables pkgs.haskell.packages.${compiler}.MY_SUB_PROJECT_NAME;

  passwd = ''
    root:x:0:0::/root:/run/current-system/sw/bin/bash
    MY_SUB_PROJECT_NAME:x:90001:90001::/var/empty:/run/current-system/sw/bin/nologin
  '';

  group = ''
    root:x:0:
    nogroup:x:65534:
    MY_SUB_PROJECT_NAME:x:90001:MY_SUB_PROJECT_NAME
  '';

  nsswitch = ''
    hosts: files dns myhostname mymachines
  '';

  MY_SUB_PROJECT_NAME-conf = ''
    para1 = "$(PARA1)"
    para2 = "$(PARA2)"
  '';

  MY_SUB_PROJECT_NAME-env = stdenv.mkDerivation {
    name = "MY_SUB_PROJECT_NAME-env";
    phases = [ "installPhase" "fixupPhase" ];

    installPhase = ''
      mkdir -p $out/etc/MY_SUB_PROJECT_NAME
      echo '${MY_SUB_PROJECT_NAME-conf}' > $out/etc/MY_SUB_PROJECT_NAME/MY_SUB_PROJECT_NAME.conf
      echo '${passwd}' > $out/etc/passwd
      echo '${group}' > $out/etc/group
      echo '${nsswitch}' > $out/etc/nsswitch.conf
    '';
  };

  MY_SUB_PROJECT_NAME-docker =  pkgs.dockerTools.buildImage {
  name = "MY_SUB_PROJECT_NAME";
  tag = "5.2.0";
  
  contents = [ static-MY_SUB_PROJECT_NAME
               MY_SUB_PROJECT_NAME-env ];
  config = {
    Env = [ 
    "PARA1="
    "PARA2="
    ];
    User = "MY_SUB_PROJECT_NAME";
    Cmd = [ "${static-MY_SUB_PROJECT_NAME}/bin/MY_SUB_PROJECT_NAME" "/etc/MY_SUB_PROJECT_NAME/MY_SUB_PROJECT_NAME.conf" ];
    ExposedPorts = {
      "5432/tcp" = {};
    };
    WorkingDir = "/data";
    Volumes = {
      "/data" = {};
    };
  };
};
in  {
  inherit MY_SUB_PROJECT_NAME;
  inherit static-MY_SUB_PROJECT_NAME;
  inherit MY_SUB_PROJECT_NAME-docker;
}
