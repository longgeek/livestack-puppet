class neutron::services {
    service {["neutron-openvswitch-agent", "neutron-dhcp-agent", "neutron-l3-agent", "neutron-metadata-agent", "openvswitch-switch", "neutron-server"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }

    service { "neutron-metering-agent":
        ensure => stopped,
        enable => false,
    }
}
