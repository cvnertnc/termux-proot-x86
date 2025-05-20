# Termux PRoot x86
Getting x86_64 and i686 PRoot Env working in Termux with proot-distro and qemu-user-(x86_64, i386) or blink.

**NOTE: SLOW PERFORMANCE IN EVERY DEVICE** but you can use `taskset -a -c 4-7 (your proot-distro command)` to little improve performance (only if u have 8 cores)

To run proot-distro with blink use `PROOT_DISTRO_X64_EMULATOR=BLINK`.

## One-Line Installation

Just run the following command and choose your architecture from the menu:

```bash
curl -LSs "https://raw.githubusercontent.com/cvnertnc/termux-proot-x86/main/setup.sh" | bash
```

You'll be prompted to select:

1. **amd64 / x86\_64**
2. **i686 / x86**
3. **Both architectures**
4. **Uninstall everything and clean up**

After setup, you can list and install available distros with:

```bash
proot-distro list
proot-distro install <distro-name>
```

## Thanks

[mcagabe19](https://github.com/mcagabe19)
[HomuHomu833](https://github.com/HomuHomu833)
