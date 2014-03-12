name             'zoo-kafka'
maintainer       'The Zooniverse'
maintainer_email 'ed@zooniverse.org'
license          'Apache 2.0'
description      'Installs/Configures zoo-kafka'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'aws'
depends 'zoo-base' #defined in Berksfile
depends 'kafka' #defined in Berksfile
