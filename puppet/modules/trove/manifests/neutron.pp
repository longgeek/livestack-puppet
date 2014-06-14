class trove::neutron {
    file { '/etc/trove/modifi-neutron-id.sh':
        source => 'puppet:///files/trove/etc/modifi-neutron-id.sh',
    }

    file { '/etc/trove/check-neutron-id.sh':
        source => 'puppet:///files/trove/etc/check-neutron-id.sh',
    }

    exec { 'get neutron net id':
        command => 'bash /etc/trove/modifi-neutron-id.sh',
        path    => $command_path,
        require => File['/etc/trove/modifi-neutron-id.sh', '/etc/trove/check-neutron-id.sh'],
        unless  => 'bash /etc/trove/check-neutron-id.sh',
    }
}
