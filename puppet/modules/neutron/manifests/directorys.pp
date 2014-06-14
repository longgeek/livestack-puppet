class neutron::directorys {
    file { ['/etc/neutron', '/var/log/neutron', '/etc/neutron/plugins', '/etc/neutron/plugins/ml2', '/etc/neutron/rootwrap.d', '/etc/neutron/services', '/etc/neutron/services/loadbalancer', '/etc/neutron/services/loadbalancer/haproxy']:
        ensure => directory,
    }
}
