#!/bin/bash

CURRENTIP=$1

if [[ "$#" -lt 1 ]]; then
  echo "Usage: $(basename "$0") <current_ip>"
  exit 1
fi

ansible-playbook site.yaml -i inventory/inventory.ini --limit=$CURRENTIP -u ubuntu -k -e "ansible_user=ubuntu"
