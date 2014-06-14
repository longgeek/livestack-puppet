class glance::services {
    service { ['glance-api', 'glance-registry']:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
