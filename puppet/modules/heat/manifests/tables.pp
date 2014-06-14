class heat::tables {
    exec { 'sync heat db':
        command     => 'heat-manage db_sync',
        path        => $command_path,
        refreshonly => 'true',
        notify      => Class['heat::services'],
    }

    exec { 'check heat tables':
        command => 'heat-manage db_sync',
        path    => $command_path,
        notify  => Class['heat::services'],
        onlyif  => "mysql -uheat -pheat -h localhost -e 'show databases' | grep heat && \
                  [ \"`mysql -uheat -pheat -h localhost heat -e 'show tables;' | wc -l`\" -eq \"0\" ]",
    }
}
