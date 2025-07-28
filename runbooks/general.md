# Runbooks – Real SRE Fixes, No Bullshit

## Why I Wrote This

I built these runbooks because during downtime, you don’t have time to guess. You need fast steps, automation that works, and clear paths to recover or debug systems.

This is for those moments when systems are down, network’s gone, services broken, and you need to get things up now.

I don’t believe in clicking around dashboards when everything’s burning. I believe in building proper Ansible roles, repeatable fixes, and runbooks that actually *do* something, not just tell you to “check logs.”

---

## What This Is

- This is a set of runbooks for handling critical incidents.
- Each one is paired with real Ansible playbooks under `syskit/`.
- You can use these to fix things manually or wire them into automated pipelines later.
- They’re all built to run even if the network’s down — bring the container, mount the toolkit, and go.

---

## How to Use

### Requirements

- Local Ansible Docker image (`ansible:latest` or your custom build)
- `syskit/` repo or volume mounted in the container
- These runbooks in `runbooks/`

### Example Use Case: Network Down

If the network is down and remote execution is useless, you should already have:

- A <1GB local Ansible Docker image bundled with `syskit` roles
- Perhaps comes with more tools I've created eg. sheet-cli, bash scripts etc.
- A CLI to run:  
  ```bash
  docker run --rm -v $PWD:/syskit ansible:latest ansible-playbook syskit/network/inspect-fix-network.yml
