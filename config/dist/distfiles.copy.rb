# create files if they do not exist (the first time)
if !File.exists? File.dirname(__FILE__) + "/../hosts.rb"
  FileUtils.cp(File.dirname(__FILE__) + "/hosts.rb", File.dirname(__FILE__) + "/../hosts.rb");
end;
if !File.exists? File.dirname(__FILE__) + "/../vhost.conf.erb"
  FileUtils.cp(File.dirname(__FILE__) + "/vhost.conf.erb", File.dirname(__FILE__) + "/../vhost.conf.erb");
end;
if !File.exists? File.dirname(__FILE__) + "/../sharedfolders.rb"
  FileUtils.cp(File.dirname(__FILE__) + "/sharedfolders.rb", File.dirname(__FILE__) + "/../sharedfolders.rb");
end;
if !File.exists? File.dirname(__FILE__) + "/../apache2.conf.erb"
  FileUtils.cp(File.dirname(__FILE__) + "/apache2.conf.erb", File.dirname(__FILE__) + "/../apache2.conf.erb");
end;

# copy templates to the right location
FileUtils.cp(File.dirname(__FILE__) + "/../vhost.conf.erb", File.dirname(__FILE__) + "/../../cookbooks/php/templates/default/vhost.conf.erb");
FileUtils.cp(File.dirname(__FILE__) + "/../apache2.conf.erb", File.dirname(__FILE__) + "/../../cookbooks/php/templates/default/apache2.conf.erb");
