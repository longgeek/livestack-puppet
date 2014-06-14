class bases {
    exec { 'sh check-kvm':
        command => "echo 'sh /etc/init.d/check-kvm; sleep 5; sh /etc/init.d/check-vnc' >> /etc/init.d/rc.local",
        path    => $command_path,
        unless  => "grep 'sh /etc/init.d/check-kvm' /etc/init.d/rc.local",
    }

    file { '/etc/init.d/check-vnc':
        source => 'puppet:///files/bases/check-vnc',
        mode   => 755,
    }

    file { '/etc/init.d/check-kvm':
        source => 'puppet:///files/bases/check-kvm',
        mode   => 755,
    }

    exec { 'sh /etc/init.d/check-vnc':
        command => 'sh /etc/init.d/check-vnc',
        path    => $command_path,
        require => File["/etc/init.d/check-vnc"],
        unless  => "facter | grep -v 127.0.0.1 | grep $(grep ^novncproxy_base_url /etc/puppet/files/nova/etc/nova.conf | awk -F: '{print $2}' | awk -F '//' '{print $2}') && [ $(facter fqdn) = $(grep ^server /etc/puppet/puppet.conf | awk -F= '{print $2}') ]",
    }

    file { '/etc/update-motd.d/00-header':
        source => 'puppet:///files/bases/00-header',
        mode   => 755,
    }

    file { '/etc/update-motd.d/10-help-text':
        source => 'puppet:///files/bases/10-help-text',
        mode   => 755,
    }

    file { '/usr/bin/livestack-status':
        source => 'puppet:///files/bases/livestack-status',
        mode   => 755,
    }
}
