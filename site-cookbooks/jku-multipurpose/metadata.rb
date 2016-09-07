name             'jku-multipurpose'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures multipurpose'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apache2', '~> 3.2.2'
depends 'php', '~> 1.10.1'
depends 'jku-common', '~> 0.1.1'
