class profile::nginx(
  Array $vhost, 
) {
  include ::nginx
 
  $vhost.each |$vhost| {
    ::nginx::vhost { $vhost['fqdn']:
      port           => $vhost['port'],
      server_aliases => $vhost['server_aliases'],
    }
  }
}
