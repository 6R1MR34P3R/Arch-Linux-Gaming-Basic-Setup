# Arch Linux Gaming Installation Guide

This guide will help you set up an Arch Linux system optimized for gaming. It includes steps for installing drivers, GPU management tools, and other components needed for a smooth gaming experience.

## 1. Installing Nvidia Drivers

```bash
sudo mhwd -a pci nonfree 0300
```

```bash
sudo pacman -S mesa
```

```bash
sudo pacman -S lib32-mesa
```

```bash
sudo pacman -S libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools
```

```bash
sudo pacman -S lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
```

## 2. Installing AMD Mesa Drivers

```bash
sudo pacman -S mesa lib32-mesa
```

```bash
sudo pacman -S libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-radeon
```

```bash
sudo pacman -S lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos lib32-vulkan-radeon
```

## 3. Installing Intel Mesa Drivers

```bash
sudo pacman -S mesa lib32-mesa
```

```bash
sudo pacman -S libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-intel
```

```bash
sudo pacman -S lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
```

## 4. Checking Installed Mesa Version

```bash
glxinfo | grep "OpenGL version"
```

## 5. Installing the Zen Kernel

```bash
sudo pacman -S linux-zen linux-zen-headers
```

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## 6. Installing Optimus Manager and Optimus Manager QT (AUR)

To manage multiple GPUs on your system, you can install **Optimus Manager** and **Optimus Manager QT** from AUR.

```bash
yay -S optimus-manager optimus-manager-qt
```

You may also opt to install **`optimus-manager-qt-git`** if you prefer the latest version of the package.

**Note:** If you are using Plasma, it is recommended to modify the `PKGBUILD` to enable additional KDE API features. To do this, edit the `PKGBUILD` and change `_plasma=false` to `_plasma=true` (this will add additional dependencies).

### Warning

Optimus Manager **only works on Xorg**, it is not compatible with Wayland.

### If You Are Using GDM

You need to install the **`gdm-prime`** package and edit the GDM configuration file:

```bash
sudo pacman -S gdm-prime
```

In the `/etc/gdm/custom.conf` file, remove the `#` before `#WaylandEnable=false` to disable Wayland.

### Optimus Manager Commands

- To switch to the Nvidia GPU:

  ```bash
  optimus-manager --switch nvidia
  ```

- To switch to the integrated GPU and turn off the Nvidia GPU:

  ```bash
  optimus-manager --switch integrated
  ```

- To switch to the iGPU but keep the Nvidia GPU available for on-demand rendering:

  ```bash
  optimus-manager --switch hybrid
  ```

**Warning:** Switching modes will automatically log you out of your session. Be sure to save your work and close all applications before running the command.

### System Tray Icon

The **`optimus-manager-qt`** package provides a system tray icon to easily switch between GPUs. It also includes a graphical user interface for configuring options without manually editing the configuration file.

- **AUR Package:** [optimus-manager-qt](https://aur.archlinux.org/packages/optimus-manager-qt)
- **Unofficial Gnome Shell Extensions:**
  - [optimus-manager-argos](https://github.com/inzar98/optimus-manager-argos)
  - [optimus-manager-indicator](https://github.com/andr3slelouch/optimus-manager-indicator)

## Additional Resources

- [Arch Linux Wiki on NVIDIA Optimus](https://wiki.archlinux.org/title/NVIDIA_Optimus)
- [Mesa Documentation](https://www.mesa3d.org/)
- [AUR Documentation](https://wiki.archlinux.org/title/Arch_User_Repository)

With these steps, you should be ready to enjoy your gaming experience on Arch Linux!
