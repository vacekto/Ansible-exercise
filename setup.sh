#!/bin/bash
set -e 

WORKDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$WORKDIR"

# Load environment variables from .env and export them
if [ -f "$WORKDIR/.env" ]; then
  set -a
  . "$WORKDIR/.env"
  set +a
fi


command_exists() {
  command -v "$1" >/dev/null 2>&1
}


if ! command_exists ansible-playbook; then
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y ansible
fi

if ! ansible-galaxy collection list | grep -q "community.docker"; then
    echo "Installing Ansible Docker collection..."
    ansible-galaxy collection install community.docker
fi

echo "Running Ansible server..."
ansible-playbook -i inventory site.yaml -K

echo "Deployment completed."
