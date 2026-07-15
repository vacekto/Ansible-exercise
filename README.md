# Orthanc Deployment

Automation for installing and configuring an Orthanc DICOM server inside a Docker container using Ansible.

## Requirements

- `apt` package manager to install Ansible and its dependencies
- sudo privileges

## Run

```bash
cd /home/magic_turtle/ansible2
./setup.sh
```

## Summary

- Installs or validates Docker
- Renders Orthanc config from a Jinja2 template
- Starts Orthanc in Docker with persistent storage

## Notes

- The template is tracked, runtime data is ignored.
- HTTP is enabled and authentication is disabled.
