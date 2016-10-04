#
# Cookbook Name:: jku-project-fullstack
# Recipe:: node
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
# include_recipe 'jku-local::nodejs'
# include_recipe 'jku-local::nodejs_development'
# include_recipe 'jku-local::mongodb'
# include_recipe 'jku-local::apache2'

# Install nodejs requirements for the project
# nodejs_npm "mongodb"
# nodejs_npm "express-generator"
# nodejs_npm "yo"

# gem_package "sass"
# nodejs_npm "gulp-cli"
# nodejs_npm "gulp"
# nodejs_npm "webpack"

user node['fullstack']['user'] do
  comment "#{node['fullstack']['user']} user"
  home "/home/#{node['fullstack']['user']}"
  shell '/bin/bash'
end

group node['fullstack']['group'] do
  action :modify
  members ['fullstack']
  append true
end

# Create main vhost directory
directory "/var/www" do
    action :create
    user node['fullstack']['user']
    group node['fullstack']['group']
    not_if { ::File.exists?("/var/www") }
end

# Create versioned directory structure
versioned_dir_structure node['fullstack']['vhost'] do
    docroot_dir node['apache']['docroot_dir']
    user node['apache']['user']
    group node['apache']['group']
end

# Create Apache2 vhost
web_app node['fullstack']['vhost'] do
    server_name node['fullstack']['vhost']
    docroot "#{node['apache']['docroot_dir']}/#{node['fullstack']['vhost']}/www"
    cookbook 'apache2'
    user node['apache']['user']
    group node['apache']['group']
    directory_options '+Indexes'
end
