# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rbconfig'
IS_WINDOWS = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/) ? true : false

# hostmaster plugin
require File.dirname(__FILE__) + "/hostmaster/hostmaster.rb"

Vagrant::Config.run do |config|

  # define some colors for our output
  def colorize(text, color_code) "#{color_code}#{text}\033[0m" end
  def red(text); colorize(text, "\033[31m"); end
  def green(text); colorize(text, "\033[32m"); end
  def yellow(text); colorize(text, "\033[33m"); end

  # common settings
  config.vm.box = "precise32"
  config.vm.customize ["modifyvm", :id, "--memory", 512]
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  config.vm.share_folder "v-root", "/vagrant", "." , :nfs => true

  # additional shares
  config.vm.share_folder "antidoping.lo", "/antidoping.lo", "/Users/chrigu/Sites/liip/antidoping", :nfs => true
  config.vm.share_folder "chatrooms.lo", "/chatrooms.lo", "/Users/chrigu/Sites/private/Chatrooms", :nfs => true
  config.vm.share_folder "friend-battle.lo", "/friend-battle.lo", "/Users/chrigu/Sites/liip/friend-battle", :nfs => true

  # the ip address where the vm can be accessed from the host
  config.vm.network :hostonly, "100.100.100.100"

  config.vm.forward_port 22, 2222
  config.vm.forward_port 80, 8080

  # hosts
  config.vm.host_name = "vagrant.lo"
  config.hosts.aliases = %w(antidoping.lo chrigu.lo friend-battle.lo)

  # chef solo
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.log_level = ENV['CHEF_LOG'] || "info"

    # recipes
    chef.add_recipe("common")
    chef.add_recipe("php")
    chef.add_recipe("node")

  end
  
end
