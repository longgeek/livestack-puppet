class savanna::directorys {
    file { ['/etc/savanna', '/var/log/savanna', '/var/lib/savanna']:
        ensure => directory,
    }
}
