DISTRO_NAME="Void Linux x86_64"
DISTRO_ARCH="x86_64"

TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v4.22.1/void-x86_64-pd-v4.22.1.tar.xz"
TARBALL_SHA256['x86_64']="c84e1927c584c7fa1f12662e572f6d1e2c653a4cb712faa1aaddc8e37ed46708"

distro_setup() {
	# Set default shell to bash.
	run_proot_cmd usermod --shell /bin/bash root
	# Fix issue where come CA certificates links may not be created.
	run_proot_cmd update-ca-certificates --fresh
}
