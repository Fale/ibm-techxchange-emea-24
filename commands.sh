# Create toolbox container
toolbox create --distro fedora --release f39 bcn24
toolbox run -c bcn24 sudo dnf install -y ansible python3-pip gcc python3-devel
toolbox run -c bcn24 ansible-galaxy collection install 'openstack.cloud:>2.0.0,<3.0.0' --upgrade

# Provision seats
toolbox run -c bcn24 ansible-playbook setup/10_provision_seats.yml -i inventory --vault-pass-file ../password

# Remove seats
toolbox run -c bcn24 ansible-playbook setup/80_deprovision_seats.yml -i inventory --vault-pass-file ../password
