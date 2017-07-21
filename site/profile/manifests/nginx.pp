class profile::nginx(
  Array $vhosts, 
) {
  include ::nginx
 
  $vhosts.each |$vhost| {
    ::nginx::vhosts { $vhost['fqdn']:
      port           => $vhost['port'],
      server_aliases => $vhost['server_aliases'],
    }
  }
}
