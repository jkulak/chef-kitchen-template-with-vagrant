#
# Cookbook Name:: multipurpose
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jku-common::default'

# include_recipe 'jku-multipurpose::apache2'
# include_recipe 'jku-multipurpose::php'
# include_recipe 'jku-multipurpose::performance_tester'

# include_recipe 'jku-multipurpose::mysql_server'


# include_recipe 'jku-multipurpose::adminer'
#
# include_recipe 'jku-multipurpose::nodejs'
# include_recipe 'jku-multipurpose::nodejs_development'

# include_recipe 'jku-multipurpose::mongodb3'
include_recipe 'jku-multipurpose::mongodb'

# include_recipe 'jku-multipurpose::project_lol'
