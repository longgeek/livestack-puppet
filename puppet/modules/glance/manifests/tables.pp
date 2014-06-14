class glance::tables {
    exec { 'sync glance db':
        command     => 'glance-manage db_sync',
        path        => $command_path,
        refreshonly => 'true',
        notify      => Class['glance::services'],
    }

    exec { 'check glance tables':
        command => 'glance-manage db_sync',
        path    => $command_path,
        notify  => Class['glance::services'],
        onlyif  => "mysql -uglance -pglance -h localhost -e 'show databases' | grep glance && \
                  [ \"`mysql -uglance -pglance -h localhost glance -e 'show tables;' | wc -l`\" -eq \"0\" ]",
    }
}
