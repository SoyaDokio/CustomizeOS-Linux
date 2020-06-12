# 自定义SSH登录前提示信息

![SSH登录前提示信息](https://user-images.githubusercontent.com/16408325/84456961-fe02fc80-ac93-11ea-93b6-e72695c1f6ba.png)

修改 `/etc/ssh/sshd_config` ，找到 `# Banner` ，新增一行或解开注释，内容为：

```
Banner /etc/ssh/banner
```

随后创建文件 `/etc/ssh/banner` ，自定义所需内容即可，也可参考当前目录下 `banner` 。

最后执行以下命令即可生效：

```bash
service sshd restart
```

或

```bash
systemctl restart sshd
```
