class rabbitmq::services {
    service { 'rabbitmq-server':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
