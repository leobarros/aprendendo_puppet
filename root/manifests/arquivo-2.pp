file {'/tmp/teste1.txt': 
  ensure  => present,
  content => "Olá\n"
}

file {'/tmp/teste2':
  ensure => directory,
  mode   => 0644,
}

file {'/tmp/teste3.txt':
  ensure => link,
  target => '/tmp/teste1.txt',
}

notify {"Gerando uma notificação":}
notify {"Outra notificação":}
