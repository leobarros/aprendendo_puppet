class nagios::server {
  include apache
  include apache::mod::php
package { ['nagios', 'nagios-plugins-nrpe']:
    require  => Package['apache2'],
    ensure   => installed;
  }
  file { '/etc/apache2/conf.d/nagios.conf':
      require  => Package['nagios'],
      notify   => Service['apache2'],
      source   => "puppet::///modules/nagios/nagios.conf";
  }
  exec { 'set-default-username':
      require  => Package['nagios'],
      command  => '/bin/echo default_user_name=nagiosadmin >> /etc/nagios/cgi.cfg',
      unless   => '/bin/grep default_user_name=nagiosadmin /etc/nagios/cgi.cfg',
      notify   => Service['nagios'];
  }
  service { 'nagios':
      require  => Package['nagios'],
      ensure   => running,
  }
}
