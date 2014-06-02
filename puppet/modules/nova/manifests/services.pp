class nova::services {
    service { ["nova-api", "nova-cert", "nova-scheduler", "nova-compute", "nova-conductor", "nova-consoleauth", "nova-objectstore"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
