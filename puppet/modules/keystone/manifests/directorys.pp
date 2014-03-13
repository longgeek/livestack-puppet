class keystone::directorys {
    file { ["/etc/keystone", "/var/log/keystone"]:
        ensure => directory,
    }
}
