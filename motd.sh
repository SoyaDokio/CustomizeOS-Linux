#!/bin/bash
b=`tput bold`
n=`tput sgr0`
c=`tput setaf 2`
c2=`tput setaf 4`
ip=`last | awk 'NR==1{print}' | sed "s/.*\s\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\)\s.*/\1/g"`
json=`curl -s http://ip-api.com/json/${ip}`
status=`echo ${json} | jq ".status"`
if [ $status == "\"success\"" ]; then
    city=`echo ${json} | jq ".city"`
    regionName=`echo ${json} | jq ".regionName"`
    country=`echo ${json} | jq ".country"`
    geolocation=`echo ${city}${regionName}${country} | sed 's/\"\"/, /g' | sed 's/\"//g'`
    if [ $country == "\"China\"" ]; then
        echo -e "${ip} -> ${geolocation}"
    else
        echo -e "${ip} -> ${c2}${geolocation}${n}"
    fi
fi
echo -e "${b}${c}Hostname${n}:   `hostname` \t\t ${b}${c}IP address${n}: `ifconfig ens3 | grep "inet " | awk '{print $2}'`"
echo -e "${b}${c}Processes${n}:  `cat /proc/loadavg | cut -d"/" -f2| cut -d" " -f1` \t\t\t\t ${b}${c}Uptime${n}:     `uptime | sed "s/.*up\s\{1,2\}\([1-5]\?[0-9]\smins\?\|\([0-9]\{1,3\}\sdays\?,\s\)\?[0-9]\?[0-9]:[0-9]\{2\}\),\s[1-9 ][0-9]\suser.*/\1/g"`"
mf=`cat /proc/meminfo | grep MemFree | awk {'print int($2)'}` # memory free
mt=`cat /proc/meminfo | grep MemTotal | awk {'print int($2)'}` # memory total
mu=$[mt-mf] # memory used
musage=`awk 'BEGIN{printf "%.2f\n",('$mu'/'$mt'*100)}'` # memory usage
echo -e "${b}${c}CPU load${n}:   `cat /proc/loadavg | cut -d" " -f1-3` \t\t ${b}${c}Memo usage${n}: ${musage}% of `awk 'BEGIN{printf "%.2f\n",('$mt'/1024)}'`MB"
echo -e "${b}${c}Users logged in${n}: `w | tail -n +3 | wc -l`"
