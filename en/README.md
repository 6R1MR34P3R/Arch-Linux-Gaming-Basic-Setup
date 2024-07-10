## Complete Installation Guide for Gaming on Arch Linux
**Important Notice:** This guide assumes that you have a basic installation of Arch Linux, which implies basic knowledge of the system and its management through the command line. It is also assumed that you have access to the Arch User Repository (AUR) using `yay`. If you use another AUR helper, simply replace the `yay` commands with the corresponding ones for your preferred tool.

This guide will help you set up an Arch Linux system optimized for gaming. It covers everything from installing GPU drivers and management tools to installing gaming applications and utilities.

### Update Your System

Make sure your system is fully updated before starting:

```bash
$ sudo pacman -Syu
```

### Enable the Multilib Repository

To be able to install 32-bit packages on your 64-bit system, you need to enable the `multilib` repository. This is especially important for compatibility with certain games and applications.

To enable the `multilib` repository, uncomment (remove the #) on the `[multilib]` section in `/etc/pacman.conf` with your favorite text editor:
```bash
$ sudo nano /etc/pacman.conf
```
```plaintext
/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist
```

After modifying `pacman.conf`, remember to update your package list:

```bash
$ sudo pacman -Sy
```


### GPU Driver Installation

Depending on your hardware, install the corresponding drivers for Nvidia, AMD, or Intel.

#### For Nvidia GPUs

```bash
# Install the Nvidia driver
$ sudo mhwd -a pci nonfree 0300

# Install Mesa and its dependencies
$ sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
```

#### For AMD GPUs

```bash
# Install Mesa drivers for AMD
$ sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-radeon lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos lib32-vulkan-radeon
```

#### For Intel GPUs

```bash
# Install Mesa drivers for Intel
$ sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-intel lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
```

### Verify Mesa Version

Verify that the Mesa version is correctly installed:

```bash
$ glxinfo | grep "OpenGL version"
```

### Install Zen Kernel

The Zen Kernel offers better performance for games and applications.

```bash
# Install the Zen Kernel and corresponding headers
$ sudo pacman -S linux-zen linux-zen-headers

# Update the GRUB configuration file
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Install Wine Staging

The following command installs Wine Staging and essential dependencies to ensure compatibility with a wide range of Windows applications and games, including those that require 32-bit support.


```bash
$ sudo pacman -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-
libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils
lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-
plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-
turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-
libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader
lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3
gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-
icd-loader
```

This installation does not require Wine base, as Wine Staging includes all its functionalities along with experimental improvements.

### Install Optimization Tools and Gaming Applications

Below are several useful tools to enhance your gaming experience.

Before proceeding with the installation of the following tools, it is important to consider that their installation should be based on your personal preferences and specific gaming needs. Not all tools will be necessary for all users. For example, if you do not plan to play games from the Epic Games Store, GOG, or Amazon Prime Gaming, you may choose not to install **Heroic Game Launcher**. Read the descriptions of each tool in advance and decide which ones best suit your personal needs.

#### Install Mangohud

**Mangohud** is a monitoring tool to control FPS, temperatures, CPU/GPU load, and more in real-time games:

```bash
# Install Mangohud
$ sudo pacman -S mangohud
```

You can use **Mangohud** by adding `mangohud` as a launch parameter for your games or from the terminal.

#### Install Goverlay

**Goverlay** provides a graphical interface to configure Mangohud:

```bash
# Install Goverlay
$ sudo pacman -S goverlay
```

Configure it to your liking and save the settings when you're done, the next time you run **Mangohud**, the changes will be reflected.

#### Install GameMode

**GameMode** by Feral Interactive is a tool to optimize performance in games:

```bash
# Install GameMode
$ sudo pacman -S gamemode lib32-gamemode
```

Make sure the game is configured to use GameMode, usually by adding `gamemoderun` to the game's launch command.

#### Install VkBasalt

**VkBasalt** is a post-processing middleware for Vulkan:

```bash
# Install VkBasalt
$ sudo pacman -S vkbasalt
```

#### Install Proton and Steam

**Proton** is a tool to run Windows games on Steam:

```bash
# Install Steam
$ sudo pacman -S steam

# Proton will be installed with Steam, but make sure it is enabled in the Steam settings
```

### Install ProtonUp-Qt

**ProtonUp-Qt** provides a graphical interface to install and manage multiple versions of Proton, Wine, and derivatives for most gaming platforms and launchers

```bash
# Install ProtonUp-Qt
$ yay -S protonup-qt
```
#### Install Lutris

**Lutris** is a game preservation platform for GNU/Linux that makes game installation easy:

```bash
# Install Lutris
$ sudo pacman -S lutris
```

#### Install Heroic Game Launcher

**Heroic** is an open-source application to manage and install games from the Epic Games Store, GOG, and Amazon Prime Gaming:

```bash
# Install Heroic Game Launcher
$ yay -S heroic-games-launcher
```

### Optimus Manager Configuration (For Systems with NVIDIA Optimus)

**Optimus Manager** is a tool to manage GPU switching on systems with Nvidia Optimus.

#### Install Optimus Manager and Optimus Manager QT

```bash
# Install optimus-manager and optimus-manager-qt from AUR
$ yay -S optimus-manager optimus-manager-qt
```

If you are using **GDM**, you need to install **GDM-Prime**, which is a modified version of **GDM** with patches to improve compatibility with **Optimus Manager**.

```bash
# Install gdm-prime from AUR
$ yay -S gdm-prime
```
The package **`optimus-manager-qt`** provides a system tray icon for easy GPU switching.
If you prefer the latest version directly from the development repository, you can choose to install `optimus-manager-qt-git`:

```bash
# Install optimus-manager-qt from AUR
$ yay -S optimus-manager-qt
```

**Note for Plasma users:** If you are using the KDE Plasma desktop environment, it is recommended to modify the `PKGBUILD` file during installation to enable additional features of the KDE API. To do this, replace `_plasma=false` with `_plasma=true` in the `PKGBUILD`. This will also add additional dependencies required for specific Plasma features.

#### Using Optimus Manager

Here are some useful commands to manage your GPUs with **Optimus Manager**:

```bash
# Switch to Nvidia GPU
$ optimus-manager --switch nvidia

# Switch to integrated GPU and turn off Nvidia GPU
$ optimus-manager --switch integrated

# Switch to iGPU but keep Nvidia GPU available for on-demand offloading
$ optimus-manager --switch hybrid
```

**Warning:** Switching modes will automatically close your session. Make sure to save your work and close all your applications before running the command.

### 
I hope this guide is useful and clear for setting up your Arch Linux system for gaming. If you have any further questions or suggestions, feel free to open an issue or contribute with a pull request.
