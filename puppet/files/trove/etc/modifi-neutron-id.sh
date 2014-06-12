#!/bin/bash

network=$(neutron net-list | awk -F ' |' '{print $2}' | grep -Ev "(id|^$)")

for i in $network
do
    neutron net-show $i | grep 'router:external           | True'
    if [ "$?" -ne "0" ]; then
        neutron net-show $i | grep 'shared                    | True'
        if [ "$?" -eq "0" ]; then
            neutron net-show $i | grep 'subnets                   |               '
            if [ "$?" -ne "0" ]; then
                sed -i "s/^default_neutron_networks.*$/default_neutron_networks = $i/g" /etc/puppet/files/trove/etc/trove.conf
            fi
        fi
    fi
done
