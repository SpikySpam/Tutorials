![Qubes OS](_assets/images/qubes_os.png)
# 017. ProxMox ➡️ Qubes OS

## ⚠️ Disclaimer

QubesOS is all about security which is pretty much obsolete when installed as a VM.

<!-- ## Video

In this Tutorial we are going to install the Qubes OS as a ProxMox Virtual Machine.
This will be a quick video just to get things setup...

[![Video](_assets/images/qubes-video.png)](https://youtu.be/XXXXXXXXXXXXXXXXXXXXXXXXXXX) -->

## Links

- [Qubes ISO](https://www.qubes-os.org/downloads/)
- [Background Music](https://freesound.org/people/Migfus20/sounds/560446/)

## Installation

- **Download Qubes** from [here](https://mirrors.edge.kernel.org/qubes/iso/Qubes-R4.1.2-x86_64.iso)
- **Upload** the ISO to the Proxmox machine.
- **Create** a new **VM** 
  - Select ISO-file
  - Other as Guest OS
  - Qemu Agent
  - 64GB Disk Size
  - 2x3 CPU
  - 8192 RAM
  
- **Start** the VM
- Choose **Install Qubes OS**
- Choose your **Language**
- Choose your **Keyboard Layout**
- Choose your **Timezone**
- Set **Root Password**
- Click **User creation** and **Add** a normal **User**
- Select **Installation Destination**
  - Automatic partitioning
  - Done
- Click **Begin Installation**
- Click **Reboot System**

## Setup

- Click **System - Qubes OS**
- Leave everything to it's **Default** value
- Click **Done**
- Then, click the **Finish configuration** button
- Nevermind the **Error** messages. This is because we are virtualizing Qubes into Proxmox.
- **Login** into Qubes

## Finish

- **Play around**
