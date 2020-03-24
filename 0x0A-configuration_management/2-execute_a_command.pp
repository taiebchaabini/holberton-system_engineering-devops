# Kill a process KILLMENOW
exec { 'killmenow':
  command => 'pkill killmenow',
  path     => '/usr/bin:/usr/sbin:/bin',
  onlyif   => 'pgrep killmenow'
}
