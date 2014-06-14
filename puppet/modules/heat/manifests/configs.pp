class heat::configs {
    file {
        '/etc/logrotate.d/heat':
            source => 'puppet:///files/heat/logrotate.d/heat';

        '/etc/heat/policy.json':
            source => 'puppet:///files/heat/etc/policy.json';

        '/etc/heat/environment.d/default.yaml':
            source => 'puppet:///files/heat/etc/environment.d/default.yaml';

        '/etc/heat/templates/AWS_CloudWatch_Alarm.yaml':
            source => 'puppet:///files/heat/etc/templates/AWS_CloudWatch_Alarm.yaml';

        '/etc/heat/templates/AWS_RDS_DBInstance.yaml':
            source => 'puppet:///files/heat/etc/templates/AWS_RDS_DBInstance.yaml';

        '/etc/heat/api-paste.ini':
            source => 'puppet:///files/heat/etc/api-paste.ini',
    }

    file { '/etc/heat/heat.conf':
        source => 'puppet:///files/heat/etc/heat.conf',
        notify => Class['heat::services', 'heat::tables'],
    }
}
