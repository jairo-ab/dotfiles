# Arch Linux Install

Esse é o meu guia de instalação, não recomendo que você siga a não ser que saiba o que está fazendo, quer instalar o Arch Linux, siga o [Guia de Instalação](https://wiki.archlinux.org/index.php/Installation_guide_(Portugu%C3%AAs))

### Layout do Teclado ABNT2:

```
loadkeys br-abnt2
```

### Mudar o tamanho da fonte:

```
setfont lat4-19
```

### Selecionar um Rede Wifi, siga os passos abaixo:

### Para obter um prompt interativo

```
iwctl
```

### Para listar os dispositivos

```
[iwd]# device list
```

### Para buscar redes disponiveis

```
[iwd]# station dispositivo scan
```

#### Por fim, para se conectar a uma rede

### OBS: Use aspas caso o nome da rede tenha espaços

```
iwctl --passphrase <senha> station dispositivo connect <SSID>
```
### Testando a conexão

```
ping archlinux.org
```

### Ver partições do disco

```
fdisk -l
```

### Criar partições:

```
cfdisk
```

### Formatar partições:

```
mkfs.ext4 /dev/partição_raiz

```

### Caso você tenha criado uma partição para swap, inicialize-a com [mkswap](https://man.archlinux.org/man/mkswap.8)

```
mkswap /dev/partição_swap

```

#### Vamos montar as partições:

### Partição raíz

```
mount /dev/partição_raiz /mnt
```

### Partição Swap

```
swapon /dev/partição_swap
```

### Partição para o bootloader

```
mkdir -p /mnt/boot/efi && mount /dev/partição_efi /mnt/boot/efi
```

### E caso você tenha criado sua home separada, faça da seguinte maneira

```
mkdir -p /mnt/home && mount /dev/partição_home /mnt/home
```

### Instalar os pacotes base:

```
pacstrap /mnt base networkmanager vim linux-firmware base-devel
```

### Fstab:

```
genfstab -U /mnt >> /mnt/etc/fstab
```

### Entrar no chroot:

```
arch-chroot /mnt
```

### Habilitar rede dhcpcd:

```
systemctl enable NetworkManager
```

### Definir o fuso horário do sistema:

```
ln -sf /usr/share/zoneinfo/America/Manaus /etc/localtime
hwclock --systohc
timedatectl set-ntp true
```

### Alterando o idioma do sistema:

```
vim /etc/locale.gen
Descomenta a linha: #pt_BR.UTF-8
locale-gen
echo LANG=pt_BR.UTF-8 > /etc/locale.conf
export LANG=pt_BR.UTF-8
```

### Configurar o teclado para subir em PT-BR:

```
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
```

### Colocar nome host:

```
echo jairo > /etc/hostname ou echo arch > /etc/hostname
```

### Baixar kernels (sua preferência):

```
pacman -S linux linux-headers ➜ Kernel Stable (default)
pacman -S linux-hardened linux-hardened-headers ➜ Kernel focado na segurança
pacman -S linux-lts linux-lts-headers ➜ Kernel a longo prazo
pacman -S linux-zen linux-zen-headers ➜ Kernel focado em desempenho
```

### Configurar pacman.conf:

```
vim /etc/pacman.conf
Descomentar linhas: 
#multilib
#incluide
```

### Sincronizar repositórios:

```
pacman -Syy
```

### Senha root:

```
passwd
```

### Criar user:

```
Se você usa zsh você pode fazer assim:

pacman -S zsh 

useradd -m -g users -s /bin/zsh <user>

Se você usa bash pode fazer assim:

useradd -m -g users -s /bin/bash <user>
```

### Criar senha para o user:

```
passwd USER
```

### Editar arquivo sudo:

```
vim /etc/sudoers

Embaixo da linha:

root ALL=(ALL) ALL

Você adiciona seu user:

<user> ALL=(ALL) ALL

```

### Grub - UEFI

```
pacman -S grub efibootmgr 
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Grub_Arch --recheck
```

### Caso se tiver outro sistema Linux e Windows:

```
pacman -S os-prober ntfs-3g 
```

### Atualizar o arquivo do Grub:

```
grub-mkconfig -o /boot/grub/grub.cfg
```

### Interface Gráfica

### Primeiro identifique sua placa
```
lspci | grep -e VGA -e 3D
```

### Baixar Xorg
```
pacman -S xorg-server xorg-apps xorg-xinit 
```

### De acordo com sua placa, instale o driver apropriado

### Para intel

```
pacman -S xf86-video-intel
```

### Baixar AMD (antiga):

```
pacman -S xf86-video-ati 
```

### Baixar AMD (nova):

```
pacman -S xf86-video-amdgpu 
```

### Baixar alguns pacotes:

```
sudo pacman -S ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono xclip usbutils wget 
```

### Fontes para emojis:
```
sudo pacman -S ttf-joypixels (Fonte proprietária)

sudo pacman -S noto-fonts-emoji (Fonte Open Source)
```

### Para Áudio
```
pacman -S pulseaudio paprefs pavucontrol

```
### O PulseAudio pode ser iniciado usando:
```
pulseaudio --start
```

### Ou se você instalou o X11
```
start-pulseaudio-x11
```