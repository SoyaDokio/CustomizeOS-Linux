# 自定义命令ll时间标签

修改 CentOS 中 `ls -l` 命令显示时间格式为*yyyy-MM-dd HH:mm:ss*

![默认时间格式](https://user-images.githubusercontent.com/16408325/84004829-c5ff6f00-a99e-11ea-9cc3-0d98776c71d4.png)
默认时间格式↑

![改后时间格式](https://user-images.githubusercontent.com/16408325/84004834-c7309c00-a99e-11ea-8cb9-48fdce83c902.png)
改后时间格式↑

## 操作指南
### 临时更改

临时更改显示样式，当前会话有效，会话结束后恢复原来的样式。

直接执行以下命令：
```bash
export TIME_STYLE='+%Y-%m-%d %H:%M:%S'
```

然后执行以下命令即可生效：
```bash
source /etc/profile
```

### 永久更改

永久改变显示样式，当前会话结束、系统重启等操作之后，更改后的效果不受影响

编辑`/etc/profile`，在文件末尾添加内容：
```bash
export TIME_STYLE='+%Y-%m-%d %H:%M:%S'
```

然后执行以下命令即可生效：
```bash
source /etc/profile
```
