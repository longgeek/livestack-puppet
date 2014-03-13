class mysql::services {
    service { "mysql":
        ensure => 'running',
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
