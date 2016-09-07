# the-kitchen

Vagrantfile + Chef provisioning scripts for full-stack development environment

## Components

* Ubuntu 14.04.3 LTS (Vagrant box)
* Apache/2.4.7 (Ubuntu)
* PHP 5.5.9-1ubuntu4.11
* MySQL 5.6.19-0ubuntu0.14.04.1

## Reuqirements

* Vagrant
* Chef solo (best from ChefSDK)

## Usage

To run and use the environment:

```shell
git clone https://github.com/jkulak/the-kitchen
cd the-kitchen
cp environments/local.json.example environments/local.json
# optionally edit environments/local.json
vagrant up
```

And your system is up and running and available at: 192.168.5.5

# Component details

## Varnish

Configuration files:
* `/etc/varnish/custom_default.vcl`
* `/etc/default/varnish`

Usage `/etc/init.d/varnish {start|stop|restart|reload|force-reload|configtest}`

## Apache

Usage `/etc/init.d/apache2 {start|stop|graceful-stop|restart|reload|force-reload|start-htcacheclean|stop-htcacheclean}`

## MySQL

The service name on the OS is mysql-master.

Files location
* configuration: `/etc/mysql-master/my.cnf`
* socket: `/var/run/mysql-master/mysqld.sock`
* error log: `/var/log/mysql-master/error.log`

Connect to server using mysql client
* `$ mysql -u root -p -h 127.0.0.1`
* `$ mysql -u root -p --socket /var/run/mysql-master/mysqld.sock`

Usage `sudo service mysql-master start|stop|restart|reload|force-reload|status`

## MongoDB

Files location
* configuration: `/etc/mongodb.conf`
* log: `/var/log/mongodb/mongodb.log`
* service: `/etc/init/mongodb.conf`

Usage `sudo service mongodb start|stop|reload|status|force-stop|force-reload`

# Hacks

Hacks and custom implementation that is waiting for issues to be fixed

* apache2::mod_pagespeed won't install, giving
```ERROR: package[mod_pagespeed] (apache2::mod_pagespeed line 27) had an error: Chef::Exceptions::Package: apt package provider cannot handle source attribute. Use dpkg provider instead```. Waiting to be tested ad merged: https://github.com/svanzoest-cookbooks/apache2/pull/248
