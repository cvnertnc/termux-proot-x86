DISTRO_NAME="OpenSUSE i686"
DISTRO_COMMENT="Rolling release (Tumbleweed)."
DISTRO_ARCH="i686"

TARBALL_URL['i686']="https://github.com/termux/proot-distro/releases/download/v4.21.0/opensuse-i686-pd-v4.21.0.tar.xz"
TARBALL_SHA256['i686']="e7e2f24928bd44dd270cd503257697517b1284ae57ea18aa5a6f66cd1857d5fa"

distro_setup() {
	# Lock package filesystem to remove issues regarding zypper dup
	run_proot_cmd zypper al filesystem
}
