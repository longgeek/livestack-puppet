class horizon {
    Class['horizon'] -> Class['horizon::packages'] -> Class['horizon::configs'] -> Class['horizon::services']
    include horizon, horizon::packages, horizon::configs, horizon::services
}
