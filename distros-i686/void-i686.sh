DISTRO_NAME="Void Linux i686"
DISTRO_ARCH="i686"

TARBALL_URL['i686']="https://github.com/termux/proot-distro/releases/download/v4.22.1/void-i686-pd-v4.22.1.tar.xz"
TARBALL_SHA256['i686']="69903dd6ea907a17a3be43ef8163d8146227c557919058b9b014102a857f8dfa"

distro_setup() {
	# Set default shell to bash.
	run_proot_cmd usermod --shell /bin/bash root
	# Fix issue where come CA certificates links may not be created.
	run_proot_cmd update-ca-certificates --fresh
}
