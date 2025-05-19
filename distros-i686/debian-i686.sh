DISTRO_NAME="Debian i686 (bookworm)"
DISTRO_COMMENT="Stable release."
DISTRO_ARCH="i686"

TARBALL_URL['i686']="https://github.com/termux/proot-distro/releases/download/v4.17.3/debian-bookworm-i686-pd-v4.17.3.tar.xz"
TARBALL_SHA256['i686']="1fb3a6b0ea679e3797b35984049abf22bfe3b6ab79e9bb98cdfc54994712e1e4"

distro_setup() {
	# Configure en_US.UTF-8 locale.
	sed -i -E 's/#[[:space:]]?(en_US.UTF-8[[:space:]]+UTF-8)/\1/g' ./etc/locale.gen
	run_proot_cmd DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
}

