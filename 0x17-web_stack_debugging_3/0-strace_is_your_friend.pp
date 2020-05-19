# Fixing file not found (Filename wasnt correct) in the file wp-settings.php
exec{ 'fix-wordpress':
    command => 'sed -i \'s/class-wp-locale.phpp/class-wp-locale.php/g\' /var/www/html/wp-settings.php',
    path    => '/usr/local/bin/:/bin/',
}
