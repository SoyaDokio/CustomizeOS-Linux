# bashrc

![prompt screenshoot](https://user-images.githubusercontent.com/16408325/83832375-1ca94680-a71c-11ea-9afe-cb336f005a5c.png)

自定义Bash Prompt时，作用域分为**仅当前用户**和**全部用户**

## 仅当前用户
编辑`~/.bashrc`，并在该行*# User specific aliases and functions*以下添加以下内容：
```bash
export PS1="[\[\e[32m\]\t \u@\H \W\[\e[m\]]\$ "
```
然后执行以下命令即可生效：
```bash
source ~/.bashrc
```

## 全部用户
编辑`/etc/bashrc`，注释掉默认设置并添加以下内容：
```bash
# [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \w]\\$ "
PS1="[\[\e[32m\]\t \u@\H \W\[\e[m\]]\$ "
```
然后执行以下命令即可生效：
```bash
source /etc/bashrc
```
