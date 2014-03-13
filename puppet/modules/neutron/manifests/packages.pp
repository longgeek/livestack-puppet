class neutron::packages {
    package { ["openvswitch-switch", "openvswitch-datapath-dkms", "haproxy"]:
         ensure => 'installed',
    }
}
