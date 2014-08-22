class nova::configs {
    file {
        '/etc/logrotate.d/nova':
            source => 'puppet:///files/nova/logrotate.d/nova';

        '/etc/nova/policy.json':
            source => 'puppet:///files/nova/etc/policy.json';

        '/etc/nova/rootwrap.conf':
            source => 'puppet:///files/nova/etc/rootwrap.conf';

        '/etc/nova/rootwrap.d/api-metadata.filters':
            source => 'puppet:///files/nova/etc/rootwrap.d/api-metadata.filters';

        '/etc/nova/rootwrap.d/baremetal-compute-ipmi.filters':
            source => 'puppet:///files/nova/etc/rootwrap.d/baremetal-compute-ipmi.filters';

        '/etc/nova/rootwrap.d/baremetal-deploy-helper.filters':
            source => 'puppet:///files/nova/etc/rootwrap.d/baremetal-deploy-helper.filters';

        '/etc/nova/rootwrap.d/compute.filters':
            source => 'puppet:///files/nova/etc/rootwrap.d/compute.filters';

        '/etc/nova/rootwrap.d/docker.filters':
            source => 'puppet:///files/nova/etc/rootwrap.d/docker.filters';

        '/etc/nova/rootwrap.d/network.filters':
            source => 'puppet:///files/nova/etc/rootwrap.d/network.filters',
    }

    file { '/etc/nova/api-paste.ini':
        source => 'puppet:///files/nova/etc/api-paste.ini',
        notify => Class['nova::tables', 'nova::services'],
    }

    if $enable_spice == 'True' {
        file { '/etc/nova/nova.conf':
            source  => 'puppet:///files/nova/etc/nova.conf.spice',
            require => File['/etc/nova/api-paste.ini'],
            notify  => Class['nova::tables', 'nova::services'],
        }

    } else {
        file { '/etc/nova/nova.conf':
            source  => 'puppet:///files/nova/etc/nova.conf',
            require => File['/etc/nova/api-paste.ini'],
            notify  => Class['nova::tables', 'nova::services'],
        }
    }

    exec { 'nbd module':
        command => 'echo nbd >> /etc/modules && modprobe nbd',
        path    => $command_path,
        unless  => 'grep nbd /etc/modules',
        require => File['/etc/nova/nova.conf'],
    }
}
