# 自定义SSH默认断开时间

SSH 默认的断开时间只有几分钟，往往造成不便，本文将介绍修改 SSH 配置或参数以保持其处于长期在线状态。这里分为两类：**长效设置**和**单次有效**。其中长效设置分两种思路：**服务器主动保持连接**和**客户端主动保持连接**。

## 长效设置
### 方案一：服务器主动保持连接

编辑 `/etc/ssh/sshd_config` ，添加如下两句：

```bash
# 服务器向客户端发送空数据包的时间间隔，单位：秒
ClientAliveInterval 120
# 服务器向客户端发送空数据包的最大次数，120秒/次 * 720次 = 24小时
ClientAliveCountMax 720
```

然后重启 `sshd` 服务即可生效：

```bash
systemctl restart sshd
```

或

```bash
service sshd restart
```

这样设置即可使 SSH 的自动断开间隔调整为24小时左右。

### 方案二：客户端主动保持连接

编辑 `/etc/ssh/ssh_config` ，添加如下两句：

```bash
# 客户端向服务器发送空数据包的时间间隔，单位：秒
ServerAliveInterval 120
# 客户端向服务器发送空数据包的最大次数，120秒/次 * 720次 = 24小时
ServerAliveCountMax 720
```

注意，这里是 ***Server**AliveInterval* 和 ***Server**AliveCountMax*

## 单次有效
### 方案三：带参连接

使用 SSH 命令时，可以增加 *ServerAliveInterval* 参数设置心跳时间，比如设置每隔120秒发送一次心跳包：

```bash
ssh -o ServerAliveInterval=60 root@xx.xx.xx.xx
```

有效期：本次登录期间。
