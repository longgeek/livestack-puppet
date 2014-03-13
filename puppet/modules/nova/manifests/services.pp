class nova::services {
    service { ["nova-api", "nova-cert", "nova-scheduler", "nova-compute", "nova-conductor", "nova-consoleauth", "nova-novncproxy", "nova-objectstore"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }

    if $enable_neutron == 'False' {
        service { "nova-network":
            ensure => running,
            enable => true,
            hasstatus => true,
            hasrestart => true,
        }
    } else {
        service { "nova-network":
            ensure => stopped,
            enable => false,
        }
    }
}
