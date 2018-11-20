#!/bin/bash

# test bash script for wiping SD cards blank
#pre-req: must have sdtool in the same directory as this bash 
#         chmod u=wrx bash_sd.sh
umount /dev/mmcblk0* #unmount sd card 
sudo ./sdtool /dev/mmcblk0 unlock #unlock sd card using sdtool - command format: ./sdtool device( /dev/mmcblk0) command( unlock, status, lock, permlock, reset)
wipefs -a /dev/mmcblk0 #wipe all signiture off the sd card - Clear all partitions 

# create new partition, primary, 1 partition, first block 2048, last block 31116287, write
fdisk /dev/mmcblk0 << EOF 
n
p
1
2048
31116287
w
EOF

mkfs.vfat /dev/mmcblk0p1 # format the partition that was created.
sync 

