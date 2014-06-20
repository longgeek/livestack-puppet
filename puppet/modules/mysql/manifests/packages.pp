class mysql::packages {
    package { ['mysql-server-5.6', 'python-mysqldb']:
        ensure => installed,
    }
}
