class ceilometer::upstart {
    file {
        '/etc/init/ceilometer-api.conf':
            source => 'puppet:///files/ceilometer/init/ceilometer-api.conf';

        '/etc/init/ceilometer-collector.conf':
            source => 'puppet:///files/ceilometer/init/ceilometer-collector.conf';

        '/etc/init/ceilometer-agent-central.conf':
            source => 'puppet:///files/ceilometer/init/ceilometer-agent-central.conf';

        '/etc/init/ceilometer-agent-notification.conf':
            source => 'puppet:///files/ceilometer/init/ceilometer-agent-notification.conf';

        '/etc/init/ceilometer-agent-compute.conf':
            source => 'puppet:///files/ceilometer/init/ceilometer-agent-compute.conf',
    }

    exec { 'update-rc.d ceilometer':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/ceilometer-api; \
                    ln -s /lib/init/upstart-job /etc/init.d/ceilometer-collector; \
                    ln -s /lib/init/upstart-job /etc/init.d/ceilometer-agent-central; \
                    ln -s /lib/init/upstart-job /etc/init.d/ceilometer-agent-notification; \
                    ln -s /lib/init/upstart-job /etc/init.d/ceilometer-agent-compute; \
                    update-rc.d ceilometer-api defaults 80; \
                    update-rc.d ceilometer-collector defaults 81; \
                    update-rc.d ceilometer-agent-central defaults 82; \
                    update-rc.d ceilometer-agent-notification defaults 82; \
                    update-rc.d ceilometer-agent-compute defaults 83',
        path    => $command_path,
        unless  => 'ls /etc/init.d/ceilometer-agent-compute',
    }
}
