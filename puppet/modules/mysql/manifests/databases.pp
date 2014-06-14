class mysql::databases {
    exec { 'create keystone db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database keystone default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on keystone.* to 'keystone'@'localhost' identified by 'keystone';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep keystone",
        notify  => Exec['create glance db'],
    }

    exec { 'create glance db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database glance default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on glance.* to 'glance'@'localhost' identified by 'glance';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep glance",
        notify  => Exec['create cinder db'],
    }

    exec { 'create cinder db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database cinder default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on cinder.* to 'cinder'@'localhost' identified by 'cinder';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep cinder",
        notify  => Exec['create nova db'],
    }

    exec { 'create nova db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database nova default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on nova.* to 'nova'@'localhost' identified by 'nova';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep nova",
        notify  => Exec['create neutron db'],
    }

    exec { 'create neutron db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database neutron default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on neutron.* to 'neutron'@'localhost' identified by 'neutron';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep neutron",
        notify  => Exec['create ceilometer db'],
    }

    exec { 'create ceilometer db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database ceilometer default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on ceilometer.* to 'ceilometer'@'localhost' identified by 'ceilometer';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep ceilometer",
        notify  => Exec['create savanna db'],
    }

    exec { 'create savanna db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database savanna default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on savanna.* to 'savanna'@'localhost' identified by 'savanna';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep savanna",
        notify  => Exec['create heat db'],
    }

    exec { 'create heat db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database heat default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on heat.* to 'heat'@'localhost' identified by 'heat';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep heat",
        notify  => Class['mysql::services'],
    }

    exec { 'create trove db':
        command => "mysql -uroot -p$mysql_root_pass -e \"create database trove default character set utf8;\" && \
                    mysql -uroot -p$mysql_root_pass -e \"grant all on trove.* to 'trove'@'localhost' identified by 'trove';\"",
        path    => $command_path,
        unless  => "mysqlshow -uroot -p$mysql_root_pass | grep trove",
    }
}
