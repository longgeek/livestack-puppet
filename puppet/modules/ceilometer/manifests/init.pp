class ceilometer {
    Class['ceilometer'] -> Class['ceilometer::directorys'] -> Class['ceilometer::configs'] -> Class['ceilometer::tables'] -> Class['ceilometer::upstart'] -> Class['ceilometer::services']
    include ceilometer, ceilometer::directorys, ceilometer::configs, ceilometer::tables, ceilometer::upstart, ceilometer::services
}
