class profile::apache {

  class {'apache':}
/*
  apache::vhost {'micardenas.lab.com':
    port          => '80',
    docroot       => '/var/www/micardenas',
    docroot_owner => 'root',
    docroot_group => 'root',
  }
*/
}