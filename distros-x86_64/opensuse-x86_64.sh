DISTRO_NAME="OpenSUSE x86_64"
DISTRO_COMMENT="Rolling release (Tumbleweed)."
DISTRO_ARCH="x86_64"

TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v4.21.0/opensuse-x86_64-pd-v4.21.0.tar.xz"
TARBALL_SHA256['x86_64']="cfb70fe5acd74928f5573a59ac038eff91f1bd4c6a95cc00e69424e6f3ae89b3"

distro_setup() {
	# Lock package filesystem to remove issues regarding zypper dup
	run_proot_cmd zypper al filesystem
}
