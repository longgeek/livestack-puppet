class glance::directorys {
    file { ["/etc/glance", "/var/log/glance", "/var/lib/glance"]:
        ensure => directory,
    }
}
