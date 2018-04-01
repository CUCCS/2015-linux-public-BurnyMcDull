# 开机自启动项管理实验

## 实验录屏地址

[实战操作](https://asciinema.org/a/172185)

### 自查清单

* 如何添加一个用户并使其具备sudo执行程序的权限？
    
    * 利用visudo修改配置文件 在root  ALL=(ALL)    ALL下添加用户信息，则获得sudo执行权限

* 如何将一个用户添加到一个用户组？

    * groupadd test 添加test组
    
    * 然后使用命令
    gpasswd  -a  szy test 将szy添加入组

* 如何查看当前系统的分区表和文件系统详细信息？
    
    * sudo fdisk -l

* 如何实现开机自动挂载Virtualbox的共享目录分区？

    * 这部分实验未成功，因为他的增强功能安装部分就未实现，但查找了资料
        
        * 一种方法使用virtualbox自带的自动挂载功能
        
        * 还有一种解决开机自动挂载的方法是编辑/etc/fstab 文件，添加命令 sharing /user/share vboxsf defaults 0 0

* 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
    
    *  通过vgdisplay查看机器分区情况，发现有24M 的剩余量 机器的VG name是vg_test 通过命令 lvextend -l +6 /dev/vg_test/root 便可以执行扩容，通过+ - 符号进行缩减或者扩容的控制

* 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？

    * 对networking.service文件进行编辑，通过阅读老师给的资料，ExecStart是服务运行时候执行的脚本，ExecStop是服务停止时候运行的脚本，更改脚本地址即可

* 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？

    * 将service区块里的restart字段设置为always 在任何情况下被杀死都会进行重启

