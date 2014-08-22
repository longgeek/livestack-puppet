class swift::rsyslogs {
    file { '/etc/rsyslog.d/swift-rsyslog.conf':
        source => 'puppet:///files/swift/rsyslog.d/swift-rsyslog.conf',
        notify => Service['rsyslog'],
    }

    file { '/var/log/swift/swift.log':
        ensure  => file,
        owner   => 'syslog',
        group   => adm,
        mode    => 640,
        require => File['/etc/rsyslog.d/swift-rsyslog.conf'],
        notify  => [ Service['rsyslog'], Class['swift::services']],
    }

    file { '/var/log/swift/proxy.log':
        ensure  => file,
        owner   => syslog,
        group   => adm,
        mode    => 640,
        require => File['/var/log/swift/swift.log'],
        notify  => [ Service['rsyslog'], Class['swift::services']],
    }

    file { '/var/log/swift/account.log':
        ensure  => file,
        owner   => syslog,
        group   => adm,
        mode    => 640,
        require => File['/var/log/swift/proxy.log'],
        notify  => [ Service['rsyslog'], Class['swift::services']],
    }

    file { '/var/log/swift/object.log':
        ensure  => file,
        owner   => syslog,
        group   => adm,
        mode    => 640,
        require => File['/var/log/swift/account.log'],
        notify  => [ Service['rsyslog'], Class['swift::services']],
    }

    file { '/var/log/swift/container.log':
        ensure  => file,
        owner   => syslog,
        group   => adm,
        mode    => 640,
        require => File['/var/log/swift/object.log'],
        notify  => [ Service['rsyslog'], Class['swift::services']],
    }

    service { 'rsyslog':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
    }
}
