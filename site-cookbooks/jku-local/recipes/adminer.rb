#
# Cookbook Name:: jku-local
# Recipe:: adminer
#
# Copyright 2015, Jakub Kułak
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

# Install adminer
bash "install_adminer" do
     user "root"
     cwd "/tmp"
     code <<-EOH
        mkdir /usr/share/adminer
        wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
        ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
        echo "Alias /adminer-editor /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
        a2enconf adminer.conf
        apache2ctl restart
     EOH
     not_if { ::File.exists?('/usr/share/adminer') }
end
