class neutron::services {
    service {["neutron-openvswitch-agent", "neutron-dhcp-agent", "neutron-l3-agent", "neutron-metadata-agent", "openvswitch-switch", "neutron-server", "neutron-metering-agent"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
