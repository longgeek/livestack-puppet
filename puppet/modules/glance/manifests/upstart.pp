class glance::upstart {
    file {
        '/etc/init/glance-api.conf':
            source => 'puppet:///files/glance/init/glance-api.conf';

        '/etc/init/glance-registry.conf':
            source => 'puppet:///files/glance/init/glance-registry.conf',
            notify => Exec['update-rc.d glance'],
    }

    exec { 'update-rc.d glance':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/glance-api; \
                    ln -s /lib/init/upstart-job /etc/init.d/glance-registry; \
                    update-rc.d glance-api defaults 61; \
                    update-rc.d glance-registry defaults 62',
        path    => $command_path,
        unless  => 'ls /etc/init.d/glance-registry',
    }
}
