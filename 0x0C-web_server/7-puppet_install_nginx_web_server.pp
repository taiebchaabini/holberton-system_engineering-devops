#  Nginx web server (w/ Puppet) 
exec { 'install nginx server':
  name    => 'install_nginx',
  command =>  'apt-get install nginx -y'
}

file { 'define index.html':
  ensure  => 'present',
  name    => 'default_page',
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Holberton School'
}

file_line { 'perform a redirection':
  ensure => 'present',
  name   => 'redirect_me',
  line   => 'redirect ^/redirect_me/$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;'
}

EXEC['install_nginx'] ~> FILE['default_page'] ~> FILE_LINE['redirect_me']
