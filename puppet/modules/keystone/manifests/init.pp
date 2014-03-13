class keystone {
    Class['keystone'] -> Class['keystone::directorys'] -> Class['keystone::configs'] -> Class['keystone::tables'] -> Class['keystone::upstart'] -> Class['keystone::services']
    include keystone, keystone::directorys, keystone::configs, keystone::tables, keystone::upstart, keystone::services
}
