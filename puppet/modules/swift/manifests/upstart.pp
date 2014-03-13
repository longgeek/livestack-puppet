class swift::upstart {
    file {
        "/etc/init/swift-proxy-server.conf":
            source => 'puppet:///files/swift/init/swift-proxy-server.conf';

        "/etc/init/swift-account-server.conf":
            source => 'puppet:///files/swift/init/swift-account-server.conf';

        "/etc/init/swift-container-server.conf":
            source => 'puppet:///files/swift/init/swift-container-server.conf';

        "/etc/init/swift-object-server.conf":
            source => 'puppet:///files/swift/init/swift-object-server.conf',
            notify => Exec["update-rc.d swift"],
    }

    exec { "update-rc.d swift":
        command => 'ln -s /lib/init/upstart-job /etc/init.d/swift-proxy-server && \
                    ln -s /lib/init/upstart-job /etc/init.d/swift-account-server && \
                    ln -s /lib/init/upstart-job /etc/init.d/swift-container-server && \
                    ln -s /lib/init/upstart-job /etc/init.d/swift-object-server && \
                    update-rc.d swift-proxy-server defaults 75; \
                    update-rc.d swift-account-server defaults 76; \
                    update-rc.d swift-container-server defaults 77; \
                    update-rc.d swift-object-server defaults 78',
        path => $command_path,
        unless => 'ls /etc/init.d/swift-object-server',
    }
}
