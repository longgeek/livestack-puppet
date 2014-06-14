class nova {
    Class['nova'] -> Class['nova::packages'] -> Class['nova::directorys'] -> Class['nova::upstart'] -> Class['nova::configs'] -> Class['nova::tables'] -> Class['nova::services']
    include nova, nova::packages, nova::directorys, nova::upstart, nova::configs, nova::tables, nova::services
}
