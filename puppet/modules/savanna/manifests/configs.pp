class savanna::configs {
    file { "/etc/savanna/savanna.conf":
        source => 'puppet:///files/savanna/etc/savanna.conf',
        notify => Class["savanna::services"],
    }
}
