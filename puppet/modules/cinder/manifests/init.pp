class cinder {
    Class['cinder'] -> Class['cinder::volumes'] -> Class['cinder::iscsi'] -> Class['cinder::directorys'] -> Class['cinder::configs'] -> Class['cinder::tables'] -> Class['cinder::upstart'] -> Class['cinder::services']
    include cinder, cinder::volumes, cinder::iscsi, cinder::directorys, cinder::configs, cinder::tables, cinder::upstart, cinder::services

}
