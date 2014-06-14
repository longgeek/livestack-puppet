class savanna::services {
    service { 'savanna-api':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
