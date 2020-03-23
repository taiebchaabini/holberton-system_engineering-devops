file { "holberton": 
	path => '/tmp',
	ensure => 'present',
	content => 'I love Puppet',
	owner => 'www-data',
	group => 'www-data',
	mode => '0744',
	force => true
}
