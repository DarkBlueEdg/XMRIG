#!/bin/bash

N0n=$(cat /sys/devices/system/node/node0/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
N0f=$(cat /sys/devices/system/node/node0/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
N0u=$(($N0n - $N0f))

N1c='/sys/devices/system/node/node1/hugepages/hugepages-1048576kB/'

if [ -d "$N1c" ]; then
 N1n=$(cat /sys/devices/system/node/node1/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
 N1f=$(cat /sys/devices/system/node/node1/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
 N1u=$(($N1n - $N1f))
elif [ ! -d "$N1c" ]; then
 N1n="N/A"
 N1f="N/A"
 N1u="N/A"
fi

N2c='/sys/devices/system/node/node2/hugepages/hugepages-1048576kB/'

if [ -d "$N2c" ]; then
 N2n=$(cat /sys/devices/system/node/node2/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
 N2f=$(cat /sys/devices/system/node/node2/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
 N2u=$(($N2n - $N2f))
elif [ ! -d "$N2c" ]; then
 N2n="N/A"
 N2f="N/A"
 N2u="N/A"
fi

N3c='/sys/devices/system/node/node3/hugepages/hugepages-1048576kB/'

if [ -d "$N3c" ]; then
 N3n=$(cat /sys/devices/system/node/node3/hugepages/hugepages-1048576kB/nr_hugepages 2>/dev/null)
 N3f=$(cat /sys/devices/system/node/node3/hugepages/hugepages-1048576kB/free_hugepages 2>/dev/null)
 N3u=$(($N3n - $N3f))
elif [ ! -d "$N3c" ]; then
 N3n="N/A"
 N3f="N/A"
 N3u="N/A"
fi

echo "|===============================================================|"
echo "| NUMA Node Number |nr_hugepages| free_hugepages| used hugepages| "
echo "|------------------|------------|---------------|---------------|"
echo "|        0         |	$N0n	|	$N0f	|	$N0u	|"
echo "|        1         |	$N1n	|	$N1f	|	$N1u	|"
echo "|        2         |	$N2n	|	$N2f	|	$N2u	|"
echo "|        3         |	$N3n	|	$N3f	|	$N3u	|"
echo "|===============================================================|"
