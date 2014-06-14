class cinder::upstart {
    file {
        '/etc/init/cinder-api.conf':
            source => 'puppet:///files/cinder/init/cinder-api.conf';

        '/etc/init/cinder-scheduler.conf':
            source => 'puppet:///files/cinder/init/cinder-scheduler.conf';

        '/etc/init/cinder-volume.conf':
            source => 'puppet:///files/cinder/init/cinder-volume.conf',
    }

    exec { 'update-rc.d cinder':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/cinder-api; \
                    ln -s /lib/init/upstart-job /etc/init.d/cinder-scheduler; \
                    ln -s /lib/init/upstart-job /etc/init.d/cinder-volume; \
                    update-rc.d cinder-api defaults 50; \
                    update-rc.d cinder-scheduler defaults 50; \
                    update-rc.d cinder-volume defaults 50',
        path    => $command_path,
        unless  => 'ls /etc/init.d/cinder-volume',
    }
}
