vagrant-webdev
==============
An easy to use Vagrant web development environment. Install your LAMP stack with one command!

Features
--------
* Easy to setup multiple hosts/vhosts
* Ubuntu 12.04
* Apache2
* PHP 5.3
* PHPUnit
* MySQL (inkl. Phpmyadmin)
* Postgresql
* NodeJS
* NPM

Get started
-----------
1. Install [Vagrant](http://www.vagrantup.com/)
2. Clone repository
3. $ vagrant up
4. Access [vagrant.lo](http://vagrant.lo/) in your browser

FAQ
---
**NFS mounting failed:**

    Mounting NFS shared folders failed. This is most often caused by the NFS
    client software not being installed on the guest machine. Please verify
    that the NFS client software is properly installed, and consult any resources
    specific to the linux distro you're using for more information on how to
    do this.

**Quickfix:**

    $ vagrant ssh
    $ sudo apt-get install nfs-common
    $ exit
    $ vagrant provision
