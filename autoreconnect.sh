#!/bin/sh                                                                                                                           


if [ "$#" = 2 ]


then
    while [ 1 ]
    do
        if [ "`nmcli con status | grep $1 2> /dev/null`" = "" ]
        then
            echo "Disconnected of $1 with $2 interface"
            nmcli dev wifi connect $1 iface $2 2> /dev/null > /dev/null
            if [ "$?" = 0 ]
            then
                echo "Connected to $1 with $2 interface"
            else
                echo "Fail connection to $1 with $2 interface"
            fi
        fi
        sleep 1
    done



else
    echo "usage: ./autoreconnect <SSID> <iface>"



fi
