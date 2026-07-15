# Orthanc Deployment

Automation for installing and configuring an Orthanc DICOM server inside a Docker container using Ansible, setup only locally.

## Requirements

- `git`
- `apt` package manager to install Ansible and its dependencies
- sudo privileges

## Run

create .env file and define variables

```bash
git clone https://github.com/vacekto/Ansible-exercise
```

```bash
cd Ansible-exercise
```

```bash
./setup.sh
```

## ENV

Environment variables are loaded from `.env` if present, then exported by `setup.sh` before running Ansible.
This makes it easy to change ports and image version without editing the playbook.

- `ORTHANC_HTTP_PORT=8042` — Orthanc HTTP API and web interface port
- `ORTHANC_DICOM_PORT=4242` — Orthanc DICOM SCP port for receiving DICOM associations
- `ORTHANC_IMAGE_VERSION=26.6.1` — Orthanc image version used for the container

## Persistence

- `orthanc/data/` is mounted into the container as `/var/lib/orthanc/db`
- This keeps DICOM objects and Orthanc runtime data after container restarts
- The `orthanc/config/` folder stores the generated `orthanc.json` config file

## Notes

- Dashboard can be inspected on http://localhost:8042 (port is from ORTHANC_HTTP_PORT)
