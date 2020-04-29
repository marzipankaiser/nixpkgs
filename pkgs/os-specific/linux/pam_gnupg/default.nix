{stdenv, fetchFromGitHub, autoreconfHook, libtool, pam, gnupg }:

with stdenv.lib;

stdenv.mkDerivation rec {
  pname = "pam_gnupg";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "cruegge";
    repo = "pam-gnupg";
    rev = "v${version}";
    sha256 = "0b70mazyvcbg6xyqllm62rwhbz0y94pcy202db1qyy4w8466bhsw";
  };

  configureFlags = [
    "--with-moduledir=${placeholder "out"}/lib/security"
  ];

  buildInputs = [ pam gnupg ];

  nativeBuildInputs = [ autoreconfHook libtool ];

  meta = {
    homepage = https://github.com/cruegge/pam-gnupg;
    description = "Unlock GnuPG keys on login";
    license = licenses.gpl3;
    maintainers = with maintainers; [ "0x6d6178" ];
  };

}
