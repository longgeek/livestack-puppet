class heat::directorys {
    file { ["/etc/heat", "/etc/heat/templates", "/etc/heat/environment.d", "/var/log/heat"]:
        ensure => directory,
    }
}
