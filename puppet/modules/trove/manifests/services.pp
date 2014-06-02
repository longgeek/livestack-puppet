class trove::services {
    service { ["trove-api", "trove-conductor", "trove-guestagent", "trove-taskmanager"]:
        ensure => 'running',
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
