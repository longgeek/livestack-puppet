class cinder::configs {
    file {
        "/etc/cinder/policy.json":
            source => 'puppet:///files/cinder/etc/policy.json';

        "/etc/cinder/rootwrap.conf":
            source => 'puppet:///files/cinder/etc/rootwrap.conf',
    }

    file { "/etc/cinder/cinder.conf":
        source => 'puppet:///files/cinder/etc/cinder.conf',
        notify => Class['cinder::tables', 'cinder::services'],
    }

    file { "/etc/cinder/api-paste.ini":
        source => 'puppet:///files/cinder/etc/api-paste.ini',
        notify => Class['cinder::tables', 'cinder::services'],
    }
}
