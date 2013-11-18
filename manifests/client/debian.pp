# Install the munin client on debian
class munin::client::debian inherits munin::client::base {
  # the plugin will need that
  package { 'iproute':
    ensure => installed
  }

  $hasstatus = $::lsbdistcodename ? {
    sarge => false,
    default => true
  }

  Service['munin-node']{
    # sarge's munin-node init script has no status
    hasstatus => $hasstatus
  }
  file{'/etc/munin/munin-node.conf':
    ensure  => file,
    content => inline_template(file(
    "munin/munin-node.conf.${::operatingsystem}.${::lsbdistcodename}",
    "munin/munin-node.conf.${::operatingsystem}",
    )),
  }
  # workaround bug in munin_node_configure
  plugin { 'postfix_mailvolume': ensure => absent }
  include munin::plugins::debian
}
