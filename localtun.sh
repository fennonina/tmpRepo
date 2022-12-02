#!/bin/bash

while getopts s:p:t: flag
do
        case "${flag}" in
                s) subdom=${OPTARG};;
                p) port=${OPTARG};;
                t) type=${OPTARG};;
        esac
done

export RNDM=-$RANDOM
export SUFFIX=-$type
export LTURL=$subdom$RNDM$SUFFIX

sudo npm install -g localtunnel &>/dev/null & 
sleep 14
sudo lt -s $LTURL -p $port &>/dev/null &
sleep 7
echo -------------------------------
echo your address:
echo
echo http://$LTURL.loca.lt
echo
echo listening port : $port
echo -------------------------------
