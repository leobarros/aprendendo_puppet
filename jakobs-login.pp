user { 'Jakob':
  ensure     => 'present',
  managehome => true,
  password   => '4d4ecb2b511e6a05acdae7da8bc76ead',
}
file { '/home/Jakob/.bash_profile':
  content => 'echo Hello $(logname)',
}
