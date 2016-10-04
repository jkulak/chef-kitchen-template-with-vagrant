# Recipe deploying code when run locally in Vagrant VM

# Delete the initial directory (if empty) from the default structure to link mounted directory
directory "#{node['apache']['docroot_dir']}/#{node['fullstack']['vhost']}/releases/initial" do
  action :delete
  only_if { ::Dir.entries("#{node['apache']['docroot_dir']}/#{node['fullstack']['vhost']}/releases/initial").join == "..." }
end

link "#{node['apache']['docroot_dir']}/#{node['fullstack']['vhost']}/releases/initial" do
    to "/mnt/host/mount_dir/fullstack"
    user node['fullstack']['user']
    group node['fullstack']['group']
end
