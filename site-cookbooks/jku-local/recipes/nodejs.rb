# Instal newest Nodejs
bash "install_nodejs" do
     user "root"
     cwd "/tmp"
     code <<-EOH
        curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
        apt-get install --yes nodejs
     EOH
     not_if { ::File.exists?('/usr/bin/nodejs') }
end

# Install Node Version Manager
bash "install_nvm" do
     user "root"
     cwd "/tmp"
     code <<-EOH
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
     EOH
     not_if { ::File.exists?('/usr/bin/nvm') }
end
