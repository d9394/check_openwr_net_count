#!/bin/sh
#aa=$(cat /proc/net/dev | grep "eth0.6" | awk '{print "4G used total: send: "$10/1024/1024/1" Mb,("$11" packets);","receive: "$2/1024/1024" Mb,("$3" packets)"}')
aa=$(cat /proc/net/dev | grep "eth0.6" | awk '{print $10","$11","$2","$3}')
if [ -f /tmp/4G_used.log ]; then
  b1=$(cat /tmp/4G_used.log | cut -d , -f 1)
  b2=$(cat /tmp/4G_used.log | cut -d , -f 2)
  b3=$(cat /tmp/4G_used.log | cut -d , -f 3)
  b4=$(cat /tmp/4G_used.log | cut -d , -f 4)
else
  b1=0
  b2=0
  b3=0
  b4=0
  echo $aa > /tmp/4G_used.log
fi
c1=$(echo $aa | cut -d , -f 1)
c2=$(echo $aa | cut -d , -f 2)
c3=$(echo $aa | cut -d , -f 3)
c4=$(echo $aa | cut -d , -f 4)
d1=$(($c1-$b1))
d2=$(($c2-$b2))
d3=$(($c3-$b3))
d4=$(($c4-$b4))
e1=$(echo $d1 | awk '{print $0/1024/1024/1}')
e3=$(echo $d3 | awk '{print $0/1024/1024}')

ff="4G used total: \n\t send: "$e1" Mb,("$d2" packets); \n\t receive: "$e3" Mb,("$d4" packets)"

(echo "From:<who@hellocq.net>";
echo "TO:who@163.com";
echo "Subject: xxxx_4G_traffic_count";
echo -e $ff
) | ssmtp -v who@163.com,who2@263.com

