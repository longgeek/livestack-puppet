#!/bin/sh
#
# Keystone Datas
#
# Description: Fill Keystone with datas.
#
# Mail:    longgeek@gmail.com
# Blog:    http://www.longgeek.com
# Weibo:   http://weibo.com/longgeek
# Twitter: @Longgeek
#

# Please set 13, 30 lines of variables
export OS_TENANT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=password
export OS_AUTH_URL=http://localhost:5000/v2.0/
export OS_REGION_NAME=RegionOne
export SERVICE_TOKEN=ADMIN
export SERVICE_ENDPOINT=http://localhost:35357/v2.0/
ADMIN_PASSWORD=${ADMIN_PASSWORD:-password}
SERVICE_PASSWORD=${SERVICE_PASSWORD:-password}
export SERVICE_TOKEN="ADMIN"
export SERVICE_ENDPOINT="http://localhost:35357/v2.0"
SERVICE_TENANT_NAME=${SERVICE_TENANT_NAME:-service}
KEYSTONE_REGION=RegionOne
# If you need to provide the service, please to open keystone_wlan_ip and swift_wlan_ip
# of course you are a multi-node architecture, and swift service
# corresponding ip address set the following variables
KEYSTONE_IP="0.0.0.0"
SWIFT_IP="0.0.0.0"
COMPUTE_IP="0.0.0.0"
EC2_IP="0.0.0.0"
GLANCE_IP="0.0.0.0"
VOLUME_IP="0.0.0.0"
CEILOMETER_IP="0.0.0.0"
HEAT_IP="0.0.0.0"
TROVE_IP="0.0.0.0"

get_id () {
    echo `$@ | awk '/ id / { print $4 }'`
}

# Create Tenants
ADMIN_TENANT=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT tenant-create --name=admin)
SERVICE_TENANT=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT tenant-create --name=$SERVICE_TENANT_NAME)
DEMO_TENANT=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT tenant-create --name=demo)
#TROVE_TENANT=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT tenant-create --name=trove)
#INVIS_TENANT=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT tenant-create --name=invisible_to_admin)

# Create Users
ADMIN_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=admin --pass="$ADMIN_PASSWORD" --email=admin@livestack.org)
DEMO_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=demo --pass="$ADMIN_PASSWORD" --email=demo@livestack.org)

# Create Roles
ADMIN_ROLE=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT role-create --name=admin)
RESELLER_ROLE=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT role-create --name=ResellerAdmin)
HEAT_ROLE=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT role-create --name=heat_stack_user)

# Add Roles to Users in Tenants
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --user-id $ADMIN_USER --role-id $ADMIN_ROLE --tenant-id $ADMIN_TENANT

# The Member role is used by Horizon and Swift
MEMBER_ROLE=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT role-create --name=Member)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --user-id $DEMO_USER --role-id $MEMBER_ROLE --tenant-id $DEMO_TENANT

# Configure service users/roles
NOVA_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=nova --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=nova@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $NOVA_USER --role-id $ADMIN_ROLE

GLANCE_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=glance --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=glance@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $GLANCE_USER --role-id $ADMIN_ROLE

SWIFT_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=swift --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=swift@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $SWIFT_USER --role-id $ADMIN_ROLE

NEUTRON_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=neutron --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=neutron@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $NEUTRON_USER --role-id $ADMIN_ROLE
CINDER_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=cinder --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=cinder@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $CINDER_USER --role-id $ADMIN_ROLE

CEILOMETER_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=ceilometer --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=ceilometer@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $CEILOMETER_USER --role-id $RESELLER_ROLE
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $CEILOMETER_USER --role-id $ADMIN_ROLE

HEAT_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=heat --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=heat@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $HEAT_USER --role-id $ADMIN_ROLE

TROVE_USER=$(get_id keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-create --name=trove --pass="$SERVICE_PASSWORD" --tenant-id $SERVICE_TENANT --email=trove@livestack.org)
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT user-role-add --tenant-id $SERVICE_TENANT --user-id $TROVE_USER --role-id $ADMIN_ROLE

## Create Service
KEYSTONE_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name keystone --type identity --description 'OpenStack Identity Service'| awk '/ id / { print $4 }' )
COMPUTE_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=nova --type=compute --description='OpenStack Compute Service'| awk '/ id / { print $4 }' )
CINDER_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=cinder --type=volume --description='OpenStack Volume Service'| awk '/ id / { print $4 }' )
GLANCE_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=glance --type=image --description='OpenStack Image Service'| awk '/ id / { print $4 }' )
SWIFT_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=swift --type=object-store --description='OpenStack Storage Service' | awk '/ id / { print $4 }'  )
EC2_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=ec2 --type=ec2 --description='OpenStack EC2 Service'| awk '/ id / { print $4 }' )
CEILOMETER_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=ceilometer --type=metering --description='OpenStack Ceilometer Service'| awk '/ id / { print $4 }' )
NEUTRON_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=neutron --type=network --description='OpenStack Networking Service'| awk '/ id / { print $4 }'  )
HEAT_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=heat --type=orchestration --description='Heat API'| awk '/ id / { print $4 }'  )
HEAT_CFN_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=heat-cfn --type=cloudformation --description='Heat CloudFormation API'| awk '/ id / { print $4 }'  )
TROVE_ID=$(keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT service-create --name=trove --type=database --description='OpenStack Trove Service'| awk '/ id / { print $4 }'  )

## Create Endpoint
#identity
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$KEYSTONE_ID --publicurl http://"$KEYSTONE_IP":5000/v2.0 --adminurl http://"$KEYSTONE_IP":35357/v2.0 --internalurl http://"$KEYSTONE_IP":5000/v2.0

#compute
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$COMPUTE_ID --publicurl http://"$COMPUTE_IP":8774/v2/\$\(tenant_id\)s --adminurl http://"$COMPUTE_IP":8774/v2/\$\(tenant_id\)s --internalurl http://"$COMPUTE_IP":8774/v2/\$\(tenant_id\)s

#volume
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$CINDER_ID --publicurl http://"$VOLUME_IP":8776/v1/\$\(tenant_id\)s --adminurl http://"$VOLUME_IP":8776/v1/\$\(tenant_id\)s --internalurl http://"$VOLUME_IP":8776/v1/\$\(tenant_id\)s

#image
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$GLANCE_ID --publicurl http://"$GLANCE_IP":9292/v2 --adminurl http://"$GLANCE_IP":9292/v2 --internalurl http://"$GLANCE_IP":9292/v2

#object-store
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$SWIFT_ID --publicurl http://"$SWIFT_IP":8080/v1/AUTH_\$\(tenant_id\)s --adminurl http://"$SWIFT_IP":8080/v1 --internalurl http://"$SWIFT_IP":8080/v1/AUTH_\$\(tenant_id\)s

#neutron
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$NEUTRON_ID --publicurl http://"$SWIFT_IP":9696 --adminurl http://"$SWIFT_IP":9696 --internalurl http://"$SWIFT_IP":9696

#ec2
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$EC2_ID --publicurl http://"$EC2_IP":8773/services/Cloud --adminurl http://"$EC2_IP":8773/services/Admin --internalurl http://"$EC2_IP":8773/services/Cloud

#ceilometer
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$CEILOMETER_ID --publicurl http://"$CEILOMETER_IP":8777 --adminurl http://"$CEILOMETER_IP":8777 --internalurl http://"$CEILOMETER_IP":8777

#heat
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$HEAT_ID --publicurl http://"$HEAT_IP":8004/v1/\$\(tenant_id\)s --adminurl http://"$HEAT_IP":8004/v1/\$\(tenant_id\)s --internalurl http://"$HEAT_IP":8004/v1/\$\(tenant_id\)s

#heat-cfn
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$HEAT_CFN_ID --publicurl http://"$HEAT_IP":8000/v1 --adminurl http://"$HEAT_IP":8000/v1 --internalurl http://"$HEAT_IP":8000/v1

#trove
keystone --os-token $SERVICE_TOKEN --os-endpoint $SERVICE_ENDPOINT endpoint-create --region $KEYSTONE_REGION --service-id=$TROVE_ID --publicurl http://"$TROVE_IP":8779/v1.0/\$\(tenant_id\)s --adminurl http://"$TROVE_IP":8779/v1.0/\$\(tenant_id\)s --internalurl http://"$TROVE_IP":8779/v1.0/\$\(tenant_id\)s
