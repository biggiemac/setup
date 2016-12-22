# let's setup the repo, provided from puppetlabs
vcsrepo { '/var/www/www.puppetlabs.com':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/puppetlabs/exercise-webpage.git',
}

# now the nginx webserver, on port 8000
class{'nginx': }
  nginx::resource::vhost { 'www.puppetlabs.com':
  listen_port => 8000,
  www_root => '/var/www/www.puppetlabs.com',
}
