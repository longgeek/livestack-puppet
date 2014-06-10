class trove {
    Class['trove'] -> Class['trove::directorys'] -> Class['trove::templates'] -> Class['trove::configs'] -> Class['trove::tables'] -> Class['trove::upstart'] -> Class['trove::services'] -> Class['trove::neutron']
    include trove, trove::directorys, trove::templates, trove::configs, trove::tables, trove::upstart, trove::services, trove::neutron
}
