class neutron {
    Class["neutron"] -> Class["neutron::packages"] -> Class["neutron::directorys"] -> Class["neutron::configs"] -> Class["neutron::upstart"] -> Class["neutron::services"]
    include neutron, neutron::packages, neutron::directorys, neutron::configs, neutron::upstart, neutron::services
}
