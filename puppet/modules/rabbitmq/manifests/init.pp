class rabbitmq {
    Class['rabbitmq'] -> Class['rabbitmq::packages'] -> Class['rabbitmq::services']
    include rabbitmq, rabbitmq::packages, rabbitmq::services
}
