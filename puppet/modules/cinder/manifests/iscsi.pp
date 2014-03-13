class cinder::iscsi {
    package { ["iscsitarget", "open-iscsi", "iscsitarget-dkms", "lvm2"]:
        ensure => installed,
        notify => Exec["enable iscsitarget"],
    }

    exec { "enable iscsitarget":
        command => "sed -i 's/false/true/g' /etc/default/iscsitarget",
        path => $command_path,
        onlyif => 'grep false /etc/default/iscsitarget',
        notify => Service["iscsitarget", "open-iscsi"],
    }

    service { ["iscsitarget", "open-iscsi"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
