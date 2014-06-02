class cinder::iscsi {
    package { ["open-iscsi", "tgt", "lvm2"]:
        ensure => installed,
        notify => Service["tgt", "open-iscsi"],
    }

    service { ["tgt", "open-iscsi"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
