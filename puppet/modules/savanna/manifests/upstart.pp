class savanna::upstart {
    file { "/etc/init/savanna-api.conf":
        source => 'puppet:///files/savanna/init/savanna-api.conf',
    }

    exec { "update-rc.d savanna":
        command => 'ln -s /lib/init/upstart-job /etc/init.d/savanna-api && \
                    update-rc.d savanna-api defaults 79',
        path => $command_path,
        unless => 'ls /etc/init.d/savanna-api',
    }
}
