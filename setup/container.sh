#!/bin/bash
toolbox create --distro fedora --release f39 bcn24
toolbox run -c bcn24 sudo dnf install -y ansible python3-pip gcc python3-devel
toolbox run -c bcn24 ansible-playbook setup/03_provision-servers.yml --vault-pass-file ../password
