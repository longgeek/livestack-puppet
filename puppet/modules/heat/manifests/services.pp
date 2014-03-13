class heat::services {
    service { ["heat-api", "heat-api-cfn", "heat-api-cloudwatch", "heat-engine"]:
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }
}
