class profile::mysql {

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
    override_options        => $override_options
  }

  mysql::db {'wordpressdb':
    user  =>  "labuser",
    password => "labpass",
    host     => "localhost",
    grant    => ['SELECT','UPDATE','INSERT','CREATE']
  }

}