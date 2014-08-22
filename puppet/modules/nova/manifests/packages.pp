class nova::packages {
    package { ['libvirt-bin', 'python-libvirt', 'qemu-kvm', 'qemu-utils', 'dnsmasq-utils', 'python-m2crypto', 'spice-client', 'spice-html5', 'spice-vdagent']:
        ensure => installed,
    }

    service { 'libvirt-bin':
        ensure     => running,
        enable     => true,
        hasstatus  => true,
        hasrestart => true,
        require    => Package['libvirt-bin'],
    }
}
