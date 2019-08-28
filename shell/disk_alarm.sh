#!/bin/bash


percent=`/bin/df -h | grep '/home' | awk -F" " '{print $5}'| cut -d"%" -f1`
if [ $percent -gt 90 ];then
    // do nothing
fi
