default['mongodb']['config']['auth'] = true # Require authentication to access or modify the database
# default['mongodb']['package_version'] = '3.0'

# The admin user with userAdmin privileges that allows user management
# default['mongodb']['admin'] = {
#     'username' => 'admin',
#     'password' => 'admin',
#     'roles' => %w(userAdminAnyDatabase dbAdminAnyDatabase),
#     'database' => 'admin'
# }

default['mongodb']['users'] = [{
        'username' => 'can_do_everything',
        'password' => '5uP3r_s3cr3t!_read_from_unpublished_environment_file',
        'roles' => ['userAdminAnyDatabase', 'dbAdminAnyDatabase', 'clusterAdmin', 'userAdmin', 'readWrite'],
        'database' => 'admin'
    },
    {
        'username' => 'votr',
        'password' => 'votr',
        'roles' => ['readWrite'],
        'database' => 'votr'
    }
]
