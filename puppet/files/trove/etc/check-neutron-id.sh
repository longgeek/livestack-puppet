#!/bin/bash

network=$(neutron net-list | awk -F ' |' '{print $2}' | grep -Ev "(id|^$)")
echo $network

for i in $network
do
    neutron net-show $i | grep 'router:external           | True'
    if [ "$?" -ne "0" ]; then
        neutron net-show $i | grep 'shared                    | True'
        if [ "$?" -eq "0" ]; then
            neutron net-show $i | grep 'subnets                   |               ' 
            if [ "$?" -ne "0" ]; then
                echo 'asdfasaaaaaaaaaaaaaaaaaaaaaaaa', $i
                if [ $(grep ^default_neutron_networks /etc/puppet/files/trove/etc/trove.conf | awk '{print $3}') = $i ]; then
                   exit 0
                fi
            fi
        fi
    fi
done

exit 1
