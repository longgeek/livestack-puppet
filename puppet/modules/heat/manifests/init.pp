class heat {
    Class['heat'] -> Class['heat::directorys'] -> Class['heat::upstart'] -> Class['heat::configs'] -> Class['heat::tables'] -> Class['heat::services']
    include heat, heat::directorys, heat::upstart, heat::configs, heat::tables, heat::services
}
