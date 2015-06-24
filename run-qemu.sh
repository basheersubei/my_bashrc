#!/bin/bash
# taken from http://unix.stackexchange.com/a/82602/120817
   n=0
   until [ $n -ge 15 ]
   do
      ssh basheersubei@localhost -p10022 && break
      n=$[$n+1]
      sleep 3
   done
