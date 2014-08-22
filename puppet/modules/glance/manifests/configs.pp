class glance::configs {
    file {
        '/etc/logrotate.d/glance':
            source => 'puppet:///files/glance/logrotate.d/glance';

        '/etc/glance/policy.json':
            source => 'puppet:///files/glance/etc/policy.json';

        '/etc/glance/schema-image.json':
            source => 'puppet:///files/glance/etc/schema-image.json';

        '/etc/glance/glance-api-paste.ini':
            source => 'puppet:///files/glance/etc/glance-api-paste.ini';

        '/etc/glance/glance-registry-paste.ini':
            source => 'puppet:///files/glance/etc/glance-registry-paste.ini';

        '/etc/glance/glance-cache.conf':
            source => 'puppet:///files/glance/etc/glance-cache.conf';
    }

    file { '/etc/glance/glance-api.conf':
        source => 'puppet:///files/glance/etc/glance-api.conf',
        notify => Class['glance::tables', 'glance::services'],
    }

    file {'/etc/glance/glance-registry.conf':
        source  => 'puppet:///files/glance/etc/glance-registry.conf',
        notify  => Class['glance::tables', 'glance::services'],
        require => File['/etc/glance/glance-api.conf'],
    }
}
