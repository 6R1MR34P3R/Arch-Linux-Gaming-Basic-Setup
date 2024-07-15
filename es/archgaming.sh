#!/bin/bash

echo "Bienvenido a la guía de instalación para gaming en Arch Linux. Este script te guiará a través de los pasos necesarios."

# Actualizar el sistema
echo "Actualizando tu sistema..."
sudo pacman -Syu

# Habilitar el repositorio multilib
echo "Habilitando el repositorio multilib..."
sudo sed -i '/\[multilib\]/,/Include/'"'s/^#//'"' /etc/pacman.conf
sudo pacman -Sy

# Selección de drivers de GPU
echo "Selecciona tus drivers de GPU:"
echo "1) Nvidia"
echo "2) AMD"
echo "3) Intel"
read -p "Opción (1/2/3): " gpu_option

case $gpu_option in
  1)
    echo "Instalando drivers para Nvidia..."
    sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
    
    ;;
  2)
    echo "Instalando drivers para AMD..."
    sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-radeon lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos lib32-vulkan-radeon
    ;;
  3)
    echo "Instalando drivers para Intel..."
    sudo pacman -S mesa lib32-mesa libva-mesa-driver mesa-vdpau opengl-mesa vulkan-mesa-layers mesa-demos vulkan-tools vulkan-intel lib32-libva-mesa-driver lib32-mesa-vdpau lib32-opengl-mesa lib32-vulkan-mesa-layers lib32-mesa-demos
    ;;
  *)
    echo "Opción no válida."
    exit 1
    ;;
esac

# Instalar el Kernel Zen
echo "¿Deseas instalar el Kernel Zen para un mejor rendimiento en juegos? (s/n)"
read -p "Respuesta: " zen_kernel

if [[ $zen_kernel == "s" ]]; then
  echo "Instalando Kernel Zen..."
  sudo pacman -S linux-zen linux-zen-headers
  sudo grub-mkconfig -o /boot/grub/grub.cfg
fi

# Instalar Wine Staging
echo "Instalando Wine Staging y dependencias..."
sudo pacman -S wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader

# Herramientas de optimización y aplicaciones de gaming

# Mangohud es una herramienta que muestra información de rendimiento en pantalla mientras juegas. 
echo "¿Deseas instalar Mangohud? (s/n)"
read -p "Respuesta: " mangohud

if [[ $mangohud == "s" ]]; then
  echo "Instalando Mangohud..."
  sudo pacman -S mangohud
fi

# Goverlay es una aplicación GUI que te permite ajustar la configuración mangohud de forma fácil y rápida.
echo "¿Deseas instalar Goverlay? (s/n)"
read -p "Respuesta: " goverlay

if [[ $goverlay == "s" ]]; then
  echo "Instalando Goverlay..."
  sudo pacman -S goverlay
fi

# Gamemode es una herramienta que optimiza el rendimiento de los juegos en Linux ajustando automáticamente la configuración del sistema.
echo "¿Deseas instalar Gamemode? (s/n)"
read -p "Respuesta: " gamemode

if [[ $gamemode == "s" ]]; then
  echo "Instalando Gamemode..."
  sudo pacman -S gamemode lib32-gamemode
fi

# vkBasalt es una capa de compatibilidad que mejora la calidad visual de los juegos de Vulkan.
echo "¿Deseas instalar vkBasalt? (s/n)"
read -p "Respuesta: " vkbasalt

if [[ $vkbasalt == "s" ]]; then
  echo "Instalando vkBasalt..."
  sudo pacman -S vkbasalt
fi

# Steam es una plataforma de distribución digital de videojuegos y servicios multijugador desarrollada por Valve Corporation.
echo "¿Deseas instalar Steam? (s/n)"
read -p "Respuesta: " steam

if [[ $steam == "s" ]]; then
  echo "Instalando Steam..."
  sudo pacman -S steam
fi

# Lutris es una plataforma de preservación de videojuegos que te permite gestionar y ejecutar juegos de diferentes plataformas en GNU/Linux.
echo "¿Deseas instalar Lutris? (s/n)"
read -p "Respuesta: " lutris

if [[ $lutris == "s" ]]; then
  echo "Instalando Lutris..."
  sudo pacman -S lutris
fi

# protonup-qt es una herramienta que facilita la instalación y actualización de la capa de compatibilidad Proton y Wine para varias plataformas.
echo "¿Deseas instalar protonup-qt? (s/n)"
read -p "Respuesta: " protonup_qt

if [[ $protonup_qt == "s" ]]; then
  echo "Instalando protonup-qt..."
  yay -S protonup-qt
fi

# Heroic Games Launcher es una aplicación que te permite jugar juegos de Epic Games Store, GOG, y Amazon Prime Gaming en GNU/Linux.
echo "¿Deseas instalar Heroic Games Launcher? (s/n)"
read -p "Respuesta: " heroic_launcher

if [[ $heroic_launcher == "s" ]]; then
  echo "Instalando Heroic Games Launcher..."
  yay -S heroic-games-launcher
fi

# Configuración de Optimus Manager para sistemas con NVIDIA Optimus
echo "¿Tienes un sistema con NVIDIA Optimus y deseas instalar Optimus Manager? (s/n)"
read -p "Respuesta: " optimus_manager

if [[ $optimus_manager == "s" ]]; then
    echo "Instalando Optimus Manager y Optimus Manager QT..."
    yay -S optimus-manager optimus-manager-qt

    if [[ -f /etc/gdm/custom.conf ]]; then
        echo "¿Usas GDM como gestor de inicio? (s/n)"
        read -p "Respuesta: " gdm

        if [[ $gdm == "s" ]]; then
            echo "Instalando GDM-Prime..."
            yay -S gdm-prime
        fi
    fi
fi
fi

echo "Instalación y configuración completadas. Por favor, reinicia tu sistema para aplicar todos los cambios."