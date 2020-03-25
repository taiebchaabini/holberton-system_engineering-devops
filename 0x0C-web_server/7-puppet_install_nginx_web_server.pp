#  Nginx web server (w/ Puppet) 
package { 'nginx':
  ensure =>  'installed',
}

service {'nginx':
  ensure  => 'running',
  require => Package['nginx'],
}

file { '/var/www/html/index.nginx-debian.html':
  ensure  => 'present',
  content => 'Holberton School',
  require =>  Package['nginx']
}

file_line { 'perform a redirection':
  ensure  => 'present',
  path    => '/etc/nginx/sites-enabled/default',
  line    => 'redirect ^/redirect_me/$ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  require =>  Package['nginx'],
  notify  =>  Service['nginx'],
}
