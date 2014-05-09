class trove::upstart {
    file { "/etc/init/trove-api.conf":
        source => "puppet:///files/trove/init/trove-api.conf",
        notify => Exec["update-rc.d trove"],
    }

    file { "/etc/init/trove-conductor.conf":
        source => "puppet:///files/trove/init/trove-conductor.conf",
        notify => Exec["update-rc.d trove"],
    }

    file { "/etc/init/trove-guestagent.conf":
        source => "puppet:///files/trove/init/trove-guestagent.conf",
        notify => Exec["update-rc.d trove"],
    }

    file { "/etc/init/trove-taskmanager.conf":
        source => "puppet:///files/trove/init/trove-taskmanager.conf",
        notify => Exec["update-rc.d trove"],
    }

    exec { "update-rc.d trove":
        command => 'ln -s /lib/init/upstart-job /etc/init.d/trove-api; \
                    ln -s /lib/init/upstart-job /etc/init.d/trove-conductor; \
                    ln -s /lib/init/upstart-job /etc/init.d/trove-guestagent; \
                    ln -s /lib/init/upstart-job /etc/init.d/trove-taskmanager; \
                    update-rc.d trove-api defaults 60; \
                    update-rc.d trove-conductor defaults 60; \
                    update-rc.d trove-guestagent defaults 60; \
                    update-rc.d trove-taskmanager defaults 60',
        path => $command_path,
        unless => 'ls /etc/init.d/trove-taskmanager',
    }
}
