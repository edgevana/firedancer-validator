<p align="center">
  <img src="https://miro.medium.com/v2/resize:fit:4800/format:webp/1*yYAypHYu_kEGbc-BreWzkw.png" alt="Descriptive text for image">
</p>

Run the playbook with the following command:

```shell
ansible-playbook master.yml -i '<ip-address>,' -u ubuntu -K
```

If you are running it over localhost, put localhost.

```shell
ansible-playbook master.yml -i 'localhost,' -u ubuntu -K
```

Comment out the options you dont need within the master.yml, such as disk paritioning and keygeneration.

```
# master-playbook.yml
- name: Prepare Node and Deploy Firedancer
  hosts: all
  become: yes
  tasks:
    # Your tasks for updating and upgrading the system here

#- name: Set up Disks
#  import_playbook: ./playbooks/disk-setup.yml

- name: Deploy Firedancer
  import_playbook: ./playbooks/firedancer.yml

- name: Install Solana CLI
  import_playbook: ./playbooks/solana-install.yml

#- name: Keys and Airdrop
#  import_playbook: ./playbooks/solana-keys.yml
```
