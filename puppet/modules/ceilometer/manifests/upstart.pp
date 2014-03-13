class ceilometer::upstart {
    file {
        "/etc/init/ceilometer-api.conf":
            source => 'puppet:///files/ceilometer/init/ceilometer-api.conf';

        "/etc/init/ceilometer-collector.conf":
            source => 'puppet:///files/ceilometer/init/ceilometer-collector.conf';

        "/etc/init/ceilometer-agent-central.conf":
            source => 'puppet:///files/ceilometer/init/ceilometer-agent-central.conf';

        "/etc/init/ceilometer-agent-compute.conf":
            source => 'puppet:///files/ceilometer/init/ceilometer-agent-compute.conf',
    }

    exec { "update-rc.d ceilometer":
        command => 'ln -s /lib/init/upstart-job /etc/init.d/ceilometer-api; \
                    ln -s /lib/init/upstart-job /etc/init.d/ceilometer-collector; \
                    ln -s /lib/init/upstart-job /etc/init.d/ceilometer-agent-central; \
                    ln -s /lib/init/upstart-job /etc/init.d/ceilometer-agent-compute; \
                    update-rc.d keystone defaults 80; \
                    update-rc.d keystone defaults 81; \
                    update-rc.d keystone defaults 82; \
                    update-rc.d keystone defaults 83',
        path => $command_path,
        unless => 'ls /etc/init.d/ceilometer-agent-compute',
    }
}
