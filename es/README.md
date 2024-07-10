
# Guía de Instalación para Arch Linux Gaming

Esta guía te ayudará a configurar un sistema Arch Linux optimizado para juegos. Incluye la instalación de drivers, herramientas de gestión de GPU, y otros componentes necesarios para una experiencia de juego fluida.

## 1. Instalación de Drivers Nvidia

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

## 2. Instalación de Controladores de Mesa AMD

```bash
sudo pacman -S mesa lib32-mesa
```

```bash
sudo pacman -S libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-radeon
```

```bash
sudo pacman -S lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos lib32-vulkan-radeon
```

## 3. Instalación de Controladores de Mesa Intel

```bash
sudo pacman -S mesa lib32-mesa
```

```bash
sudo pacman -S libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-intel
```

```bash
sudo pacman -S lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
```

## 4. Verificar la Versión de Mesa Instalado

```bash
glxinfo | grep "OpenGL version"
```

## 5. Instalación del Kernel Zen

```bash
sudo pacman -S linux-zen linux-zen-headers
```

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## 6. Instalación de Optimus Manager y Optimus Manager QT (AUR)

Para gestionar múltiples GPUs en tu sistema, puedes instalar **Optimus Manager** y **Optimus Manager QT** desde AUR.

```bash
yay -S optimus-manager optimus-manager-qt
```

También puedes optar por instalar **`optimus-manager-qt-git`** si prefieres la versión más reciente del paquete.

**Nota:** Si estás utilizando Plasma, se recomienda modificar el `PKGBUILD` para habilitar características adicionales de la API de KDE. Para hacerlo, edita el `PKGBUILD` y cambia `_plasma=false` a `_plasma=true` (esto añadirá dependencias adicionales).

### Advertencia

Optimus Manager **solo funciona en Xorg**, no es compatible con Wayland.

### Si utilizas GDM

Debes instalar el paquete **`gdm-prime`** y editar el archivo de configuración de GDM:

```bash
sudo pacman -S gdm-prime
```

En el archivo `/etc/gdm/custom.conf`, elimina el `#` antes de `#WaylandEnable=false` para desactivar Wayland.

### Comandos de Optimus Manager

- Para cambiar a la GPU Nvidia:

  ```bash
  optimus-manager --switch nvidia
  ```

- Para cambiar a la GPU integrada y apagar la GPU Nvidia:

  ```bash
  optimus-manager --switch integrated
  ```

- Para cambiar a la iGPU pero mantener la GPU Nvidia disponible para la descarga bajo demanda:

  ```bash
  optimus-manager --switch hybrid
  ```

**Advertencia:** Cambiar el modo hará que tu sesión se cierre automáticamente. Asegúrate de guardar tu trabajo y cerrar todas tus aplicaciones antes de ejecutar el comando.

### Bandeja de Sistema

El paquete **`optimus-manager-qt`** proporciona un icono en la bandeja del sistema para facilitar el cambio entre GPUs. También incluye una interfaz gráfica para configurar opciones sin necesidad de editar manualmente el archivo de configuración.

- **Paquete AUR:** [optimus-manager-qt](https://aur.archlinux.org/packages/optimus-manager-qt)
- **Extensiones no oficiales de Gnome Shell:**
  - [optimus-manager-argos](https://github.com/inzar98/optimus-manager-argos)
  - [optimus-manager-indicator](https://github.com/andr3slelouch/optimus-manager-indicator)

## Recursos Adicionales

- [Wiki de Arch Linux sobre NVIDIA Optimus](https://wiki.archlinux.org/title/NVIDIA_Optimus_(Espa%C3%B1ol))
- [Documentación de Mesa](https://www.mesa3d.org/)
- [Documentación de AUR](https://wiki.archlinux.org/title/Arch_User_Repository_(Espa%C3%B1ol))

¡Con estos pasos deberías estar listx para disfrutar de tus juegos en Arch Linux!
```

