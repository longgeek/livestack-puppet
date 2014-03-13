class bases {
    file { "/etc/rc.local":
        source => 'puppet:///files/bases/rc.local',
        mode => 755,
    }

    file { "/etc/init.d/networking":
        source => 'puppet:///files/bases/networking',
        mode => 755,
    }

    exec { "aufs openstack sources":
        command => "echo 'none /livestack aufs udba=reval,dirs=/.livestack-rw=rw:/.livestack-ro=ro        0 0' >> /etc/fstab && mount -a",
        path => $command_path,
        unless => "grep livestack /etc/fstab",
    }

    exec { "aufs python2.7 sources":
        command => "echo 'none /usr/local/lib/python2.7/dist-packages     aufs udba=reval,dirs=/usr/local/lib/python2.7/.dist-packages-rw=rw:/usr/local/lib/python2.7/.dist-packages-ro=ro        0 0' >> /etc/fstab && mount -a",
        path => $command_path,
        unless => "grep python2.7 /etc/fstab",
    }
}
