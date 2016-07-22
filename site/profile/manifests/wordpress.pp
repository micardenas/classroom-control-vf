class profile::wordpress {

  wordpress::instance { '/opt/wordpresslab':
    wp_owner    => 'root',
    wp_group    => 'root',
    db_user     => 'labuser',
    db_name     => 'wordpressdb',
    db_password => 'labpass',
  }

}