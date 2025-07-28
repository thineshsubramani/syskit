### Runbook: `network-down`

#### 🔹 **Objective**

Restore network connectivity on affected hosts using automated inspection + remediation via `syskit`.

---

#### 🔹 **Prerequisites**

* Host has local access to:

  * Ansible Docker image with Python and necessary collections
  * Cloned `syskit/` repo (1GB toolkit)
* Command: `ansible-playbook syskit/playbooks/inspect-fix-network.yml` is runnable locally

---

#### 🔹 **Detection**

Check basic connectivity:

* Can’t ping gateway or external DNS
* Interface shows `DOWN` or no IP via `ip a`
* `systemd-networkd` or `NetworkManager` shows failure logs
* DNS lookup returns `NXDOMAIN` or fails

---

#### 🔹 **Execution**

If above confirmed, run locally:

```
docker run --rm -v $PWD/syskit:/syskit ansible:latest \
  ansible-playbook /syskit/network/inspect-fix-network.yml \
  -i inventory/localhost.ini -c local
```

This does:

* Check interface state
* Attempt IP renew / static fallback
* Validate DNS + default route
* Restart network stack if needed

---

#### 🔹 **Validation**

Post-execution:

* `ping 8.8.8.8` works
* `curl http://google.com` resolves + loads
* Interface is `UP` with valid IP/subnet

---

#### 🔹 **Escalation**

If issue persists:

* Validate DHCP server (if dynamic)
* Check cable/physical layer (if bare metal)
