class mysql::packages {
    package { ["mysql-server", "python-mysqldb"]:
        ensure => installed,
    }
}
