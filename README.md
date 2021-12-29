# WMB-Machine setup

``` shell
##################################################################################################
#                                                                                                #
# ██╗    ██╗███╗   ███╗██████╗                                                                   #
# ██║    ██║████╗ ████║██╔══██╗                                                                  #
# ██║ █╗ ██║██╔████╔██║██████╔╝                                                                  #
# ██║███╗██║██║╚██╔╝██║██╔══██╗                                                                  #
# ╚███╔███╔╝██║ ╚═╝ ██║██████╔╝                                                                  #
#  ╚══╝╚══╝ ╚═╝     ╚═╝╚═════╝                                                                   #
##################################################################################################

```


This is my own ansible playbook to setup all my debian machines.
This can be used for headless machines or gui machines

## Requirements:
- Ansible
- make
- Bash

## How to:

- Configure the project using the .env file
- Run `make debian-setup`
- If you want to update the playbook use `make debian-validate`
- To print the docs use `make docs`
- To print the add-host-docs use `make add-host-docs`
- To add a new role use `make add-role`
