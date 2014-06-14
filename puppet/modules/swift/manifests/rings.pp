class swift::rings {
    exec { 'create ring':
        command => 'swift-ring-builder account.builder create 18 1 1; \
                    swift-ring-builder container.builder create 18 1 1; \
                    swift-ring-builder object.builder create 18 1 1; \
                    swift-ring-builder account.builder add z1-127.0.0.1:5899/sdz1 100; \
                    swift-ring-builder container.builder add z1-127.0.0.1:5898/sdz1 100; \
                    swift-ring-builder object.builder add z1-127.0.0.1:5897/sdz1 100; \
                    swift-ring-builder account.builder rebalance; \
                    swift-ring-builder container.builder rebalance; \
                    swift-ring-builder object.builder rebalance',
        path    => $command_path,
        cwd     => '/etc/swift/',
        unless  => 'ls /etc/swift/object.ring.gz',
    }
}
