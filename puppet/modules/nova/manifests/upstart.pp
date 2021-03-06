class nova::upstart {
    file {
        '/etc/init/nova-api.conf':
            source => 'puppet:///files/nova/init/nova-api.conf';

        '/etc/init/nova-cert.conf':
            source => 'puppet:///files/nova/init/nova-cert.conf';

        '/etc/init/nova-compute.conf':
            source => 'puppet:///files/nova/init/nova-compute.conf';

        '/etc/init/nova-conductor.conf':
            source => 'puppet:///files/nova/init/nova-conductor.conf';

        '/etc/init/nova-scheduler.conf':
            source => 'puppet:///files/nova/init/nova-scheduler.conf';

        '/etc/init/nova-consoleauth.conf':
            source => 'puppet:///files/nova/init/nova-consoleauth.conf';

        '/etc/init/nova-novncproxy.conf':
            content => template('nova-novncproxy.conf.erb');

        '/etc/init/nova-xvpvncproxy.conf':
            source => 'puppet:///files/nova/init/nova-xvpvncproxy.conf';

        '/etc/init/nova-spicehtml5proxy.conf':
            source => 'puppet:///files/nova/init/nova-spicehtml5proxy.conf';

        '/etc/init/nova-objectstore.conf':
            source => 'puppet:///files/nova/init/nova-objectstore.conf',
    }

    exec { 'update-rc.d nova':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/nova-api && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-cert && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-compute && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-conductor && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-scheduler && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-consoleauth && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-novncproxy && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-xvpvncproxy && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-objectstore && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-spicehtml5proxy && \
                    update-rc.d nova-api defaults 50; \
                    update-rc.d nova-cert defaults 50; \
                    update-rc.d nova-scheduler defaults 50; \
                    update-rc.d nova-conductor defaults 50; \
                    update-rc.d nova-compute defaults 50; \
                    update-rc.d nova-spicehtml5proxy defaults 50; \
                    update-rc.d nova-consoleauth defaults 50; \
                    update-rc.d nova-novncproxy defaults 50; \
                    update-rc.d nova-xvpvncproxy defaults 50; \
                    update-rc.d nova-objectstore defaults 50',
        path    => $command_path,
        unless  => 'ls /etc/init.d/nova-objectstore',
    }
}
