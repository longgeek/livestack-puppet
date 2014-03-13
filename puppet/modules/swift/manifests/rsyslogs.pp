class swift::rsyslogs {
    file { "/etc/rsyslog.d/swift-rsyslog.conf":
        source => 'puppet:///files/swift/rsyslog.d/swift-rsyslog.conf',
        notify => Service["rsyslog"],
    }

    service { "rsyslog":
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
