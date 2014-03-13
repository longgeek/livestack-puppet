node 'default' {
    Class['bases'] -> Class['mysql'] -> Class['rabbitmq'] -> Class['keystone'] -> Class['glance'] -> Class['cinder'] -> Class['nova'] -> Class['horizon'] -> Class['swift'] -> Class['ceilometer'] -> Class['heat'] -> Class['neutron']
    include bases, mysql, rabbitmq, keystone, glance, cinder, nova, horizon, swift, ceilometer, heat, neutron
}

$command_path                       = '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/bin/bash:/livestack/bin'
$mysql_root_pass                    = 'livestack'
$enable_neutron                     = 'True'
$source_dir                         = '/livestack/sources'
