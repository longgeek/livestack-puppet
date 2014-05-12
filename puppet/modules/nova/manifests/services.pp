class nova::services {
    service { ["nova-api", "nova-cert", "nova-scheduler", "nova-compute", "nova-conductor", "nova-consoleauth", "nova-objectstore", "nova-novncproxy"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
