class trove {
    Class['trove'] -> Class['trove::directorys'] -> Class['trove::configs'] -> Class['trove::tables'] -> Class['trove::upstart'] -> Class['trove::services']
    include trove, trove::directorys, trove::configs, trove::tables, trove::upstart, trove::services
}
