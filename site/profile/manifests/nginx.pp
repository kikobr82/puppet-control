class profile::nginx(
  Array $v2hosts, 
) {
  include ::nginx
 
  $vhosts.each |$vhost| {
    ::nginx::vhost { $vhost['fqdn']:
      port           => $vhost['port'],
      server_aliases => $vhost['server_aliases'],
    }
  }
}
