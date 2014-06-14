class trove::upstart {
    file { '/etc/init/trove-api.conf':
        source => 'puppet:///files/trove/init/trove-api.conf',
        notify => Exec['update-rc.d trove'],
    }

    file { '/etc/init/trove-conductor.conf':
        source => 'puppet:///files/trove/init/trove-conductor.conf',
        notify => Exec['update-rc.d trove'],
    }

    file { '/etc/init/trove-taskmanager.conf':
        source => 'puppet:///files/trove/init/trove-taskmanager.conf',
        notify => Exec['update-rc.d trove'],
    }

    exec { 'update-rc.d trove':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/trove-api; \
                    ln -s /lib/init/upstart-job /etc/init.d/trove-conductor; \
                    ln -s /lib/init/upstart-job /etc/init.d/trove-taskmanager; \
                    update-rc.d trove-api defaults 50; \
                    update-rc.d trove-conductor defaults 50; \
                    update-rc.d trove-taskmanager defaults 50',
        path    => $command_path,
        unless  => 'ls /etc/init.d/trove-taskmanager',
    }
}
