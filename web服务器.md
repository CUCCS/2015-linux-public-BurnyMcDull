# 第五次实验报告

## WEB服务器

### 实验环境

* 服务器 ubuntu

* 客户端 windows10

* Nginx

* VeryNginx

* Wordpress

* Damn Vulnerable Web Application

### 实验要求

* [点击链接](http://sec.cuc.edu.cn/huangwei/course/LinuxSysAdmin/chap0x05.exp.md.html#/)

### 步骤
停止apache2的服务

安装 VeryNignx，根据官方文档进行配置，下载所需要的库(libpcre3-dev libssl-dev
build-essential)，利用python安装，在启动服务。

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/1.jpg)

### 尝试搜索了多种方法，没有将nginx和verynginx配置在一台虚拟机中，因此开启两台虚拟机进行实。

### 再次尝试，发现服务器中无法同时启用nginx以及verynginx 原因是端口占用，这是两个程序，会导致冲突，修改配置文件listen端口8080 ，同时配置成功。

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/4.jpg)

### 配置wordpress

[参考文档](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-on-ubuntu-16-04)

安装启动

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/2.jpg)

安装成功

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/3.jpg)

配置反向代理

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/5.jpg)

### 配置DVWA

sudo git clone [lhttps://github.com/ethicalhack3r/DVWA.git](https://github.com/ethicalhack3r/DVWA.git)

按照说明文档进行配置数据库

安装成功

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/7.jpg)

配置反向代理
![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/8.jpg)

在进行配置的时候出现了bug 导致渲染失败无法操作，后来进行分析是网络的问题，他的加载渲染之类的需要网络才能操作

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/9.jpg)

禁止ip访问 白名单
配置matcher response 以及fliter 然后通过自己设置参数实现禁止ip访问以及白名单

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/10.jpg)

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/11.jpg)

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/12.jpg)

在不升级Wordpress版本的情况下，通过定制VeryNginx的访问控制策略规则，热修复WordPress < 4.7.1 - Username Enumeration

漏洞是获取user信息，路径是/wp-json/wp/v2/users/
修复 同上host路劲进行设置，fliter设置进行访问

VeryNginx的Web管理页面仅允许白名单上的访客来源IP，其他来源的IP访问均向访客展示自定义的友好错误提示信息页面-3

whitelist 同前操作，修改matcher fliter，即可完成

通过定制VeryNginx的访问控制策略规则实现：

* 限制DVWA站点的单IP访问速率为每秒请求数 < 50

*限制Wordpress站点的单IP访问速率为每秒请求数 < 20

* 超过访问频率限制的请求直接返回自定义错误提示信息页面-4

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/13.jpg)

* 禁止curl访问

![image](https://github.com/BurnyMcDull/image/raw/master/图片信息/14.jpg)

