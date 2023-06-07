{
  lib,
  stdenv,
  fetchzip,
  libtermkey,
  unibilium,
  libtool,
}:

stdenv.mkDerivation rec {
  pname = "libtickit";
  version = "0.4.3";

  src = fetchzip {
    url = "https://www.leonerd.org.uk/code/libtickit/libtickit-${version}.tar.gz";
    sha256 = "sha256-dKjmHojZBPP0ZQGXsno+2nFf1GCNmljWF2FklCMGCos=";
  };

  patches = [./Makefile.diff];

  makeFlags = ["PREFIX=$(out)"];

  buildInputs = [libtermkey unibilium libtool];

  meta = with lib; {
    description = ''
      Terminal Interface Construction Kit
    '';
    homepage = "https://www.leonerd.org.uk/code/libtickit/";
    license = licenses.mit;
  };
}
