#!/bin/bash


# https://opensourceforu.com/2015/07/shell-scripts-you-will-love-to-use/
# https://community.spiceworks.com/scripts/show/2127-quick-system-information-on-a-linux-host


hwbits=`uname -m`
hwkname=`uname -s`
hwfqn=`hostname -f`

echo "Hostname :" `hostname -f`
echo "Sistema Operacional :" `uname -s` 
echo "Arch :" `uname -m`
echo "OS Version:" `uname -m`
free -mt |awk '/Mem/{print "  Memory:\tTotal: " $2 "Mb\tUsed: " $3 "Mb\tFree: " $4 "Mb"} 
/Swap/{print "  Swap:\t\tTotal: " $2 "Mb\tUsed: " $3 "Mb\tFree: " $4 "Mb"}'

 ip -o addr | awk '/inet /{print "  IP (" $2 "):\t" $4}'

cat /proc/cpuinfo | grep "model name\|processor" | awk '
/processor/{printf "  Processor:\t" $3 " : " }
/model\ name/{
i=4
while(i<=NF){
	printf $i
	if(i<NF){
		printf " "
	}
	i++
}
printf "\n"
}' 


/sbin/route -n | awk '/^0.0.0.0/{ printf "  Gateway:\t"$2"\n" }'

