#!/bin/bash

if [ "`id -u`" -eq 0 ]; then
    export OS_TENANT_NAME=admin
    export OS_USERNAME=admin
    export OS_PASSWORD=password
    export OS_AUTH_URL=http://localhost:5000/v2.0/
    export OS_REGION_NAME=RegionOne
    export SERVICE_TOKEN=ADMIN
    export SERVICE_ENDPOINT=http://localhost:35357/v2.0/
fi
