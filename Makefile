##################################################################################################
# Ansible makefile built by                                                                      #
#                                                                                                #
# ██╗    ██╗███╗   ███╗██████╗                                                                   #	
# ██║    ██║████╗ ████║██╔══██╗                                                                  #
# ██║ █╗ ██║██╔████╔██║██████╔╝                                                                  #
# ██║███╗██║██║╚██╔╝██║██╔══██╗                                                                  #
# ╚███╔███╔╝██║ ╚═╝ ██║██████╔╝                                                                  #
#  ╚══╝╚══╝ ╚═╝     ╚═╝╚═════╝                                                                   #
#                                                                                                #
# Here I've defined all the required commands to setup a new debian machine                      #
#                                                                                                #
# commands:                                                                                      #
# - debian-setup: runs the debian_playbook in all the hosts defined on the hosts file with the   #
# configs defined on the .env file                                                               #
# - debian-setup-with-pass: runs the debian_playbook in all the hosts defined on the hosts       #
# file with the configs defined on the .env file asking for the user and sudo passwords          #
# - debian-validate: runs the yml validation for the debian_playbook                             #
# - debian-update: updates all the debian hosts                                                  #
# - add-role: creates a new ansible role                                                         #
# - docs: prints this documentation                                                              #
##################################################################################################

PATTERN = \#\#\#\#\#\#\#\#\#\#\#\#

include .env
export

debian-setup:
	@ansible-playbook \
		-i hosts \
		debian_playbook.yml \
		--extra-vars \
		"user=$(USERNAME) version=$(VERSION) docker_repository_version=$(DOCKER_REPOSITORY_VERSION) ssh_gen=$(GENERATE_SSH_KEYS)"

debian-setup-with-pass:
	@ansible-playbook \
		-i hosts \
		debian_playbook.yml \
		--extra-vars \
		"user=$(USERNAME) version=$(VERSION) amd_driver=$(AMD_DRIVERS) docker_repository_version=$(DOCKER_REPOSITORY_VERSION) ssh_gen=$(GENERATE_SSH_KEYS)" -Kk

debian-validate:
	@ansible-playbook debian_playbook.yml  --syntax-check

add-host:
	@bash ./scripts/add_host.sh

docs:
	@sed -n '/^$(PATTERN)/,/^$(PATTERN)/p' ./Makefile

add-role:
	@bash -c "pushd roles && ansible-galaxy role init $(filter-out $@,$(MAKECMDGOALS))"

debian-update:
	@ansible-playbook \
		-i hosts \
		debian_update_playbook.yml \
		--extra-vars \
		"user=$(USERNAME)"

%:
	@:
