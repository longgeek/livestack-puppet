class nova::upstart {
    file { 
        "/etc/init/nova-api.conf":
            source => 'puppet:///files/nova/init/nova-api.conf';

        "/etc/init/nova-cert.conf":
            source => 'puppet:///files/nova/init/nova-cert.conf';

        "/etc/init/nova-compute.conf":
            source => 'puppet:///files/nova/init/nova-compute.conf';

        "/etc/init/nova-conductor.conf":
            source => 'puppet:///files/nova/init/nova-conductor.conf';

        "/etc/init/nova-scheduler.conf":
            source => 'puppet:///files/nova/init/nova-scheduler.conf';

        "/etc/init/nova-consoleauth.conf":
            source => 'puppet:///files/nova/init/nova-consoleauth.conf';

        "/etc/init/nova-novncproxy.conf":
            content => template("nova-novncproxy.conf.erb");

        "/etc/init/nova-xvpvncproxy.conf":
            source => 'puppet:///files/nova/init/nova-xvpvncproxy.conf';

        "/etc/init/nova-objectstore.conf":
            source => 'puppet:///files/nova/init/nova-objectstore.conf',
    }

    exec { "update-rc.d nova":
        command => 'ln -s /lib/init/upstart-job /etc/init.d/nova-api && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-cert && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-compute && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-network && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-conductor && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-scheduler && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-consoleauth && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-novncproxy && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-xvpvncproxy && \
                    ln -s /lib/init/upstart-job /etc/init.d/nova-objectstore && \
                    update-rc.d nova-api defaults 66 && \
                    update-rc.d nova-cert defaults 67 && \
                    update-rc.d nova-scheduler defaults 68 && \
                    update-rc.d nova-conductor defaults 69 && \
                    update-rc.d nova-compute defaults 70 && \
                    update-rc.d nova-network defaults 71 && \
                    update-rc.d nova-consoleauth defaults 71 && \
                    update-rc.d nova-novncproxy defaults 72 && \
                    update-rc.d nova-xvpvncproxy defaults 73 && \
                    update-rc.d nova-objectstore defaults 74',
        path => $command_path,
        unless => 'ls /etc/init.d/nova-objectstore',
    }
}
