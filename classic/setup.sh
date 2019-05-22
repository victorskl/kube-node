#!/bin/bash

[[ $# -eq 0 ]] && { echo "Usage: $0 hosts.ini username key_file.pem playbook-name.yaml"; exit 1; }

ansible-playbook -i ${1} -u ${2} -v -b --ask-become-pass --become-method=sudo --key-file=${3} ${4}