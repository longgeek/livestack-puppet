class neutron::packages {
    package { ['openvswitch-switch', 'haproxy', 'openswan']:
         ensure => 'installed',
    }
}
