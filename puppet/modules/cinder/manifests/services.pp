class cinder::services {
    service { ['cinder-api', 'cinder-scheduler', 'cinder-volume']:
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
