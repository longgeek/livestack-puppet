class cinder::iscsi {
    package { ['open-iscsi', 'tgt', 'lvm2', 'sysfsutils']:
        ensure => installed,
    }

    file { '/etc/tgt/targets.conf':
        source  => 'puppet:///files/cinder/etc/targets.conf',
        require => Package['open-iscsi', 'tgt', 'lvm2', 'sysfsutils'],
        notify  => Service['tgt', 'open-iscsi'],
    }

    service { ['tgt', 'open-iscsi']:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
