class nova::tables {
    exec { "sync nova db":
        command => 'nova-manage db sync',
        path => $command_path,
        refreshonly => 'true',
        notify => Class['nova::services'],
    }

    exec { "check nova tables":
        command => 'nova-manage db sync',
        path => $command_path,
        onlyif => "mysql -unova -pnova -h localhost -e 'show databases' | grep nova && \
                  [ \"`mysql -unova -pnova -h localhost nova -e 'show tables;' | wc -l`\" -eq \"0\" ]",
        notify => Class['nova::services'],
    }

    if $enable_neutron == 'False' {
        exec { "create fixedip":
            command => 'nova-manage network create private --fixed_range_v4=10.0.0.0/24 --num_networks=1 --bridge=br100 --bridge_interface=eth0 --network_size=256',
            path => $command_path,
            unless => 'nova-manage fixed list',
        }
    }
}
