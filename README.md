# Ansible Docker Demo

This project demonstrates Ansible configuration management in a local Docker environment, featuring one Ansible control node and two managed nodes.

## Prerequisites

- Docker and Docker Compose installed on your local machine
- Git for version control

## Getting Started

1. Clone this repository
   ```bash
   git clone https://github.com/yourusername/ansible-docker-mini-lab.git
   cd ansible-docker-demo
   ```

2. Generate SSH keys for passwordless authentication
   ```bash
   ssh-keygen -t rsa -f id_rsa -N ""
   ```

3. Start the Docker containers
   ```bash
   docker-compose up -d
   ```

4. Log into the Ansible control node
   ```bash
   docker exec -it ansible-master bash
   ```

5. Inside the container, test the connection to managed nodes
   ```bash
   ansible all -m ping
   ```

## Running Playbooks
Run the main playbook to configure all nodes

```bash
ansible-playbook playbooks/site.yml
```

Or run specific playbooks for targeted configuration

```bash
ansible-playbook playbooks/webserver.yml
ansible-playbook playbooks/database.yml
ansible-playbook playbooks/security.yml
```

## Project Structure

```
ansible-docker-demo/
├── docker-compose.yml         # Docker Compose configuration
├── Dockerfile.ansible         # Dockerfile for Ansible control node
├── Dockerfile.node            # Dockerfile for managed nodes
├── README.md                  # Project documentation
├── ansible.cfg                # Ansible configuration file
├── inventory/
│   └── hosts                  # Inventory file
├── playbooks/
│   ├── site.yml               # Main playbook
│   ├── webserver.yml          # Web server configuration
│   ├── database.yml           # Database configuration
│   └── security.yml           # Security hardening playbook
└── roles/
    ├── common/                # Common configuration role
    │   ├── tasks/
    │   │   └── main.yml
    │   └── handlers/
    │       └── main.yml
    ├── webserver/             # Web server role
    │   ├── tasks/
    │   │   └── main.yml
    │   ├── templates/
    │   │   └── nginx.conf.j2
    │   └── handlers/
    │       └── main.yml
    └── database/              # Database role
        ├── tasks/
        │   └── main.yml
        ├── templates/
        │   └── my.cnf.j2
        └── handlers/
            └── main.yml
```

* **docker-compose.yml**: Defines the Docker containers
* **Dockerfile.ansible**: Configuration for the Ansible control node
* **Dockerfile.node**: Configuration for the managed nodes
* **ansible.cfg**: Ansible configuration file
* **inventory/hosts**: Inventory file defining managed nodes
* **playbooks/**: Contains all Ansible playbooks
* **roles/**: Contains role definitions for different server types


## Implemented Features
This project demonstrates:

* Infrastructure as code with Docker Compose
* Password-less SSH authentication
* Role-based configuration management
* Web server and database server setup
* Security hardening best practices
* Templates for configuration files
* Handlers for service management

## Extending the Project
Extend this project by:

* Adding more managed nodes
* Creating additional roles for different server types
* Implementing environment-specific configurations
* Adding monitoring and logging configurations
* Creating CI/CD pipelines for testing ansible playbooks