class swift::configs {
    file { "/etc/swift/swift.conf":
        source => 'puppet:///files/swift/etc/swift.conf',
        notify => Class["swift::services"],
    }

    file { "/etc/swift/proxy-server.conf":
        source => 'puppet:///files/swift/etc/proxy-server.conf',
        notify => Class["swift::services"],
    }

    file { "/etc/swift/account-server.conf":
        source => 'puppet:///files/swift/etc/account-server.conf',
        notify => Class["swift::services"],
    }
    
    file { "/etc/swift/container-server.conf":
        source => 'puppet:///files/swift/etc/container-server.conf',
        notify => Class["swift::services"],
    }
 
    file { "/etc/swift/object-server.conf":
        source => 'puppet:///files/swift/etc/object-server.conf',
        notify => Class["swift::services"],
    }
}
