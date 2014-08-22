class trove::configs {
    file {
        '/etc/trove/cloudinit/README':
            source => 'puppet:///files/trove/etc/cloudinit/README';

        '/etc/trove/conf.d/README':
            source => 'puppet:///files/trove/etc/conf.d/README';

        '/etc/trove/conf.d/guest_info':
            source => 'puppet:///files/trove/etc/conf.d/guest_info';

        '/etc/logrotate.d/trove':
            source => 'puppet:///files/trove/logrotate.d/trove',
    }

    file {'/etc/trove/api-paste.ini':
        source => 'puppet:///files/trove/etc/api-paste.ini',
        notify => Class['trove::tables', 'trove::services'],
    }

    file { '/etc/trove/trove-taskmanager.conf':
        source  => 'puppet:///files/trove/etc/trove-taskmanager.conf',
        notify  => Class['trove::tables', 'trove::services'],
        require => File['/etc/trove/api-paste.ini'],
    }

    file { '/etc/trove/trove-conductor.conf':
        source  => 'puppet:///files/trove/etc/trove-conductor.conf',
        notify  => Class['trove::tables', 'trove::services'],
        require => File['/etc/trove/trove-taskmanager.conf'],
    }

    file { '/etc/trove/trove.conf':
        source  => 'puppet:///files/trove/etc/trove.conf',
        notify  => Class['trove::tables', 'trove::services'],
        require => File['/etc/trove/trove-conductor.conf'],
    }
}
