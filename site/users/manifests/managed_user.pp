
define users::managed_user ($username,$usergroup) {

  group{"$usergroup":
    ensure => "present"
    notify => User["$username"]
  }

  user { "$username":
    ensure  => "present",
    home    => "/home/$username",
    group   => $usergroup,
    notify  => File["ssh_home"]
  }

  file { 'ssh_home':
    path   => "/home/$username/.ssh",
    ensure => 'directory',
    mode   => '0600'
  }

}