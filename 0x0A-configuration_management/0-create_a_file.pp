# Create a new file Holberton in tmp directory
file { "/etc/holberton": 
	ensure	=> 'absent',
	owner	=> 'www-data',
	group	=> 'www-data',
	mode	=> '0744',
	content => 'I love Puppet',
}