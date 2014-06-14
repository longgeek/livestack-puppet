class ceilometer::services {
    service { ['ceilometer-api', 'ceilometer-collector', 'ceilometer-agent-compute', 'ceilometer-agent-central', 'ceilometer-agent-notification']:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
