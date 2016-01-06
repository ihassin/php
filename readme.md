# VM provisioning

The roles are
- common: basic ubuntu
- db: mysql
- iptables: known hackers
- ruby2
- logrotate
- swapfile
- php
- webserver

# git

```
git clone git@github.com:ihassin/php.git
```

or

```
git clone https://github.com/ihassin/php.git
```

# Prerequisites

* Please install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads).
* Please install Vagrant from [here](https://docs.vagrantup.com/v2/installation).
* Please install Ansible from [here](http://docs.ansible.com/ansible/intro_installation.html#getting-ansible).
* Please install Bundler from [here](http://bundler.io) if you intend to run Cucumber

## Provisioning the VMs

### Setting up the IP

If you want to change the VM's IP address, or networking in general, please edit Vagrantfile to suit your needs.

## /etc/hosts

Add an entry to your /etc/hosts file so that Ansible will find the VM.

```
33.33.33.37 	stage.php.com
```

Once you have done that, you can ```ssh deploy@33.33.33.37``` with the password found in roles/common/vars/main.yml
If you want to access the VM using your own ssh key, insert your public key in common/templates/ssh_keys.pub.

Log in using ```ssh deploy@stage.php.com```

### Setting up your public key to access the box easily

Add your public key to roles/common/files/ita.pub

### Bring up the machine

You can then bring up the box for configuring by issuing the following command:

```
vagrant up|provision
```

# Running Ansible standalone

```
ansible-playbook -i inventory-stage.ini web-playbook.yml -u root
```

# Using Cucumber instead

You can run cucumber at the root of the project to let the provisioning story play out!

```
bundle install
cucumber
```

# PHPUnit included

See PHPUnit run by running

```
cd ~
phpunit --verbose test
```


# Contributing

1. Fork it (https://github.com/ihassin/php/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# License

MIT

# Code of conduct

Please see local CODE_OF_CONDUCT.md file.
