#  Nginx web server (w/ Puppet) 
package { 'nginx':
  ensure =>  'installed',
}

service {'nginx':
  ensure  => 'running',
  require => Package['nginx'],
}

file { 'define index.html':
  ensure  => 'present',
  path    => '/var/www/html/index.nginx-debian.html',
  content => 'Holberton School'
}

file_line { 'perform a redirection':
  ensure => 'present',
  path   => '/etc/nginx/sites-enabled/default',
  line   => 'redirect ^/redirect_me/$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  notify => Service['nginx']
}
