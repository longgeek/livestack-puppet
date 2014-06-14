class heat::upstart {
    file {
        '/etc/init/heat-api.conf':
            source => 'puppet:///files/heat/init/heat-api.conf';

        '/etc/init/heat-api-cfn.conf':
            source => 'puppet:///files/heat/init/heat-api-cfn.conf';

        '/etc/init/heat-api-cloudwatch.conf':
            source => 'puppet:///files/heat/init/heat-api-cloudwatch.conf';

        '/etc/init/heat-engine.conf':
            source => 'puppet:///files/heat/init/heat-engine.conf',
    }

    exec { 'update-rc.d heat':
        command => 'ln -s /lib/init/upstart-job /etc/init.d/heat-api; \
                    ln -s /lib/init/upstart-job /etc/init.d/heat-api-cfn; \
                    ln -s /lib/init/upstart-job /etc/init.d/heat-api-cloudwatch; \
                    ln -s /lib/init/upstart-job /etc/init.d/heat-engine; \
                    update-rc.d heat-api defaults 50; \
                    update-rc.d heat-api-cfn defaults 50; \
                    update-rc.d heat-api-cloudwatch defaults 50; \
                    update-rc.d heat-engine defaults 50',
        path    => $command_path,
        unless  => 'ls /etc/init.d/heat-engine',
    }
}
