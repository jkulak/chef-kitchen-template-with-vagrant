#
# Cookbook Name:: jku-project-lol
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

# Install nodejs requirements for the project
# nodejs_npm "koa"
nodejs_npm "mongodb"
nodejs_npm "express-generator"

user = 'lol'
group = 'lol'

user user do
  comment "#{user} user"
  home "/home/#{user}"
  shell '/bin/bash'
end

group group do
  action :modify
  members ['lol']
  append true
end

# Create main vhost directory
directory "/var/www" do
    action :create
    user user
    group group
end

link "/var/www/lol" do
    to "/mnt/host/nodejs_code/lol"
    user user
    group group
not_if { ::File.exists?("/var/www/lol") }
end

# Install Node Version Manager
bash "pm2 start app.json" do
     user "root"
     cwd "/var/www/lol"
     code <<-EOH
        pm2 start app.json
     EOH
    #  not_if { ::File.exists?('/usr/bin/nvm') }
end
