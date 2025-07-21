# syskit

I built `syskit` as a lightweight, modular Ansible toolkit to **inspect**, **remediate**, and **set up** Linux or Windows systems. It runs **remotely over SSH** or **locally in offline environments**.

## Purpose

Previously, I had some Bash scripts that pulled specific info during server failures like one I recently pushed to GitHub called network-debug.sh. It’s fully focused on grabbing the most common network details, step-by-step, to track down root causes.

I’ve got more scripts for stuff like disk and processes too. But now I’m thinking bigger-modular. I considered Go, but then remembered Ansible supports roles, which nails the modular need and comes with a solid ecosystem. Best part? Everything’s in YAML, and I can still drop in my Bash logic if I want.

I’m designing it to do more than just debug. If it detects common issues, I can hook in workflows to automatically fix stuff. It runs offline, no network needed, and with Ansible, I can load it across multiple servers easy.

It’s all built to be modular, so I can add new logic later or tailor it for specific use cases. That’s why I’m going hard on roles: so I can quickly build out debug and remediation workflows for whatever pops up.

---

## Use Cases

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
