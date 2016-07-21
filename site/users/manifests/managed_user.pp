
define users::managed_user ($username=$title,$usergroup) {

  group {"$usergroup":
    ensure => "present",
  }

  user { "$username":
    ensure  => "present",
    home    => "/home/$username",
    groups   => ["$usergroup"]
  }

  file { ["/home/$username","/home/$username/.ssh"]:
    ensure => 'directory',
    mode   => '0600',
  }

}