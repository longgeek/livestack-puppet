class ceilometer::tables {
    exec { "sync ceilometer db":
        command => 'ceilometer-dbsync',
        path => $command_path,
        refreshonly => 'true',
        notify => Class['ceilometer::services'],
    }

    exec { "check ceilometer tables":
        command => 'ceilometer-dbsync',
        path => $command_path,
        onlyif => "mysql -uceilometer -pceilometer -h localhost -e 'show databases' | grep ceilometer && \
                  [ \"`mysql -uceilometer -pceilometer -h localhost ceilometer -e 'show tables;' | wc -l`\" -eq \"0\" ]",
        notify => Class['ceilometer::services'],
    }
}
