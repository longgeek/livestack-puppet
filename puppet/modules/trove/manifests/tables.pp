class trove::tables {
    exec { 'sync trove db':
        command     => 'trove-manage db_sync',
        path        => $command_path,
        refreshonly => 'true',
        notify      => Class['trove::services'],
    }

    exec { 'check trove tables':
        command => 'trove-manage db_sync',
        path    => $command_path,
        onlyif  => "mysql -utrove -ptrove -h localhost -e 'show databases' | grep trove && \
                    [ \"`mysql -utrove -ptrove -h localhost trove -e 'show tables;' | wc -l`\" -eq \"0\" ]",
        notify  => Class['trove::services'],
    }
}
