# griller-local-kitchen

Vagrantfile + Chef provisioning scripts for full-stack local development environment.

## The idea

* Use branches to store configuration per project
* Create project cookbooks in those branches
* Update those branches from master to keep them up to date

## Requirements

* Vagrant
* Chef solo (best from ChefSDK)

## Usage

To run and use the environment:

```shell
git clone https://github.com/jkulak/griller-local-kitchen
cd /griller-local-kitchen
cp environments/local.json.example environments/local.json
# optionally edit environments/local.json
vagrant up
```

And your system is up and running and available at: 192.168.3.25
