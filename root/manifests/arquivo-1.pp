file {'test':
  path    => '/tmp/teste.txt',
  ensure  => present,
  mode    => 0640,
  content => "Conteudo de teste !\n",
}
