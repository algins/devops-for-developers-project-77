# DevOps for Developers Project 77

### Hexlet tests and linter status:
[![Actions Status](https://github.com/algins/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/algins/devops-for-developers-project-77/actions)

---

## Description

This project manages infrastructure using **Terraform**, with **Make** providing a simple interface for common Terraform workflows such as initialization, planning, applying, and destroying infrastructure.

All Terraform configuration files are located in the `terraform/` directory.

---

## System requirements

* Git
* Terraform
* Make

---

## Clone the repository

```sh
$ git clone https://github.com/algins/devops-for-developers-project-77.git && cd devops-for-developers-project-77
```

---

## Initialize Terraform

```sh
$ make init
```

Initializes Terraform in the `terraform` directory:
- Downloads required providers
- Initializes the backend
- Prepares the working directory

---

## Preview infrastructure changes

```sh
$ make plan
```

Displays the execution plan without applying changes.  
Use this command to review what Terraform will modify.

---

## Apply infrastructure changes

```sh
$ make apply
```

Applies the Terraform configuration and provisions infrastructure resources.

⚠️ Confirmation may be required.

---

## Destroy infrastructure

```sh
$ make destroy
```

Destroys all infrastructure managed by Terraform in this project.

⚠️ **Warning:** This action will permanently delete all managed resources.

---

## Project structure

```text
.
├── Makefile
└── terraform/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── providers.tf
```

---

## Notes

- Ensure cloud provider credentials are properly configured before running `make apply`.
- Always review changes with `make plan`.
- For team usage, consider remote state storage and state locking.