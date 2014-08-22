class cinder::volumes {
    exec { 'create volumes backing file':
        command => 'dd if=/dev/zero of=/etc/puppet/files/cinder/volumes/livestack-volumes-backing-file bs=1 count=0 seek=50G',
        path    => $command_path,
        unless  => "[ -e /etc/puppet/files/cinder/volumes/livestack-volumes-backing-file ]",
    }

    exec { 'losetup loop7':
        command => 'losetup /dev/loop7 /etc/puppet/files/cinder/volumes/livestack-volumes-backing-file',
        path    => $command_path,
        unless  => 'losetup -a | grep livestack-volumes-backing-file',
        require => Exec['create volumes backing file'],
        notify  => [Exec['create livestack-volumes'], Class['cinder::services']],
    }

    exec { 'create livestack-volumes':
        command => 'parted /dev/loop7 -s mklabel msdos && \
                    parted /dev/loop7 -s mkpart primary 0 100% && \
                    parted /dev/loop7 toggle 1 lvm && \
                    pvcreate /dev/loop7 && \
                    vgcreate livestack-volumes /dev/loop7',
        path    => $command_path,
        unless  => 'vgs | grep livestack-volumes',
        require => Exec['losetup loop7'],
        notify  => Class['cinder::services'],
    }
}
