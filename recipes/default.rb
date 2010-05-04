
if @node[:datacenter]
  remote_file "/etc/apt/sources.list" do
    source "sources.list.#{@node[:datacenter]}"
    owner "root"
    group "root"
    mode 00644
  end
end

execute "apt-get-update" do
  command "apt-get update"
end
