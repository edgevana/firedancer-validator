<p align="center">
  <img src="https://miro.medium.com/v2/resize:fit:4800/format:webp/1*yYAypHYu_kEGbc-BreWzkw.png" alt="Descriptive text for image">
</p>

# Firedancer Node Deployment Guide

## Overview
This guide provides instructions for deploying Firedancer nodes using Ansible. Ansible is an open-source automation tool that can be used for configuration management and application deployment.

## Pre-requisites
Before running the playbook, ensure you have Ansible installed on your system.

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

- **System Update and Upgrade**: Ensures your system is up to date.
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

Repeat this process for any other tasks you wish to customize.

## Support
For assistance or to report issues with the playbook, please reach out to the support team or visit the [issue tracker](#).
