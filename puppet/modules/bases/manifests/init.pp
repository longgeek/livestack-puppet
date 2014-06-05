class bases {
    exec { "sh check-kvm":
        command => "echo 'sh /etc/init.d/check-kvm; sleep 5; sh /etc/init.d/check-vnc' >> /etc/init.d/rc.local",
        path => $command_path,
        unless => "grep 'sh /etc/init.d/check-kvm' /etc/init.d/rc.local",
    }

    file { "/etc/init.d/check-vnc":
        source => 'puppet:///files/bases/check-vnc',
        mode => 755,
    }

    file { "/etc/init.d/check-kvm":
        source => 'puppet:///files/bases/check-kvm',
        mode => 755,
    }

    exec { "sh /etc/init.d/check-vnc":
        command => "bash /etc/init.d/check-vnc",
        path => $command_path,
        require => File["/etc/init.d/check-kvm"],
    }

    exec { "aufs openstack sources":
        command => "echo 'none /livestack/sources aufs udba=reval,dirs=/livestack/.sources-rw=rw:/livestack/.sources-ro=ro        0 0' >> /etc/fstab && mount -a",
        path => $command_path,
        unless => "grep livestack /etc/fstab",
    }

    exec { "aufs python2.7 sources":
        command => "echo 'none /usr/local/lib/python2.7/dist-packages     aufs udba=reval,dirs=/usr/local/lib/python2.7/.dist-packages-rw=rw:/usr/local/lib/python2.7/.dist-packages-ro=ro        0 0' >> /etc/fstab && mount -a",
        path => $command_path,
        unless => "grep python2.7 /etc/fstab",
    }
}
