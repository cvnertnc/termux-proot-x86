DISTRO_NAME="Debian x86_64 (bookworm)"
DISTRO_COMMENT="Stable release."
DISTRO_ARCH="x86_64"

TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v4.17.3/debian-bookworm-x86_64-pd-v4.17.3.tar.xz"
TARBALL_SHA256['x86_64']="675e534333adcbf369e97abda3088927651e5d91612ae5727c52ff2284f4b8c8"

distro_setup() {
	# Configure en_US.UTF-8 locale.
	sed -i -E 's/#[[:space:]]?(en_US.UTF-8[[:space:]]+UTF-8)/\1/g' ./etc/locale.gen
	run_proot_cmd DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
}

