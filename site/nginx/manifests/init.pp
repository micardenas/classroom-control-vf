class nginx {

  package { 'nginx':
    ensure => 'present',

  }

  file { '/var/www':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  file { '/etc/nginx':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }


  file { '/var/www/index.html':
    ensure    => 'file',
    owner     => 'root',
    group     => 'root',
    source    => 'puppet:///modules/nginx/index.html',
    subscribe => File["/var/www"],
  }

  file { '/etc/nginx/nginx.conf':
    ensure    => 'file',
    owner     => 'root',
    group     => 'root',
    source    => 'puppet:///modules/nginx/nginx.conf',
    content   => "root /var/www/",
    subscribe => File["/etc/nginx"],
  }

  service { 'nginx':
    ensure    => 'running',
    enable    => true,
    subscribe => File["/etc/nginx/nginx.conf"],
  }
}

