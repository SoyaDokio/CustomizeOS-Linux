# MOTD4CentOS

CentOS 平台上有个简单的小功能：MOTD（Message of the day），可时用户登录 SSH 时原样输出用户指定内容。
例如修改 `/etc/motd` 为：
```
欢迎回来~
```

则下次登录成功后会打印：
```
root@11.22.33.44's password:
Last login: Fri Jul 13 05:29:14 2018 from 111.175.59.239
欢迎回来~
[17:47:46 root@soyadokio ~]# 
```

说明：上面是原样输出，可如果需要动态内容，就需要用到自启动命令打印内容来模拟MOTD的效果。

操作：新建`/etc/profile.d/motd.sh`，内容为本项目下`motd.sh`的内容，则可达成如下效果：
```
root@11.22.33.44's password:
Last login: Fri Jul 13 05:29:14 2018 from 111.175.59.239
111.175.59.239 -> Wuhan, Hubei, China
Hostname:   soyadokio.com (11.22.33.44)
Processes:  43
Uptime:     1 days, 16 hours, 59 minutes
CPU load:   0.05 0.02 0.00
Memo usage: 14.72% of 512.00MB
Users logged in: 1
[17:47:46 root@soyadokio ~]# 
```

注意：本脚本需 `jq` 支持，安装可执行以下命令：
```bash
yum install -y jq
```
