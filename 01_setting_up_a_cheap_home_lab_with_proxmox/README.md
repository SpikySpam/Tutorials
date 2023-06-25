![ProxMox](../_assets/images/proxmox.png)
# 01. Setting up a Cheap Home Lab with ProxMox

![Home Lab](_assets/images/setup_home_lab.png)

## Links

- [Installing ProxMox VE](https://pve.proxmox.com/pve-docs/chapter-pve-installation.html)
- [Download Ventoy](https://www.ventoy.net/en/download.html)

## Preparation

- Enable **Virtualization** and **Secure Boot** in your BIOS settings:
   ![BIOS Virtualization](_assets/images/bios.png)
- Download and **Unpack** the Ventoy ZIP-file and execute **Ventoy2Disk.exe**
- Insert your USB-Stick and click Install.
   ![Ventoy](_assets/images/ventoy.png)
- **Download** the latest **Proxmox VE x.x ISO Installer** ISO-file from [here](https://www.proxmox.com/en/downloads/category/iso-images-pve)
- **Copy** the **ISO-file** to your USB-Stick

## Instalation

- **Plug it in** your old laptop and **reboot** into it. Follow the Wizard:
   - Install Proxmox VE
      ![PVE Grub Menu](_assets/images/pve-grub-menu.png)
   - Configure your Hard Disk
      ![PVE Select Target Disk](_assets/images/pve-select-target-disk.png)
   - Select Country, TimeZone & Keyboard
      ![PVE Select Location](_assets/images/pve-select-location.png)
   - Choose Password (for root)
      ![PVE Set Password](_assets/images/pve-set-password.png)
   - Setup Hostname and IP-address (192.168.0.20 for this tutorial)
      ![PVE Setup Network](_assets/images/pve-setup-network.png)
   - Install
      ![PVE Install Summary](_assets/images/pve-install-summary.png)
      ![PVE Installation](_assets/images/pve-installation.png)
   - Reboot your laptop
   - You can now **navigate** to the ProxMox **web-interface** from another PC (above ip, ex. https://192.168.0.20:8006).

  ## Virtual Machines

  - [Android OS](011_android_os/README.md)
  - [macOS](012_mac_os/README.md)