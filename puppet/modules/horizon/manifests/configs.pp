class horizon::configs {
    file { "$source_dir/horizon":
        ensure  => directory,
        recurse => true,
        owner   => www-data,
        group   => www-data,
        notify  => File["$source_dir/horizon/.blackhole"],
    }

    file { "$source_dir/horizon/.blackhole":
        ensure => directory,
    }

    file { "$source_dir/horizon/openstack_dashboard/settings.py":
        source => 'puppet:///files/horizon/etc/settings.py',
        owner  => 'www-data',
        group  => 'www-data',
        notify => Class['horizon::services'],
    }

    file { "$source_dir/horizon/openstack_dashboard/local/local_settings.py":
        source => 'puppet:///files/horizon/etc/local_settings.py',
        owner  => 'www-data',
        group  => 'www-data',
        notify => Class['horizon::services'],
    }

    file { '/etc/apache2/envvars':
        source => 'puppet:///files/horizon/etc/envvars',
        notify => Class['horizon::services'],
    }

    file { '/etc/apache2/sites-available/horizon.conf':
        content => template('horizon.conf.erb'),
        notify  => Class['horizon::services'],
    }

    file { '/etc/apache2/sites-enabled/horizon.conf':
        ensure => link,
        target => '/etc/apache2/sites-available/horizon.conf',
        notify => Class['horizon::services'],
    }
}
