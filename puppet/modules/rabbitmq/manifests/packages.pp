class rabbitmq::packages {
    package { 'rabbitmq-server':
        ensure  => 'installed',
        require => Class['mysql'],
    }
}
