class cinder::directorys {
    file { ["/etc/cinder", "/etc/cinder/rootwrap.d/", "/var/log/cinder", "/etc/puppet/files/cinder/volumes"]:
        ensure => directory,
    }
}
