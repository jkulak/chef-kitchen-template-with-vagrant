# Set directives for /etc/php5/apache2/php.ini
default['php']['conf_dir'] = '/etc/php5/apache2'
default['php']['directives'] = {
    'log_errors_max_len' => 666,
    'display_errors' => "On",
    'display_startup_errors' => "On",
    'html_errors' => "On",
    'opcache.enable' => 1
}
