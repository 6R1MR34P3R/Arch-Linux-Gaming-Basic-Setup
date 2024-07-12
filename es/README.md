## Guía Completa de Instalación para Gaming en Arch Linux
**Aviso importante:** Esta guía presupone que cuentas con una instalación básica de Arch Linux, lo cual implica conocimientos básicos del sistema y su manejo a través de la línea de comandos. Se asume también que tienes acceso al Arch User Repository (AUR) mediante el uso de `yay`. Si utilizas otro ayudante de AUR, simplemente reemplaza los comandos de `yay` por los correspondientes a tu herramienta de preferencia.

Esta guía te ayudará a configurar un sistema Arch Linux optimizado para gaming. Abarca desde la instalación de drivers y herramientas de gestión de GPU hasta la instalación de aplicaciones de gaming y utilidades.

### Actualiza tu Sistema

Asegúrate de que tu sistema esté completamente actualizado antes de comenzar:

```bash
$ sudo pacman -Syu
```

### Habilitar el Repositorio Multilib

Para poder instalar paquetes de 32 bits en tu sistema de 64 bits, es necesario habilitar el repositorio `multilib`. Esto es especialmente importante para la compatibilidad con ciertos juegos y aplicaciones.

Para habilitar el repositorio `multilib`, descomenta (quitando el #)  de la sección `[multilib]` en `/etc/pacman.conf`con tu editor de texto favorito:
```bash
$ sudo nano /etc/pacman.conf
```
```plaintext
/etc/pacman.conf
--------------------------------------------------------------------------------------
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Después de modificar `pacman.conf`, recuerda actualizar tu lista de paquetes:

```bash
$ sudo pacman -Sy
```


### Instalación de Drivers de GPU

Dependiendo de tu hardware, instala los drivers correspondientes para Nvidia, AMD o Intel.

#### Para GPUs Nvidia

```bash
# Instala el driver Nvidia
$ sudo pacman -Syu nvidia-dkms

# Instala Mesa y sus dependencias
$ sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
```

#### Para GPUs AMD

```bash
# Instala los drivers de Mesa para AMD
$ sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-radeon lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos lib32-vulkan-radeon
```

#### Para GPUs Intel

```bash
# Instala los drivers de Mesa para Intel
$ sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-intel lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
```

### Verificar la Versión de Mesa

Verifica que la versión de Mesa esté correctamente instalada:

```bash
$ glxinfo | grep "OpenGL version"
```

### Instalar el Kernel Zen

El Kernel Zen ofrece un mejor rendimiento para juegos y aplicaciones.

```bash
# Instala el Kernel Zen y los headers correspondientes
$ sudo pacman -S linux-zen linux-zen-headers

# Actualiza el archivo de configuración de GRUB
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Instalar Wine Staging

El comando a continuación instala Wine Staging y dependencias esenciales para garantizar la compatibilidad con una amplia variedad de aplicaciones y juegos de Windows, incluidas aquellos que requieran soporte de 32 bits.


```bash
$ sudo pacman -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader
```

Esta instalación no requiere Wine base, ya que Wine Staging incluye todas sus funcionalidades además de las mejoras experimentales.

### Instalar Herramientas de Optimización y Aplicaciones de Gaming

A continuación, se detallan varias herramientas útiles para mejorar tu experiencia de gaming.

Antes de proceder con la instalación de las siguientes herramientas, es importante considerar que su instalación debe basarse en tus preferencias personales y necesidades específicas de gaming. No todas las herramientas serán necesarias para todos los usuarios. Por ejemplo, si no planeas jugar títulos de la Epic Games Store, GOG, o Amazon Prime Gaming, podrías optar por no instalar **Heroic Game Launcher**. Lee con antelación las descripciones de cada herramienta y decide cuáles se ajustan mejor a tus necesidades personales.

#### Instalar Mangohud

**Mangohud** es una herramienta de monitoreo para controlar los FPS, las temperaturas, la carga de la CPU/GPU y mucho más en juegos en tiempo real:

```bash
# Instala Mangohud
$ sudo pacman -S mangohud
```

Puedes utilizar **Mangohud** agregando `mangohud` como parametro de lanzamiento de tus juegos o desde la terminal.

#### Instalar Goverlay

**Goverlay** proporciona una interfaz gráfica para configurar Mangohud:

```bash
# Instala Goverlay
$ sudo pacman -S goverlay
```

Configuralo a tu gusto y guarda los ajustes cuando acabes, la proxima vez que ejecutes **Mangohud** los cambios se veran reflejados.

#### Instalar GameMode

**GameMode** de Feral Interactive es una herramienta para optimizar el rendimiento en juegos:

```bash
# Instala GameMode
$ sudo pacman -S gamemode lib32-gamemode
```

Asegúrate de que el juego esté configurado para usar GameMode, normalmente añadiendo `gamemoderun` al comando de lanzamiento del juego.

#### Instalar VkBasalt

**VkBasalt** es un middleware de post-procesamiento para Vulkan:

```bash
# Instala VkBasalt
$ sudo pacman -S vkbasalt
```

#### Instalar Proton y Steam

**Proton** es una herramienta para ejecutar juegos de Windows en Steam:

```bash
# Instala Steam
$ sudo pacman -S steam

# Proton se instalará con Steam, pero asegúrate de que esté habilitado en la configuración de Steam
```

### Instalar ProtonUp-Qt

**PrtonUp-Qt** proporciona una interfaz gráfica para instalar y gestionar multiples versiones de Proton, Wine y derivados para la mayoria de plataformas y lanzadores de juego

```bash
# Instala ProtonUp-Qt
$ yay -S protonup-qt
```
#### Instalar Lutris

**Lutris** es una plataforma de preservación de juegos para GNU/Linux que facilita la instalación de juegos:

```bash
# Instala Lutris
$ sudo pacman -S lutris
```

#### Instalar Heroic Game Launcher

**Heroic** es una aplicación de código abierto para gestionar e instalar juegos de Epic Games Store, GOG y Amazon Prime Gaming:

```bash
# Instala Heroic Game Launcher
$ yay -S heroic-games-launcher
```

### Configuración de Optimus Manager (Para Sistemas con NVIDIA Optimus)

**Optimus Manager** es una herramienta para gestionar la conmutación entre GPUs en sistemas con Nvidia Optimus.

#### Instalar Optimus Manager y Optimus Manager QT

```bash
# Instala optimus-manager y optimus-manager-qt desde AUR
$ yay -S optimus-manager optimus-manager-qt
```

Si usas **GDM** debes instalar **GDM-Prime**, que es una versión modificada de **GDM** con parches para mejorar la compatibilidad con **Optimus Manager**.

```bash
# Instala gdm-prime desde AUR
$ yay -S gdm-prime
```
El paquete **`optimus-manager-qt`** proporciona un icono en la bandeja del sistema para facilitar el cambio entre GPUs.
Si prefieres la versión más reciente directamente del repositorio de desarrollo, puedes optar por instalar `optimus-manager-qt-git`:

```bash
# Instala optimus-manager-qt desde AUR
$ yay -S optimus-manager-qt
```

**Nota para usuarios de Plasma:** Si estás utilizando el entorno de escritorio KDE Plasma, se recomienda modificar el archivo `PKGBUILD` durante la instalación para habilitar características adicionales de la API de KDE. Para hacerlo, reemplaza `_plasma=false` por `_plasma=true` en el `PKGBUILD`. Esto también añadirá dependencias adicionales necesarias para las características específicas de Plasma.

#### Usar Optimus Manager

Aquí tienes algunos comandos útiles para gestionar tus GPUs con **Optimus Manager**:

```bash
# Cambiar a la GPU Nvidia
$ optimus-manager --switch nvidia

# Cambiar a la GPU integrada y apagar la GPU Nvidia
$ optimus-manager --switch integrated

# Cambiar a la iGPU pero mantener la GPU Nvidia disponible para descarga bajo demanda
$ optimus-manager --switch hybrid
```

**Advertencia:** Cambiar de modo cerrará automáticamente tu sesión. Asegúrate de guardar tu trabajo y cerrar todas tus aplicaciones antes de ejecutar el comando.

### 
Espero que esta guía te sea útil y clara para configurar tu sistema Arch Linux para gaming. Si tienes más preguntas o sugerencias, no dudes en abrir un issue o contribuir con un pull request.
---


