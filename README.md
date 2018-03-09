打造 Vagrant Ruby On Rails 开发环境
================

## 包括以下环境和软件：

- Ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-linux]
- Mysql 5.5.59（mysql -V）
- Rails 5.1.5
- git 1.9.1
- [autojump](https://github.com/joelthelion/autojump)
- vim 7.4.52
- nodejs v0.10.25

## Box地址

链接: http://pan.baidu.com/s/1nt1hDMD 密码: ckg4


## 如何搭建

先安装好 VirtualBox 和 vagrant 软件，推荐使用版本（上面的百度盘链接里面有提供以下 Windows7 版本）：

 - VirtualBox-4.3.10-93012-Win
 - vagrant_1.7.4
 
下载 ubuntu_trusty_64.box, 执行以下命令添加刚才下载好的 box 到 Box list：

```sh
// cd 下载 box 目录
// vagrant box add 名称 路径
vagrant box add trusty64 ubuntu_trusty_64.box

vagrant box list // 查看
mkdir ubuntu // 创建文件夹
git clone https://github.com/forecho/vagrant-ubuntu-rails.git rails
cd rails
```
然后启动 vagrant

```
vagrant up
```

最后你可以愉快的时候 Xshell 工具 SSH 连接了。

```
IP：192.168.33.20
端口：22
用户名：vagrant
密码：vagrant
```

连接之后切换 root 用户：

```
sudo su // 不需要输入密码
```

## 关于MySQL

默认用户名：root

默认密码：root


## 关于一些常用的命令

**MySQL**

- 重启
```sh
sudo service mysql restart
```

## 常见问题


## 参考文档

- [路径（七）：用 Vagrant 管理虚拟机](http://ninghao.net/blog/2077)
- [1.2 Vagrant安装配置](https://github.com/astaxie/Go-in-Action/blob/master/ebook/zh/01.2.md)