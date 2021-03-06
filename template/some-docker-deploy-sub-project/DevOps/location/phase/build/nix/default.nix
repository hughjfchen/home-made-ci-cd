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

  pkgs = if builtins.pathExists ./nixpkgs then
           import (builtins.fetchGit (import ./nixpkgs)) { inherit config; }
         else
           import <nixpkgs> { inherit config; };

  inherit (pkgs) dockerTools stdenv buildEnv writeText runCommand jq lib writeReferencesToFile jshon pigz coreutils findutils moreutils;

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
  protocols = ''
ip	0	IP		# internet protocol, pseudo protocol number
#hopopt	0	HOPOPT		# hop-by-hop options for ipv6
icmp	1	ICMP		# internet control message protocol
igmp	2	IGMP		# internet group management protocol
ggp	3	GGP		# gateway-gateway protocol
ipencap	4	IP-ENCAP	# IP encapsulated in IP 
st2	5	ST2		# ST2 datagram mode 
tcp	6	TCP		# transmission control protocol
cbt	7	CBT		# CBT, Tony Ballardie 
egp	8	EGP		# exterior gateway protocol
igp	9	IGP		# any private interior gateway 
bbn-rcc	10	BBN-RCC-MON	# BBN RCC Monitoring
nvp	11	NVP-II		# Network Voice Protocol
pup	12	PUP		# PARC universal packet protocol
argus	13	ARGUS		# ARGUS
emcon	14	EMCON		# EMCON
xnet	15	XNET		# Cross Net Debugger
chaos	16	CHAOS		# Chaos
udp	17	UDP		# user datagram protocol
mux	18	MUX		# Multiplexing protocol
dcn	19	DCN-MEAS	# DCN Measurement Subsystems
hmp	20	HMP		# host monitoring protocol
prm	21	PRM		# packet radio measurement protocol
xns-idp	22	XNS-IDP		# Xerox NS IDP
trunk-1	23	TRUNK-1		# Trunk-1
trunk-2	24	TRUNK-2		# Trunk-2
leaf-1	25	LEAF-1		# Leaf-1
leaf-2	26	LEAF-2		# Leaf-2
rdp	27	RDP		# "reliable datagram" protocol
irtp	28	IRTP		# Internet Reliable Transaction Protocol
iso-tp4	29	ISO-TP4		# ISO Transport Protocol Class 4
netblt	30	NETBLT		# Bulk Data Transfer Protocol
mfe-nsp	31	MFE-NSP		# MFE Network Services Protocol
merit-inp	32	MERIT-INP	# MERIT Internodal Protocol
dccp	33	DCCP		# Datagram Congestion Control Protocol
3pc	34	3PC		# Third Party Connect Protocol
idpr	35	IDPR		# Inter-Domain Policy Routing Protocol
xtp	36	XTP		# Xpress Tranfer Protocol
ddp	37	DDP		# Datagram Delivery Protocol
idpr-cmtp	38	IDPR-CMTP	# IDPR Control Message Transport Proto
tp++	39	TP++		# TP++ Transport Protocol
il	40	IL		# IL Transport Protocol
ipv6	41	IPV6		# ipv6
sdrp	42	SDRP		# Source Demand Routing Protocol
ipv6-route	43	IPV6-ROUTE	# routing header for ipv6
ipv6-frag	44	IPV6-FRAG	# fragment header for ipv6
idrp	45	IDRP		# Inter-Domain Routing Protocol
rsvp	46	RSVP		# Resource ReSerVation Protocol
gre	47	GRE		# Generic Routing Encapsulation
dsr	48	DSR		# Dynamic Source Routing Protocol
bna	49	BNA		# BNA
esp	50	ESP		# encapsulating security payload
ah	51	AH		# authentication header
i-nlsp	52	I-NLSP		# Integrated Net Layer Security TUBA
swipe	53	SWIPE		# IP with Encryption
narp	54	NARP		# NBMA Address Resolution Protocol
mobile	55	MOBILE		# IP Mobility
tlsp	56	TLSP		# Transport Layer Security Protocol
skip	57	SKIP		# SKIP
ipv6-icmp	58	IPV6-ICMP	icmp6	# ICMP for IPv6
ipv6-nonxt	59	IPV6-NONXT	# no next header for ipv6
ipv6-opts	60	IPV6-OPTS	# destination options for ipv6
#	61			# any host internal protocol
cftp	62	CFTP		# CFTP
#	63			# any local network
sat-expak	64	SAT-EXPAK	# SATNET and Backroom EXPAK
kryptolan	65	KRYPTOLAN	# Kryptolan
rvd	66	RVD		# MIT Remote Virtual Disk Protocol
ippc	67	IPPC		# Internet Pluribus Packet Core
#	68			# any distributed filesystem
sat-mon	69	SAT-MON		# SATNET Monitoring
visa	70	VISA		# VISA Protocol
ipcv	71	IPCV		# Internet Packet Core Utility
cpnx	72	CPNX		# Computer Protocol Network Executive
cphb	73	CPHB		# Computer Protocol Heart Beat
wsn	74	WSN		# Wang Span Network
pvp	75	PVP		# Packet Video Protocol
br-sat-mon	76	BR-SAT-MON	# Backroom SATNET Monitoring
sun-nd	77	SUN-ND		# SUN ND PROTOCOL-Temporary
wb-mon	78	WB-MON		# WIDEBAND Monitoring
wb-expak	79	WB-EXPAK	# WIDEBAND EXPAK
iso-ip	80	ISO-IP		# ISO Internet Protocol
vmtp	81	VMTP		# Versatile Message Transport
secure-vmtp	82	SECURE-VMTP	# SECURE-VMTP
vines	83	VINES		# VINES
ttp	84	TTP		# TTP
#iptm	84	IPTM		# Protocol Internet Protocol Traffic
nsfnet-igp	85	NSFNET-IGP	# NSFNET-IGP
dgp	86	DGP		# Dissimilar Gateway Protocol
tcf	87	TCF		# TCF
eigrp	88	EIGRP		# Enhanced Interior Routing Protocol 
ospf	89	OSPFIGP		# Open Shortest Path First IGP
sprite-rpc	90	Sprite-RPC	# Sprite RPC Protocol
larp	91	LARP		# Locus Address Resolution Protocol
mtp	92	MTP		# Multicast Transport Protocol
ax.25	93	AX.25		# AX.25 Frames
ipip	94	IPIP		# Yet Another IP encapsulation
micp	95	MICP		# Mobile Internetworking Control Pro.
scc-sp	96	SCC-SP		# Semaphore Communications Sec. Pro.
etherip	97	ETHERIP		# Ethernet-within-IP Encapsulation
encap	98	ENCAP		# Yet Another IP encapsulation
#	99			# any private encryption scheme
gmtp	100	GMTP		# GMTP
ifmp	101	IFMP		# Ipsilon Flow Management Protocol
pnni	102	PNNI		# PNNI over IP
pim	103	PIM		# Protocol Independent Multicast
aris	104	ARIS		# ARIS
scps	105	SCPS		# SCPS
qnx	106	QNX		# QNX
a/n	107	A/N		# Active Networks
ipcomp	108	IPComp		# IP Payload Compression Protocol
snp	109	SNP		# Sitara Networks Protocol
compaq-peer	110	Compaq-Peer	# Compaq Peer Protocol
ipx-in-ip	111	IPX-in-IP	# IPX in IP
carp	112	CARP	vrrp		# Common Address Redundancy Protocol
pgm	113	PGM		# PGM Reliable Transport Protocol
#	114			# any 0-hop protocol
l2tp	115	L2TP		# Layer Two Tunneling Protocol
ddx	116	DDX		# D-II Data Exchange
iatp	117	IATP		# Interactive Agent Transfer Protocol
stp	118	STP		# Schedule Transfer Protocol
srp	119	SRP		# SpectraLink Radio Protocol
uti	120	UTI		# UTI
smp	121	SMP		# Simple Message Protocol
sm	122	SM		# SM
ptp	123	PTP		# Performance Transparency Protocol
isis	124	ISIS		# ISIS over IPv4
fire	125	FIRE
crtp	126	CRTP		# Combat Radio Transport Protocol
crudp	127	CRUDP		# Combat Radio User Datagram
sscopmce	128	SSCOPMCE
iplt	129	IPLT
sps	130	SPS		# Secure Packet Shield
pipe	131	PIPE		# Private IP Encapsulation within IP
sctp	132	SCTP		# Stream Control Transmission Protocol
fc	133	FC		# Fibre Channel
rsvp-e2e-ignore	134	RSVP-E2E-IGNORE	# Aggregation of RSVP for IP reservations
mobility-header	135	Mobility-Header	# Mobility Support in IPv6
udplite	136	UDPLite		# The UDP-Lite Protocol
mpls-in-ip	137	MPLS-IN-IP	# Encapsulating MPLS in IP
manet	138	MANET		# MANET Protocols
hip	139	HIP		# Host Identity Protocol 
shim6	140	SHIM6		# Shim6 Protocol 
wesp	141	WESP		# Wrapped Encapsulating Security Payload 
rohc	142	ROHC		# Robust Header Compression 
#	138-254			# Unassigned
pfsync	240	PFSYNC		# PF Synchronization
#	253-254			# Use for experimentation and testing 
#	255			# Reserved
divert	258	DIVERT		# Divert pseudo-protocol
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
      echo '${protocols}' > $out/etc/protocols
      echo '${nsswitch}' > $out/etc/nsswitch.conf
    '';
  };

  # following buildImage is copied from nixpkgs-20.03
  # to fix the arch always amd64 issue
  myarch = platform: {
    i686 = "386";
    x86_64 = "amd64";
    aarch64 = "arm64";
    arm = "arm";
    armv5tel = "arm";
    armv6l = "arm";
    armv7l = "arm";
  }.${platform.parsed.cpu.name} or (throw "Unsupported system");

  MYTARGETARCH = myarch stdenv.targetPlatform;

  # 1. extract the base image
  # 2. create the layer
  # 3. add layer deps to the layer itself, diffing with the base image
  # 4. compute the layer id
  # 5. put the layer in the image
  # 6. repack the image
  mybuildImage = with dockerTools; args@{
    # Image name.
    name,
    # Image tag, when null then the nix output hash will be used.
    tag ? null,
    # Parent image, to append to.
    fromImage ? null,
    # Name of the parent image; will be read from the image otherwise.
    fromImageName ? null,
    # Tag of the parent image; will be read from the image otherwise.
    fromImageTag ? null,
    # Files to put on the image (a nix store path or list of paths).
    contents ? null,
    # When copying the contents into the image, preserve symlinks to
    # directories (see `rsync -K`).  Otherwise, transform those symlinks
    # into directories.
    keepContentsDirlinks ? false,
    # Docker config; e.g. what command to run on the container.
    config ? null,
    # Optional bash script to run on the files prior to fixturizing the layer.
    extraCommands ? "", uid ? 0, gid ? 0,
    # Optional bash script to run as root on the image when provisioning.
    runAsRoot ? null,
    # Size of the virtual machine disk to provision when building the image.
    diskSize ? 1024,
    # Time of creation of the image.
    created ? "1970-01-01T00:00:01Z",
  }:

    let
      baseName = baseNameOf name;

      # Create a JSON blob of the configuration. Set the date to unix zero.
      baseJson = let
          pure = writeText "${baseName}-config.json" (builtins.toJSON {
            inherit created config;
            architecture = MYTARGETARCH;
            os = "linux";
          });
          impure = runCommand "${baseName}-config.json"
            { nativeBuildInputs = [ jq ]; }
            ''
               jq ".created = \"$(TZ=utc date --iso-8601="seconds")\"" ${pure} > $out
            '';
        in if created == "now" then impure else pure;

      layer =
        if runAsRoot == null
        then mkPureLayer {
          name = baseName;
          inherit baseJson contents keepContentsDirlinks extraCommands uid gid;
        } else mkRootLayer {
          name = baseName;
          inherit baseJson fromImage fromImageName fromImageTag
                  contents keepContentsDirlinks runAsRoot diskSize
                  extraCommands;
        };
      result = runCommand "docker-image-${baseName}.tar.gz" {
        nativeBuildInputs = [ jshon pigz coreutils findutils jq moreutils ];
        # Image name and tag must be lowercase
        imageName = lib.toLower name;
        imageTag = if tag == null then "" else lib.toLower tag;
        inherit fromImage baseJson;
        layerClosure = writeReferencesToFile layer;
        passthru.buildArgs = args;
        passthru.layer = layer;
      } ''
        ${lib.optionalString (tag == null) ''
          outName="$(basename "$out")"
          outHash=$(echo "$outName" | cut -d - -f 1)
          imageTag=$outHash
        ''}
        # Print tar contents:
        # 1: Interpreted as relative to the root directory
        # 2: With no trailing slashes on directories
        # This is useful for ensuring that the output matches the
        # values generated by the "find" command
        ls_tar() {
          for f in $(tar -tf $1 | xargs realpath -ms --relative-to=.); do
            if [[ "$f" != "." ]]; then
              echo "/$f"
            fi
          done
        }
        mkdir image
        touch baseFiles
        if [[ -n "$fromImage" ]]; then
          echo "Unpacking base image..."
          tar -C image -xpf "$fromImage"
          cat ./image/manifest.json  | jq -r '.[0].Layers | .[]' > layer-list
          # Do not import the base image configuration and manifest
          chmod a+w image image/*.json
          rm -f image/*.json
          if [[ -z "$fromImageName" ]]; then
            fromImageName=$(jshon -k < image/repositories|head -n1)
          fi
          if [[ -z "$fromImageTag" ]]; then
            fromImageTag=$(jshon -e $fromImageName -k \
                           < image/repositories|head -n1)
          fi
          parentID=$(jshon -e $fromImageName -e $fromImageTag -u \
                     < image/repositories)
          for l in image/*/layer.tar; do
            ls_tar $l >> baseFiles
          done
        else
          touch layer-list
        fi
        chmod -R ug+rw image
        mkdir temp
        cp ${layer}/* temp/
        chmod ug+w temp/*
        for dep in $(cat $layerClosure); do
          find $dep >> layerFiles
        done
        echo "Adding layer..."
        # Record the contents of the tarball with ls_tar.
        ls_tar temp/layer.tar >> baseFiles
        # Append nix/store directory to the layer so that when the layer is loaded in the
        # image /nix/store has read permissions for non-root users.
        # nix/store is added only if the layer has /nix/store paths in it.
        if [ $(wc -l < $layerClosure) -gt 1 ] && [ $(grep -c -e "^/nix/store$" baseFiles) -eq 0 ]; then
          mkdir -p nix/store
          chmod -R 555 nix
          echo "./nix" >> layerFiles
          echo "./nix/store" >> layerFiles
        fi
        # Get the files in the new layer which were *not* present in
        # the old layer, and record them as newFiles.
        comm <(sort -n baseFiles|uniq) \
             <(sort -n layerFiles|uniq|grep -v ${layer}) -1 -3 > newFiles
        # Append the new files to the layer.
        tar -rpf temp/layer.tar --hard-dereference --sort=name --mtime="@$SOURCE_DATE_EPOCH" \
          --owner=0 --group=0 --no-recursion --files-from newFiles
        echo "Adding meta..."
        # If we have a parentID, add it to the json metadata.
        if [[ -n "$parentID" ]]; then
          cat temp/json | jshon -s "$parentID" -i parent > tmpjson
          mv tmpjson temp/json
        fi
        # Take the sha256 sum of the generated json and use it as the layer ID.
        # Compute the size and add it to the json under the 'Size' field.
        layerID=$(sha256sum temp/json|cut -d ' ' -f 1)
        size=$(stat --printf="%s" temp/layer.tar)
        cat temp/json | jshon -s "$layerID" -i id -n $size -i Size > tmpjson
        mv tmpjson temp/json
        # Use the temp folder we've been working on to create a new image.
        mv temp image/$layerID
        # Add the new layer ID to the end of the layer list
        (
          cat layer-list
          # originally this used `sed -i "1i$layerID" layer-list`, but
          # would fail if layer-list was completely empty.
          echo "$layerID/layer.tar"
        ) | sponge layer-list
        # Create image json and image manifest
        imageJson=$(cat ${baseJson} | jq ". + {\"rootfs\": {\"diff_ids\": [], \"type\": \"layers\"}}")
        manifestJson=$(jq -n "[{\"RepoTags\":[\"$imageName:$imageTag\"]}]")
        for layerTar in $(cat ./layer-list); do
          layerChecksum=$(sha256sum image/$layerTar | cut -d ' ' -f1)
          imageJson=$(echo "$imageJson" | jq ".history |= . + [{\"created\": \"$(jq -r .created ${baseJson})\"}]")
          # diff_ids order is from the bottom-most to top-most layer
          imageJson=$(echo "$imageJson" | jq ".rootfs.diff_ids |= . + [\"sha256:$layerChecksum\"]")
          manifestJson=$(echo "$manifestJson" | jq ".[0].Layers |= . + [\"$layerTar\"]")
        done
        imageJsonChecksum=$(echo "$imageJson" | sha256sum | cut -d ' ' -f1)
        echo "$imageJson" > "image/$imageJsonChecksum.json"
        manifestJson=$(echo "$manifestJson" | jq ".[0].Config = \"$imageJsonChecksum.json\"")
        echo "$manifestJson" > image/manifest.json
        # Store the json under the name image/repositories.
        jshon -n object \
          -n object -s "$layerID" -i "$imageTag" \
          -i "$imageName" > image/repositories
        # Make the image read-only.
        chmod -R a-w image
        echo "Cooking the image..."
        tar -C image --hard-dereference --sort=name --mtime="@$SOURCE_DATE_EPOCH" --owner=0 --group=0 --xform s:'^./':: -c . | pigz -nT > $out
        echo "Finished."
      '';

    in
      result;

  MY_SUB_PROJECT_NAME-docker =  mybuildImage {
  name = "MY_SUB_PROJECT_NAME";
  tag = MY_SUB_PROJECT_NAME.version;
  
  contents = [ static-MY_SUB_PROJECT_NAME
               MY_SUB_PROJECT_NAME-env ];
  config = {
    Env = [
      "PATH=${static-MY_SUB_PROJECT_NAME}/bin:$PATH"
      "PARA1="
      "PARA2="
    ];
    User = "MY_SUB_PROJECT_NAME";
    Cmd = [ "MY_SUB_PROJECT_NAME" "/etc/MY_SUB_PROJECT_NAME/MY_SUB_PROJECT_NAME.conf" ];
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
