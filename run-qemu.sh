#!/bin/bash
if sudo echo "Starting ..."
then
qemu-system-x86_64 ~/qemu-ubuntu/ubuntu.img -m 2G -enable-kvm -net user,hostfwd=tcp::10022-:22 -net nic -nographic &
echo "qemu VM started. Waiting..."
sleep 5

echo "attempting to connect through SSH..."
# taken from http://unix.stackexchange.com/a/82602/120817
   n=0
   until [ $n -ge 15 ]
   do
      ssh basheersubei@localhost -p10022 && break
      n=$[$n+1]
      echo "Retrying SSH after 3 seconds..."
      sleep 3
   done
fi
