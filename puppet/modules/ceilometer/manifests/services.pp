class ceilometer::services {
    service { ["ceilometer-api", "ceilometer-collector", "ceilometer-agent-compute", "ceilometer-agent-central"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
