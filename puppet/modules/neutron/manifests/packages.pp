class neutron::packages {
    #package { ["openvswitch-switch", "openvswitch-datapath-dkms", "haproxy"]:
    package { ["openvswitch-switch", "haproxy"]:
         ensure => 'installed',
    }
}
