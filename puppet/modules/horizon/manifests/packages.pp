class horizon::packages {
    package { ['apache2', 'libapache2-mod-wsgi', 'python-memcache']:
        ensure => installed,
    }
}
