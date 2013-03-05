# shared folders for your projects
Vagrant::Config.run do |config|
  config.vm.share_folder "antidoping.lo", "/antidoping.lo", "/Users/chrigu/Sites/liip/antidoping", :nfs => true
  config.vm.share_folder "chatrooms.lo", "/chatrooms.lo", "/Users/chrigu/Sites/private/Chatrooms", :nfs => true
  config.vm.share_folder "friend-battle.lo", "/friend-battle.lo", "/Users/chrigu/Sites/liip/friend-battle", :nfs => true
  config.vm.share_folder "app.etite.lo", "/app.etite.lo", "/Users/chrigu/Dropbox/etite/projects/private_work/app.etite.ch", :nfs => true
end
