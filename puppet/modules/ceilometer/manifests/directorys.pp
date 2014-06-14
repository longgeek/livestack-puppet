class ceilometer::directorys {
    file { ['/etc/ceilometer', '/var/log/ceilometer', '/var/lib/ceilometer']:
        ensure => directory,
    }
}
