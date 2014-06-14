class keystone::tables {
    exec { 'sync keystone db':
        command     => 'keystone-manage db_sync',
        path        => $command_path,
        refreshonly => 'true',
        notify      => Class['keystone::services'],
    }

    exec { 'check keystone tables':
        command => 'keystone-manage db_sync',
        path    => $command_path,
        notify  => Class['keystone::services'],
        onlyif  => "mysql -ukeystone -pkeystone -h localhost -e 'show databases' | grep keystone && \
                  [ \"`mysql -ukeystone -pkeystone -h localhost keystone -e 'show tables;' | wc -l`\" -eq \"0\" ]",
    }
}
