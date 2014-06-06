class neutron::configs {
    exec { "create br":
        command => 'ovs-vsctl add-br br-int',
        path => $command_path,
        unless => 'ovs-vsctl list-br | grep br-int',
    }
        
    exec { "create br-ex":
        command => "ovs-vsctl add-br br-ex; \
                    ovs-vsctl add-port br-ex eth0",
        path => $command_path,
        unless => 'ovs-vsctl list-br | grep br-ex',
        notify => File["/etc/network/interfaces"],
    }

    file { "/etc/network/interfaces":
        source => 'puppet:///files/neutron/etc/interfaces',
        notify => Exec["restart networking"],
    }

    exec { "restart networking":
        command => "ifdown -a && ifup -a",
        path => $command_path,
        refreshonly => true,
    }

    file {
        "/etc/logrotate.d/neutron":
            source => 'puppet:///files/neutron/logrotate.d/neutron';

        "/etc/neutron/api-paste.ini":
            source => 'puppet:///files/neutron/etc/api-paste.ini';
        
        "/etc/neutron/policy.json":
            source => 'puppet:///files/neutron/etc/policy.json';

        "/etc/neutron/rootwrap.conf":
            source => 'puppet:///files/neutron/etc/rootwrap.conf';

        "/etc/neutron/rootwrap.d/debug.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/debug.filters';

        "/etc/neutron/rootwrap.d/iptables-firewall.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/iptables-firewall.filters';

        "/etc/neutron/rootwrap.d/lbaas-haproxy.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/lbaas-haproxy.filters';

        "/etc/neutron/rootwrap.d/nec-plugin.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/nec-plugin.filters';

        "/etc/neutron/rootwrap.d/ryu-plugin.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/ryu-plugin.filters';

        "/etc/neutron/rootwrap.d/dhcp.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/dhcp.filters';

        "/etc/neutron/rootwrap.d/l3.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/l3.filters';

        "/etc/neutron/rootwrap.d/linuxbridge-plugin.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/linuxbridge-plugin.filters';

        "/etc/neutron/rootwrap.d/openvswitch-plugin.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/openvswitch-plugin.filters';

        "/etc/neutron/rootwrap.d/vpnaas.filters":
            source => 'puppet:///files/neutron/etc/rootwrap.d/vpnaas.filters';

        "/etc/neutron/fwaas_driver.ini":
            source => 'puppet:///files/neutron/etc/fwaas_driver.ini';

        "/etc/neutron/metering_agent.ini":
            source => 'puppet:///files/neutron/etc/metering_agent.ini';

        "/etc/neutron/services/loadbalancer/haproxy/lbaas_agent.ini":
            source => 'puppet:///files/neutron/etc/lbaas_agent.ini',
    }

    file { "/etc/neutron/neutron.conf":
        source => 'puppet:///files/neutron/etc/neutron.conf',
        notify => Class["neutron::services"],
    }

    file { "/etc/neutron/dhcp_agent.ini":
        source => 'puppet:///files/neutron/etc/dhcp_agent.ini',
        notify => Class["neutron::services"],
    }

    file { "/etc/neutron/l3_agent.ini":
        source => 'puppet:///files/neutron/etc/l3_agent.ini',
        notify => Class["neutron::services"],
    }

    file { "/etc/neutron/metadata_agent.ini":
        source => 'puppet:///files/neutron/etc/metadata_agent.ini',
        notify => Class["neutron::services"],
    }

    file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        source => 'puppet:///files/neutron/etc/plugins/ml2/ml2_conf.ini',
        notify => Class["neutron::services"],
    }
}
