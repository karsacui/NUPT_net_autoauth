# NUPT_net_autoauth - 南邮校园网自动登录shell脚本

使用方法
-------
直接执行脚本，传三个参数：上网账号，上网密码，运营商(电信njxy，移动cmcc，校园网留空)

此脚本对NJUPT, NJUPT-CHINANET, NJUPT-CMCC, 有线网 通用

具体
-------
登录电信:  `sh autoauth.sh B19031234 123456 njxy`

登录移动:  `sh autoauth.sh B19031234 123456 cmcc`

登录校园网:  `sh autoauth.sh B19031234 123456`

其他操作
-------
判断网络连通后再执行(用ping)： `ping -c1 -w10 223.5.5.5 > /dev/null || sh autoauth.sh B19031234 123456`

判断网络连通后再执行(用http)： `curl --connect-timeout 10 http://www.baidu.com/ > /dev/null || sh autoauth.sh B19031234 123456`

## Stargazers

[![Stargazers over time](https://starchart.cc/karsacui/NUPT_net_autoauth.svg)](https://starchart.cc/karsacui/NUPT_net_autoauth)

