DISTRO_NAME="Fedora x86_64"
DISTRO_COMMENT="Version 40."
DISTRO_ARCH="x86_64"

TARBALL_URL['x86_64']="https://github.com/termux/proot-distro/releases/download/v4.24.0/fedora-x86_64-pd-v4.24.0.tar.xz"
TARBALL_SHA256['x86_64']="105ffd9a7d989ac09ee3adb7c4f00b72a3cc997c1e3fd99599bf16578dd8e20c"

distro_setup() {
	# Fix environment variables on login or su.
	run_proot_cmd authselect opt-out
	echo "session  required  pam_env.so readenv=1" >> ./etc/pam.d/system-auth
}
