class swift::services {
    service { ["memcached", "swift-proxy-server", "swift-account-server", "swift-container-server", "swift-object-server"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
