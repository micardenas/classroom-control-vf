class wrappers::cl_limits {

  sysctl { 'net.ipv4.ip_local_port_range':
    ensure    => 'present',
    permanent => 'yes',
    value     => '32768 61000',
  }
}