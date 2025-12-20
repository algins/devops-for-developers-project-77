ansible-install:
	cd ansible && ansible-galaxy install --role-file requirements.yml

ansible-lint:
	cd ansible && ansible-lint playbook.yml

ansible-setup:
	cd ansible && ansible-playbook --inventory inventory.ini playbook.yml --vault-password-file vault-password --tags setup

ansible-deploy:
	cd ansible && ansible-playbook --inventory inventory.ini playbook.yml --vault-password-file vault-password --tags deploy

ansible-vault:
	cd ansible && ansible-vault edit group_vars/webservers/vault.yml --vault-password-file vault-password

terraform-init:
	cd terraform && terraform init

terraform-plan:
	cd terraform && terraform plan

terraform-apply:
	cd terraform && terraform apply

terraform-destroy:
	cd terraform && terraform destroy
