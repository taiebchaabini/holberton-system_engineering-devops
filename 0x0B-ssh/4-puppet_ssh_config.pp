# Configure ssh config for using custom private key and 

file_line { 'Turn off passwd auth':
  ensure   => 'present',
  name     => 'AUTH_PWD',
  path     => '/etc/ssh/ssh_config',
  line     => '    PasswordAuthentication no',
  match    => '#?   PasswordAuthentication yes',
  replace  => true,
  multiple => false,
}
file_line { 'Declare identity file':
  ensure   => 'present',
  name     => 'IDENTITY_FILE',
  path     => '/etc/ssh/ssh_config',
  line     => '    IdentityFile ~/.ssh/holberton',
  match    => '#?   IdentityFile ~/.ssh/.+',
  replace  => true,
  multiple => false,
}
FILE_LINE['AUTH_PWD'] ~> FILE_LINE['IDENTITY_FILE']
