
define users::managed_user ($username=$title,$usergroup) {

  group {"$usergroup":
    ensure => "present",
  }

  user { "$username":
    ensure  => "present",
    home    => "/home/$username",
    group   => "$usergroup",
    notify  => File["ssh_home"],
  }

  file { 'ssh_home':
    path   => "/home/$username/.ssh",
    ensure => 'directory',
    mode   => '0600',
  }

}