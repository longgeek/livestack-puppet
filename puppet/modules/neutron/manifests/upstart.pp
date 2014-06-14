class neutron::upstart {
    file {
        '/etc/init/neutron-l3-agent.conf':
            source => 'puppet:///files/neutron/init/neutron-l3-agent.conf';

        '/etc/init/neutron-metadata-agent.conf':
            source => 'puppet:///files/neutron/init/neutron-metadata-agent.conf';

        '/etc/init/neutron-openvswitch-agent.conf':
            source => 'puppet:///files/neutron/init/neutron-openvswitch-agent.conf';

        '/etc/init/neutron-dhcp-agent.conf':
            source => 'puppet:///files/neutron/init/neutron-dhcp-agent.conf';

        '/etc/init/neutron-vpn-agent.conf':
            source => 'puppet:///files/neutron/init/neutron-vpn-agent.conf';

        '/etc/init/neutron-lbaas-agent.conf':
            source => 'puppet:///files/neutron/init/neutron-lbaas-agent.conf';

        '/etc/init/neutron-metering-agent.conf':
            source => 'puppet:///files/neutron/init/neutron-metering-agent.conf';

        '/etc/init/neutron-server.conf':
            source => 'puppet:///files/neutron/init/neutron-server.conf',
    }

    exec { 'update-rc.d neutron':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/neutron-l3-agent; \
                    ln -s /lib/init/upstart-job /etc/init.d/neutron-metadata-agent; \
                    ln -s /lib/init/upstart-job /etc/init.d/neutron-openvswitch-agent; \
                    ln -s /lib/init/upstart-job /etc/init.d/neutron-server; \
                    ln -s /lib/init/upstart-job /etc/init.d/neutron-vpn-agent; \
                    ln -s /lib/init/upstart-job /etc/init.d/neutron-lbaas-agent; \
                    ln -s /lib/init/upstart-job /etc/init.d/neutron-metering-agent; \
                    ln -s /lib/init/upstart-job /etc/init.d/neutron-dhcp-agent; \
                    update-rc.d neutron-l3-agent defaults 88; \
                    update-rc.d neutron-metadata-agent defaults 89; \
                    update-rc.d neutron-openvswitch-agent defaults 90; \
                    update-rc.d neutron-dhcp-agent defaults 91; \
                    update-rc.d neutron-server defaults 92; \
                    update-rc.d neutron-vpn-agent defaults 93; \
                    update-rc.d neutron-metering-agent defaults 93; \
                    update-rc.d neutron-lbaas-agent defaults 94',
        path    => $command_path,
        unless  => 'ls /etc/init.d/neutron-dhcp-agent',
    }
}
