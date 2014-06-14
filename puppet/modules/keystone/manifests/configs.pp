class keystone::configs {
    file {
        '/etc/profile.d/keystone-env.sh':
            source => 'puppet:///files/keystone/profile.d/keystone-env.sh';

        '/etc/logrotate.d/keystone':
            source => 'puppet:///files/keystone/logrotate.d/keystone';

        '/etc/keystone/keystone-endpoint.sh':
            source => 'puppet:///files/keystone/etc/keystone-endpoint.sh';

        '/etc/keystone/keystone-paste.ini':
            source => 'puppet:///files/keystone/etc/keystone-paste.ini';

        '/etc/keystone/policy.json':
            source => 'puppet:///files/keystone/etc/policy.json';

        '/etc/keystone/logging.conf':
            source => 'puppet:///files/keystone/etc/logging.conf';

        '/etc/keystone/keystone.conf':
            source => 'puppet:///files/keystone/etc/keystone.conf',
            notify => Class['keystone::tables', 'keystone::services'],
    }
}
