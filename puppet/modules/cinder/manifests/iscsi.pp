class cinder::iscsi {
    package { ["tgt", "open-iscsi", "lvm2"]:
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
