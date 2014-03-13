class glance {
    Class['glance'] -> Class['glance::directorys'] -> Class['glance::configs'] -> Class['glance::tables'] -> Class['glance::upstart'] -> Class['glance::services']
    include glance, glance::directorys, glance::configs, glance::tables, glance::upstart, glance::services
}
