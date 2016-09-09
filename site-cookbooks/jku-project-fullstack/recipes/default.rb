#
# Cookbook Name:: jku-project-fullstack
# Recipe:: default
#
# Copyright 2016, Jakub Kułak
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'jku-common::default'
include_recipe 'jku-local::nodejs'
include_recipe 'jku-local::nodejs_development'
include_recipe 'jku-local::mongodb'
include_recipe 'jku-local::apache2'

# Install nodejs requirements for the project
nodejs_npm "mongodb"
nodejs_npm "express-generator"
nodejs_npm "yo"

vhost = 'fullstack.griller'
user = 'fullstack'
group = 'fullstack'

user user do
  comment "#{user} user"
  home "/home/#{user}"
  shell '/bin/bash'
end

group group do
  action :modify
  members ['fullstack']
  append true
end

# Create main vhost directory
directory "/var/www" do
    action :create
    user user
    group group
    not_if { ::File.exists?("/var/www") }
end

# Create versioned directory structure
versioned_dir_structure vhost do
    docroot_dir node['apache']['docroot_dir']
    user node['apache']['user']
    group node['apache']['group']
end

# Create Apache2 vhost
web_app vhost do
    server_name vhost
    docroot "#{node['apache']['docroot_dir']}/#{vhost}/www"
    cookbook 'apache2'
    user node['apache']['user']
    group node['apache']['group']
    directory_options '+Indexes'
end

directory "#{node['apache']['docroot_dir']}/#{vhost}/releases/initial" do
  action :delete
  not_if { ::Dir['your_directory/*'].any? }
end

link "#{node['apache']['docroot_dir']}/#{vhost}/releases/initial" do
    to "/mnt/host/mount_dir/fullstack"
    user user
    group group
end
