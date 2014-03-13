class horizon::services {
    service { "apache2":
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
