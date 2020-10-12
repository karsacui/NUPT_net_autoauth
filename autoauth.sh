#!/bin/bash

# Copyright (c) 2020 崔

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#获取IP地址
IP=`curl -s http://10.10.244.11 | grep v46ip | sed -n "s/.*v46ip='\(.*\)'.*/\1/p"`
#随机生成的sessid
PHPSESSID=`date |md5sum |head -c26`
#上网账号
USER="$1"
#上网密码
PASS="$2"
#上网运营商，电信njxy，移动cmcc，校园网留空
ISP="$3"
#判断运营商以对下列三个字符串进行相应变化
if [ "$ISP" = "njxy" ] || [ "$ISP" = "cmcc" ]; then
ISP1="@$ISP"
ISP2="@$ISP"
ISP3="%40$ISP"
fi
#直接传POST登录
curl -s 'http://10.10.244.11:801/eportal/?c=ACSetting&a=Login&protocol=http:&hostname=10.10.244.11&iTermType=1&wlanuserip='$IP'&wlanacip=10.255.252.150&wlanacname=XL-BRAS-SR8806-X&mac=00-00-00-00-00-00&ip='$IP'&enAdvert=0&queryACIP=0&loginMethod=1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Referer: http://10.10.244.11/a70.htm?wlanuserip='$IP'&wlanacip=10.255.252.150&wlanacname=XL-BRAS-SR8806-X&vlanid=0&ip='$IP'&ssid=null&areaID=null&mac=00-00-00-00-00-00' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Cookie: program=2; vlan=0; ip='$IP'; ssid=null; areaID=null; PHPSESSID='$PHPSESSID'; ISP_select='$ISP1'; md5_login2=%2C0%2C'$USER''$ISP2'%7C'$PASS'' -H 'Upgrade-Insecure-Requests: 1' --data 'DDDDD=%2C0%2C'$USER''$ISP3'&upass='$PASS'&R1=0&R2=0&R3=0&R6=0&para=00&0MKKey=123456&buttonClicked=&redirect_url=&err_flag=&username=&password=&user=&cmd=&Login=&v6ip='
