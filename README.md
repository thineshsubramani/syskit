# syskit

I built `syskit` as a lightweight, modular Ansible toolkit to **inspect**, **remediate**, and **set up** Linux or Windows systems. It runs **remotely over SSH** or **locally in offline environments** without needing heavy dependencies.

This is made for SREs, DevOps engineers, or sysadmins who need to quickly debug, harden, or bootstrap a machine.

---

## Why I Built This

* I wanted something minimal and efficient.
* It had to work in both connected and air-gapped environments.
* I needed full control to debug issues, patch systems, or bootstrap a new server fast.

---

## Key Features

### System Inspection

* Check DNS resolver configs (`/etc/resolv.conf`, `systemd-resolved`, `NetworkManager`, etc.)
* List active DNS services (bind9, dnsmasq, resolvconf, etc.)
* Print and collect system facts (network, CPU, memory)

### Remediation

* Reset broken DNS setups (optional)
* Patch known misconfigs
* Enable/disable system services

### Setup & Bootstrap

* Install required packages
* Enable networking configs
* Prepare system for automation (SSH, Ansible, logs, etc.)

---

## How to Use

### Local (Offline) 
 - planning to add container which execute this playbooks or extending ansible runner 

```bash
ansible-playbook -i inventories/localhost -c local playbooks/inspect-network.yml
```

### Remote (SSH)

```bash
ansible-playbook -i inventories/remote_hosts playbooks/inspect-network.yml
```

Make sure you have SSH keys or proper auth configured.

---

## Project Structure

```
syskit/
├── ansible.cfg
├── inventories/
│   ├── localhost
│   └── remote_hosts
├── playbooks/
│   ├── inspect-network.yml
│   └── setup.yml
├── roles/
│   ├── inspect/
│   │   ├── tasks/
│   │   ├── files/
│   │   └── templates/
│   ├── remediate/
│   └── setup/
```

---

## Requirements

* Ansible >= 2.10
* Python >= 3.6
* For remote: SSH access + user with sudo

---

## Roadmap

* Add more inspection/remediation
* Add `collect` role for exporting system metadata
