# check_openwr_net_count
a shell script tools to check 4G netcard useage and send a email report

before use, need install ssmtp on openwrt

edit /etc/ssmtp/ssmtp.conf add some lines at the end of file:

root=aaaa@hellocq.net       #替换成自己的邮箱帐户
mailhub=smtp.ym.163.com     #邮箱的smtp服务器
rewriteDomain=hellocq.net
hostname=hellocq.net
FromLineOverride=YES
#UseTLS=YES
AuthUser=aaaa@hellocq.net    #替换为自己的邮箱帐户
AuthPass=bbbbbbbbbbbbbbb    #邮箱密码或者邮箱客户端授权码
