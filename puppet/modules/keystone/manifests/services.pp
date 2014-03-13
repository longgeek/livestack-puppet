class keystone::services {
    service { "keystone":
        ensure => 'running',
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }

    exec { "check endpoint tables":
        command => 'sh /etc/keystone/keystone-endpoint.sh',
        path => $command_path,
        onlyif => "[ \"`mysql -ukeystone -pkeystone -h localhost keystone -e 'select * from keystone.endpoint;' | wc -l`\" -eq \"0\" ]",
    }
}
