<p align="center">
  <img src="https://miro.medium.com/v2/resize:fit:4800/format:webp/1*yYAypHYu_kEGbc-BreWzkw.png" alt="Firedancer Node Visual Guide">
</p>

# Firedancer Node Deployment Guide

**Firedancer is early stage software and should only be deployed on testnet / devnet now. Please do not deploy on mainnet yet.**

## Overview
This guide provides instructions for deploying Firedancer nodes using Ansible. Ansible is an open-source automation tool that can be used for configuration management and application deployment.


## Pre-requisites
Before running the playbook, ensure you have the following:

- Ansible installed on your system.
- A static public IP address.
- Ports 8000 to 8020 available and open for communication on your network firewall and router.


## Running the Playbook

### Deployment on a Remote Host
To deploy the Firedancer node on a remote host, use the following command, replacing `<ip-address>` with the IP address of your target machine:

```shell
ansible-playbook master.yml -i '<ip-address>,' -u ubuntu -K
```

### Deployment on Localhost
If you're deploying on the same machine where Ansible is installed, use `localhost`:

```shell
ansible-playbook master.yml -i 'localhost,' -u ubuntu -K
```

## Customizing the Playbook

The `master.yml` playbook includes several tasks that can be enabled or disabled according to your needs. By default, some of these tasks are commented out to prevent execution. You can uncomment any task to enable it or comment it out to skip it during the run.

Here is a brief overview of the tasks within `master-playbook.yml`:

### Available Tasks

- **System Update and Upgrade**: (Commented out by default) Ensures your system is up to date.
- **Disk Setup**: (Commented out by default) Configures disk partitioning.
- **Deploy Firedancer**: Deploys the Firedancer application.
- **Install Solana CLI**: Installs the Solana Command Line Interface tools.
- **Keys and Airdrop**: (Commented out by default) Manages Solana keys and performs an airdrop.

### Customizing Tasks
To enable or disable a task, simply comment or uncomment the relevant lines in the `master.yml` file. 

For instance, to disable the Disk Setup task, ensure it is commented out as follows:

```yaml
#- name: Set up Disks
#  import_playbook: ./playbooks/disk-setup.yml
```

To enable it, remove the `#`:

```yaml
- name: Set up Disks
  import_playbook: ./playbooks/disk-setup.yml
```

Repeat this process for any other tasks you wish to customize. Please note that disk partitioning is specific to our hardware configuration; review and edit as necessary to suit your environment.

## Support
For assistance or to report issues with the playbook, please reach out to the support team or open an issue.
