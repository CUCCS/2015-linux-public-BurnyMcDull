# 第一次实验报告

## 无人值守Linux安装镜像制作

### 准备工作以及说明
下载镜像，ssh的连接截图为方便下次配置时使用，截图为阿里云服务器的连接，由阿里云生成公私钥通过putty进行连接并且截图展示。

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/1.png)

通过配置安全组允许ssh等进行访问（为了方便暂时如此使用 只会会进行修改）

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/3.png)

其次通过阿里云自带的生成一对密钥对 但是格式是pem格式，因此需要转换成putty可以识别的格式，通过puttygen工具将其转换成ppk文件

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/2.png)

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/4.png)

再进行连接 连接成功

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/5.png)

本次实验使用两种方式进行修改，一种是按照老师发布的实验文档进行操作还有一种是利用windows系统进行操作，先展示windows系统的操作

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/7.png)

利用UltraISO对镜像进行处理，改变iso文件中的几个部分，改变同linux系统，问题在于md5的校验和需要重新处理，所需要工具比较多且比较麻烦，只做了一部分，但表明了windows下的可行性，结合之前使用树莓派对img文件的操作，在安装镜像前变可以直接进行配置，例如网络信息等等均包含在内。

接下来是使用linux系统 方法如老师所给的实验步骤一致，同过putty进行传输下载，对文件进行修改在进行下载，

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/8.png)

![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/9.png)

制作完成

对于配置文件的对比

配置键盘
![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/10.png)

配置dhcp响应等待时间
![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/11.png)

配置网卡的ip地址
![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/12.png)

配置hostname
![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/13.png)

配置userfullname 以及密码
![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/14.png)

配置时区等信息
![image](https://github.com/BurnyMcDull/image/raw/master/无人值守ubuntu镜像制作/15.png)

