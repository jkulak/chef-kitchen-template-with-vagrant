# Create versioned directory structure
versioned_dir_structure node['jku-local']['performance_tester']['vhost'] do
    docroot_dir node['apache']['docroot_dir']
    user node['apache']['user']
    group node['apache']['group']
end

# Copy files for PHP performance testing
%w{01-own.php 02-free-webhosts.php 03-php-bench-script.php}.each do |file|
    cookbook_file "#{node['apache']['docroot_dir']}/#{node['jku-local']['performance_tester']['vhost']}/www/#{file}" do
        mode 0755
        user node['apache']['user']
        group node['apache']['group']
    end
end

# Create Apache2 vhost
web_app node['jku-local']['performance_tester']['vhost'] do
    server_name node['jku-local']['performance_tester']['vhost']
    docroot "#{node['apache']['docroot_dir']}/#{node['jku-local']['performance_tester']['vhost']}/www"
    cookbook 'apache2'
    user node['apache']['user']
    group node['apache']['group']
    directory_options '+Indexes'
end
