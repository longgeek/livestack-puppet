class swift::directorys {
    file { ['/etc/swift', '/var/log/swift', '/var/lib/swift', '/var/lib/swift/data']:
        ensure => 'directory',
    }
}
