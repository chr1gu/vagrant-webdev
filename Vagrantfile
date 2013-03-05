# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'rbconfig'
require 'fileutils'
IS_WINDOWS = (RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/) ? true : false

# hostmaster plugin
require File.dirname(__FILE__) + "/hostmaster/hostmaster.rb"

# copy dist-files that we can customize later
require File.dirname(__FILE__) + "/config/dist/distfiles.copy.rb"

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

  # additional folders
  require File.dirname(__FILE__) + "/config/sharedfolders.rb"

  # the ip address where the vm can be accessed from the host
  config.vm.network :hostonly, "100.100.100.100"
  config.vm.forward_port 22, 2222
  config.vm.forward_port 80, 8080 # http

  # hosts
  config.vm.host_name = "vagrant.lo"
  require File.dirname(__FILE__) + "/config/hosts.rb"

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
