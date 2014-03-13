class cinder::tables {
    exec { "sync cinder db":
        command => 'cinder-manage db sync',
        path => $command_path,
        refreshonly => 'true',
        notify => Class["cinder::services"],
    }

    exec { "check cinder tables":
        command => 'cinder-manage db sync',
        path => $command_path,
        onlyif => "mysql -ucinder -pcinder -h localhost -e 'show databases' | grep cinder && \
                  [ \"`mysql -ucinder -pcinder -h localhost cinder -e 'show tables;' | wc -l`\" -eq \"0\" ]",
        notify => Class["cinder::services"],
    }
}
