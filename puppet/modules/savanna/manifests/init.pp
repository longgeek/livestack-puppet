class savanna {
    Class['savanna'] -> Class['savanna::directorys'] -> Class['savanna::upstart'] -> Class['savanna::configs'] -> Class['savanna::services']
    include savanna, savanna::directorys, savanna::upstart, savanna::configs, savanna::services
}
