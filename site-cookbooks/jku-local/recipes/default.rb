#
# Cookbook Name:: multipurpose
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jku-common::default'

include_recipe 'jku-local::apache2'
include_recipe 'jku-local::php'
include_recipe 'jku-local::performance_tester'

# include_recipe 'jku-local::mysql_server'


# include_recipe 'jku-local::adminer'
#
include_recipe 'jku-local::nodejs'
include_recipe 'jku-local::nodejs_development'

# include_recipe 'jku-local::mongodb3'
include_recipe 'jku-local::mongodb'

include_recipe 'jku-local::project_lol'
