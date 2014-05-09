class trove::directorys {
    file { ["/etc/trove", "/var/log/trove", "/etc/trove/cloudinit", "/etc/trove/conf.d", "/var/lib/trove"]:
        ensure => directory,
    }
}
