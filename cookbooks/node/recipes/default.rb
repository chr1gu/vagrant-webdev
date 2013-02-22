%w(
python-software-properties
python
g++
make
).each { | pkg | package pkg }

execute "add-apt-repository" do
  command "add-apt-repository ppa:chris-lea/node.js"
  ignore_failure true
end

execute "apt-get update" do
  command "apt-get update"
  ignore_failure true
  action :nothing
end

%w(
nodejs
npm
).each { | pkg | package pkg }