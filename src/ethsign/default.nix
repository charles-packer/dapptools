{ stdenv, buildGoPackage, fetchFromGitHub, fetchgit, go-ethereum, clang}:

buildGoPackage rec {
  name = "ethsign-${version}";
  version = "0.15.0";

  goPackagePath = "github.com/dapphub/ethsign";
  hardeningDisable = ["fortify"];
  src = ./.;

  extraSrcs = [
    {
      goPackagePath = "github.com/ethereum/go-ethereum";
      src = go-ethereum.src;
    }
    {
      goPackagePath = "github.com/celo-org/celo-blockchain";
      src = fetchFromGitHub {
        owner = "celo-org";
        repo = "celo-blockchain";
        rev = "v1.3.0";
        sha256 = "0lwli3rj91zvia4bb09s6cix4wimy5x7dk1qwl221k266x23h89l";
      };
    }
    {
      goPackagePath = "github.com/VictoriaMetrics/fastcache";
      src = fetchFromGitHub {
        owner = "VictoriaMetrics";
        repo = "fastcache";
        rev = "v1.5.7";
        sha256 = "19fsx8ha2kdjbsinlllz70fj96z6xhvn38x8qrmml0abmsf5z60k";
      };
    }
    {
      goPackagePath = "github.com/aristanetworks/goarista";
      src = fetchFromGitHub {
        owner = "aristanetworks";
        repo = "goarista";
        rev = "ockafka-v0.0.5";
        sha256 = "0qhmn83cny1299rli2x8n2rw844gfwscsldrnl107vi8mv88r0xw";
      };
    }
    {
      goPackagePath = "gopkg.in/urfave/cli.v1";
      src = fetchFromGitHub {
        owner = "urfave";
        repo = "cli";
        rev = "v1.19.1";
        sha256 = "1ny63c7bfwfrsp7vfkvb4i0xhq4v7yxqnwxa52y4xlfxs4r6v6fg";
      };
    }
    {
      goPackagePath = "golang.org/x/crypto";
      src = fetchgit {
        url = "https://go.googlesource.com/crypto";
        rev = "94eea52f7b742c7cbe0b03b22f0c4c8631ece122";
        sha256 = "095zyvjb0m2pz382500miqadhk7w3nis8z3j941z8cq4rdafijvi";
      };
    }
    {
      goPackagePath = "golang.org/x/sys";
      src = fetchgit {
        url = "https://go.googlesource.com/sys";
        rev = "53aa286056ef226755cd898109dbcdaba8ac0b81";
        sha256 = "1yd17ccklby099cpdcsgx6lf0lj968hsnppp16mwh9009ldf72r1";
      };
    }
  ];

  meta = with stdenv.lib; {
    homepage = http://github.com/dapphub/dapptools;
    description = "Make raw signed Ethereum transactions";
    license = [licenses.agpl3];
  };
}
