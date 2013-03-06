vagrant-webdev
==============
An easy to use Vagrant web development environment. PHP, Apache2, MySQL &amp; co. out of the box!


FAQ
---
*NFS mounting failed:*
    Mounting NFS shared folders failed. This is most often caused by the NFS
    client software not being installed on the guest machine. Please verify
    that the NFS client software is properly installed, and consult any resources
    specific to the linux distro you're using for more information on how to
    do this.

*Quickfix:*
    $ vagrant ssh
    $ sudo apt-get install nfs-common
    $ exit
    $ vagrant provision
