# put your host aliases space separated
Vagrant::Config.run do |config|
  config.hosts.aliases = %w(example.lo example2.lo)
end
