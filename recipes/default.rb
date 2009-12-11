remote_file "/etc/apt/packages.gpg" do
  source "packages.gpg"
  owner "root"
  group "root"
  mode 0644
end

remote_file "/etc/apt/sources.list" do
  source "sources.list.#{node[:domain].split(".").first}"
  owner "root"
  group "root"
  mode 0644
  not_if { node[:domain] == 'localdomain' || node[:domain] == 'ubuntu' }
end

%w{/var/cache/local /var/cache/local/preseeding}.each do |dirname|
  directory dirname do
    owner "root"
    group "root"
    mode  0644
    action :create
  end
end

execute "apt-key-add" do
  command "/usr/bin/apt-key add /etc/apt/packages.gpg"
  only_if "test `/usr/bin/apt-key list | grep -c packages@37signals.com` -eq 0"
end

execute "apt-get-update" do
  command "apt-get update"
end

