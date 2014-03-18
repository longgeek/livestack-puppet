class cinder::iscsi {
    package { ["tgt", "open-iscsi", "lvm2"]:
        ensure => installed,
        notify => File["/etc/tgt/targets.conf"],
    }

    file { "/etc/tgt/targets.conf":
        source => 'puppet:///files/cinder/etc/targets.conf',
        notify => Service["tgt", "open-iscsi"],
    }

    service { ["tgt", "open-iscsi"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
