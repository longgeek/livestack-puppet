class horizon::configs {
    file { "$source_dir/horizon":
        ensure  => directory,
        recurse => true,
        owner   => www-data,
        group   => www-data,
    }

    file { "$source_dir/horizon/.blackhole":
        ensure  => directory,
        require => File["$source_dir/horizon"],
    }

    file { "$source_dir/horizon/openstack_dashboard/settings.py":
        source  => 'puppet:///files/horizon/etc/settings.py',
        owner   => 'www-data',
        group   => 'www-data',
        require => File["$source_dir/horizon/.blackhole"],
        notify  => Class['horizon::services'],
    }

    file { "$source_dir/horizon/openstack_dashboard/local/local_settings.py":
        source  => 'puppet:///files/horizon/etc/local_settings.py',
        owner   => 'www-data',
        group   => 'www-data',
        require => File["$source_dir/horizon/openstack_dashboard/settings.py"],
        notify  => Class['horizon::services'],
    }

    file { '/etc/apache2/envvars':
        source  => 'puppet:///files/horizon/etc/envvars',
        require => File["$source_dir/horizon/openstack_dashboard/local/local_settings.py"],
        notify  => Class['horizon::services'],
    }

    file { '/etc/apache2/sites-available/horizon.conf':
        content => template('horizon.conf.erb'),
        require => File['/etc/apache2/envvars'],
        notify  => Class['horizon::services'],
    }

    file { '/etc/apache2/sites-enabled/horizon.conf':
        ensure  => link,
        target  => '/etc/apache2/sites-available/horizon.conf',
        require => File['/etc/apache2/sites-available/horizon.conf'],
        notify  => Class['horizon::services'],
    }
}
