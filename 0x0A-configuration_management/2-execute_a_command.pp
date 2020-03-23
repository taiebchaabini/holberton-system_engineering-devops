# Kill a process KILLMENOW
exec { 'pkill killmenow':
  path   => '/usr/bin:/usr/sbin:/bin',
  onlyif => 'pgrep killmenow'
}
