class cinder::tables {
    exec { 'sync cinder db':
        command     => 'cinder-manage db sync',
        path        => $command_path,
        notify      => Class['cinder::services'],
        refreshonly => 'true',
    }

    exec { 'check cinder tables':
        command => 'cinder-manage db sync',
        path    => $command_path,
        notify  => Class['cinder::services'],
        onlyif  => "mysql -ucinder -pcinder -h localhost -e 'show databases' | grep cinder && \
                  [ \"`mysql -ucinder -pcinder -h localhost cinder -e 'show tables;' | wc -l`\" -eq \"0\" ]",
    }
}
