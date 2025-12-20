# DevOps for Developers Project 77

### Hexlet tests and linter status:
[![Actions Status](https://github.com/algins/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/algins/devops-for-developers-project-77/actions)

---

## Description

This project manages infrastructure using **Terraform** and **Ansible**, with **Make** providing a simple interface for common workflows:

- Terraform: provision, update, or destroy infrastructure.
- Ansible: configure and deploy applications on your servers.

All Terraform configuration files are located in the `terraform/` directory, and Ansible playbooks and roles are in the `ansible/` directory.

---

## System requirements

* Git
* Terraform
* Ansible
* Make

---

## Clone the repository

```sh
$ git clone https://github.com/algins/devops-for-developers-project-77.git && cd devops-for-developers-project-77
```

---

## Makefile commands

### Terraform

```sh
$ make terraform-init    # Initializes Terraform in terraform/ directory
$ make terraform-plan    # Shows planned infrastructure changes
$ make terraform-apply   # Applies the Terraform configuration
$ make terraform-destroy # Destroys all managed infrastructure
```

### Ansible

```sh
$ make ansible-install   # Installs Ansible roles from ansible/requirements.yml
$ make ansible-lint      # Runs ansible-lint on playbook.yml
$ make ansible-setup     # Runs playbook.yml with --tags setup
$ make ansible-deploy    # Runs playbook.yml with --tags deploy
$ make ansible-vault     # Edits vault file ansible/group_vars/webservers/vault.yml
```

> All Ansible commands are executed from the `ansible/` directory and use `inventory.ini` and `vault-password`.

---

## Notes

- Ensure cloud provider credentials are properly configured before running `make terraform-apply`.
- Always review changes with `make terraform-plan`.
- For team usage, consider remote state storage.
